-- ============================================================================
-- SQL QUERIES FOR USED CARS MARKET ANALYTICS
-- Database: cars_database.db
-- ============================================================================

-- ============================================================================
-- 1. БАЗОВАЯ СТАТИСТИКА ПО БРЕНДАМ
-- ============================================================================
-- Показывает: общее количество авто, среднюю цену, возраст и пробег по брендам
-- Применение: понимание доли каждого бренда на рынке

SELECT
    brand,
    COUNT(*) as total_cars,
    ROUND(AVG(price), 0) as avg_price,
    ROUND(AVG(car_age), 1) as avg_age,
    ROUND(AVG(km), 0) as avg_km,
    ROUND(MIN(price), 0) as min_price,
    ROUND(MAX(price), 0) as max_price
FROM cars
GROUP BY brand
ORDER BY total_cars DESC;

-- ============================================================================
-- 2. КРИВАЯ ОБЕСЦЕНИВАНИЯ (DEPRECIATION CURVE)
-- ============================================================================
-- Показывает: среднюю цену в зависимости от возраста
-- Применение: анализ потери стоимости с годами

SELECT
    car_age,
    COUNT(*) as count_cars,
    ROUND(AVG(price), 0) as avg_price,
    ROUND(AVG(km), 0) as avg_km,
    ROUND(AVG(price) / (
        SELECT AVG(price) FROM cars WHERE car_age = 0
    ), 2) as price_percent_of_new
FROM cars
WHERE car_age <= 18
GROUP BY car_age
ORDER BY car_age ASC;

-- ============================================================================
-- 3. ВЫЯВЛЕНИЕ АНОМАЛИЙ ЦЕНООБРАЗОВАНИЯ (ПЕРЕОЦЕНЕННЫЕ АВТО)
-- ============================================================================
-- Показывает: авто, которые стоят значительно дороже рынка
-- Применение: выявление переоценки, поиск лучших предложений

SELECT
    brand,
    model,
    year,
    car_age,
    km,
    price,
    ROUND(AVG(price) OVER(PARTITION BY model, year), 0) as avg_market_price,
    ROUND(price - AVG(price) OVER(PARTITION BY model, year), 0) as price_diff,
    ROUND((price - AVG(price) OVER(PARTITION BY model, year)) /
           AVG(price) OVER(PARTITION BY model, year) * 100, 1) as percent_diff
FROM cars
WHERE year >= 2020  -- фокусируемся на новые авто для прямого сравнения
ORDER BY percent_diff DESC
LIMIT 20;

-- ============================================================================
-- 4. ЛУЧШИЕ ПРЕДЛОЖЕНИЯ (CHEAPEST CARS IN EACH MODEL)
-- ============================================================================
-- Показывает: самое дешевое предложение для каждой модели (молодые авто)
-- Применение: поиск лучших deals, сравнение цен

WITH RankedCars AS (
    SELECT
        brand,
        model,
        year,
        car_age,
        km,
        transmission,
        price,
        ROW_NUMBER() OVER(PARTITION BY model ORDER BY price ASC) as price_rank
    FROM cars
    WHERE car_age <= 5
)
SELECT
    brand,
    model,
    year,
    car_age,
    km,
    transmission,
    price,
    ROUND(km / car_age, 0) as km_per_year
FROM RankedCars
WHERE price_rank = 1
ORDER BY price ASC
LIMIT 20;

-- ============================================================================
-- 5. ВЛИЯНИЕ ТРАНСМИССИИ НА ЦЕНУ
-- ============================================================================
-- Показывает: насколько автомат дороже механики при прочих равных
-- Применение: оценка премии за тип коробки

SELECT
    brand,
    model,
    year,
    transmission,
    COUNT(*) as count_cars,
    ROUND(AVG(price), 0) as avg_price,
    ROUND(AVG(km), 0) as avg_km,
    ROUND(AVG(car_age), 1) as avg_age
FROM cars
WHERE year >= 2018  -- фокус на молодые авто для честного сравнения
GROUP BY brand, model, year, transmission
HAVING COUNT(*) >= 3  -- минимум 3 авто каждого типа трансмиссии
ORDER BY brand, model, year, transmission DESC;

-- ============================================================================
-- 6. ВОЛАТИЛЬНОСТЬ ЦЕН ПО БРЕНДАМ (СТАНДАРТНОЕ ОТКЛОНЕНИЕ)
-- ============================================================================
-- Показывает: разброс цен для каждого бренда (вариативность рынка)
-- Применение: анализ стабильности цен, определение премиум vs массовых авто

SELECT
    brand,
    COUNT(*) as total_cars,
    ROUND(AVG(price), 0) as avg_price,
    ROUND(STDEV(price), 0) as std_dev,
    ROUND(STDEV(price) / AVG(price) * 100, 1) as coefficient_variation,
    ROUND(MIN(price), 0) as min_price,
    ROUND(MAX(price), 0) as max_price
FROM cars
GROUP BY brand
ORDER BY coefficient_variation DESC;

-- ============================================================================
-- 7. АНАЛИЗ ПРОБЕГА ПО ВОЗРАСТУ
-- ============================================================================
-- Показывает: средний пробег в зависимости от возраста
-- Применение: определение норм пробега, выявление аномалий пробега

SELECT
    car_age,
    ROUND(AVG(km), 0) as avg_km,
    ROUND(STDEV(km), 0) as std_km,
    ROUND(AVG(km_per_year), 0) as avg_km_per_year,
    COUNT(*) as count_cars
FROM cars
GROUP BY car_age
ORDER BY car_age ASC;

-- ============================================================================
-- 8. СЕГМЕНТАЦИЯ ПО ЦЕНОВЫМ КАТЕГОРИЯМ
-- ============================================================================
-- Показывает: распределение авто по ценовым диапазонам
-- Применение: анализ рыночных сегментов

SELECT
    CASE
        WHEN price < 400_000 THEN 'Budget (< 400K)'
        WHEN price < 700_000 THEN 'Economy (400-700K)'
        WHEN price < 1_200_000 THEN 'Mid-range (700-1200K)'
        WHEN price < 2_000_000 THEN 'Premium (1200-2000K)'
        ELSE 'Luxury (> 2000K)'
    END as price_segment,
    COUNT(*) as count_cars,
    ROUND(AVG(price), 0) as avg_price,
    ROUND(AVG(car_age), 1) as avg_age,
    ROUND(AVG(km), 0) as avg_km
FROM cars
GROUP BY price_segment
ORDER BY avg_price ASC;

-- ============================================================================
-- 9. МАРКИ И МОДЕЛИ С НАИБОЛЬШИМ РАЗБРОСОМ ЦЕН
-- ============================================================================
-- Показывает: модели с высокой волатильностью цен (возможно переоценки)
-- Применение: выявление рисковых моделей, особое внимание при оценке

SELECT
    brand,
    model,
    COUNT(*) as count_cars,
    ROUND(AVG(price), 0) as avg_price,
    ROUND(STDEV(price), 0) as std_dev,
    ROUND(STDEV(price) / AVG(price) * 100, 1) as variation_percent,
    ROUND(MIN(price), 0) as min_price,
    ROUND(MAX(price), 0) as max_price
FROM cars
WHERE COUNT(*) >= 5
GROUP BY brand, model
HAVING COUNT(*) >= 5
ORDER BY variation_percent DESC
LIMIT 15;

-- ============================================================================
-- 10. ДИНАМИКА ЦЕНЫ ПО ВОЗРАСТУ И ТРАНСМИССИИ
-- ============================================================================
-- Показывает: как возраст влияет на цену для разных типов трансмиссии
-- Применение: анализ влияния факторов на цену

SELECT
    car_age,
    transmission,
    COUNT(*) as count_cars,
    ROUND(AVG(price), 0) as avg_price,
    ROUND(AVG(km), 0) as avg_km
FROM cars
WHERE car_age <= 10
GROUP BY car_age, transmission
ORDER BY car_age ASC, transmission;

-- ============================================================================
-- 11. АНАЛИЗ МУЛЬТИКОРРЕЛЯЦИИ (ФАКТОРЫ ЦЕНЫ)
-- ============================================================================
-- Показывает: какие факторы больше всего влияют на цену
-- Применение: выявление ключевых факторов ценообразования

SELECT
    brand,
    ROUND(AVG(price), 0) as avg_price_by_brand,
    (SELECT ROUND(AVG(price), 0) FROM cars) as overall_avg_price,
    ROUND(ROUND(AVG(price), 0) / (SELECT AVG(price) FROM cars) * 100 - 100, 1) as brand_premium_percent
FROM cars
GROUP BY brand
ORDER BY brand_premium_percent DESC;

-- ============================================================================
-- 12. ПОЛНОТА ДАННЫХ И СТАТИСТИКА КОНТРОЛЯ КАЧЕСТВА
-- ============================================================================
-- Показывает: общую статистику по датасету (контроль качества)
-- Применение: проверка целостности данных

SELECT
    COUNT(*) as total_records,
    COUNT(DISTINCT brand) as unique_brands,
    COUNT(DISTINCT model) as unique_models,
    COUNT(DISTINCT year) as year_range,
    COUNT(DISTINCT transmission) as transmission_types,
    ROUND(AVG(price), 0) as avg_price,
    ROUND(AVG(car_age), 1) as avg_car_age,
    ROUND(AVG(km), 0) as avg_mileage,
    MIN(year) as oldest_year,
    MAX(year) as newest_year
FROM cars;

-- ============================================================================
-- ДОП: ЭКСПОРТ ДАННЫХ ДЛЯ POWER BI (CSV)
-- ============================================================================
-- Запрос для экспорта в CSV для использования в Power BI

SELECT
    brand,
    model,
    year,
    car_age,
    km,
    km_per_year,
    transmission,
    drivetrain,
    body,
    price
FROM cars
ORDER BY brand, model, year DESC;
-- Результат можно экспортировать как CSV и загрузить в Power BI
