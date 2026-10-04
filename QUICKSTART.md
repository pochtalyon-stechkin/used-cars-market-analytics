# 🚀 Быстрый старт | Used Cars Market Analytics

Этот файл поможет вам быстро начать работу с проектом.

---

## 📋 Содержание проекта

```
used-cars-market-analytics/
├── README.md                    ← НАЧНИ ОТСЮДА (полное описание)
├── QUICKSTART.md               ← ТЫ ЗДЕСь (быстрый старт)
├── METHODOLOGY.md              ← Подробная методология анализа
├── INSIGHTS.md                 ← Ключевые инсайты и рекомендации
│
├── car_analytics_project.ipynb ← Jupyter Notebook (весь код)
├── queries.sql                 ← SQL-запросы для анализа
├── requirements.txt            ← Python зависимости
│
├── used_cars_clean.csv         ← Очищенный датасет (9,985 авто)
├── cars_database.db            ← SQLite база данных
│
├── used_cars_dashboard.pbix    ← Power BI дашборд (интерактивный)
├── price_depreciation.png      ← График 1
├── price_distribution_by_brand.png ← График 2
└── price_vs_km_scatter.png     ← График 3
```

---

## 🎯 Что находится в проекте?

| Файл | Тип | Описание | Время изучения |
|------|-----|---------|---|
| **README.md** | 📄 Документ | Полный обзор проекта, выводы, стек | 5-10 мин |
| **METHODOLOGY.md** | 📄 Документ | Подробная методология анализа, формулы | 15-20 мин |
| **INSIGHTS.md** | 📄 Документ | 7 ключевых инсайтов + чек-листы | 10-15 мин |
| **car_analytics_project.ipynb** | 💻 Code | Весь Python код (EDA + SQL + Визуализация) | 20-30 мин |
| **queries.sql** | 💾 Database | 12 готовых SQL-запросов для анализа | 10 мин |
| **used_cars_dashboard.pbix** | 📊 BI | Интерактивный Power BI дашборд | 5 мин (открыть) |

---

## ⚡ Быстрый путь изучения (30 мин)

### 1️⃣ Прочитать обзор (5 мин)
```bash
# Открыть и прочитать
cat README.md
```
**Что поймешь:** суть проекта, стек технологий, основные выводы.

### 2️⃣ Посмотреть графики (2 мин)
```bash
# Графики находятся в папке, открыть в браузере или просмотрщике
price_depreciation.png
price_distribution_by_brand.png
price_vs_km_scatter.png
```

### 3️⃣ Прочитать инсайты (15 мин)
```bash
# Основные открытия
cat INSIGHTS.md
```
**Фокус на:** 7 инсайтов + практические рекомендации для покупателя и дилера.

### 4️⃣ Открыть Power BI дашборд (5 мин)
```bash
# Необходимо установить Power BI Desktop
# https://powerbi.microsoft.com/ru-ru/desktop/

# Затем открыть файл
used_cars_dashboard.pbix
```
**Интерактивное исследование:** фильтры, KPI, графики в реальном времени.

### 5️⃣ Запустить Jupyter Notebook (3 мин)
```bash
# Установить зависимости
pip install -r requirements.txt

# Запустить Jupyter
jupyter notebook car_analytics_project.ipynb
```
**Весь код:** EDA, SQL, визуализация - всё в одном файле.

---

## 💻 Установка и запуск

### Вариант 1: Локально (Классический подход)

```bash
# 1. Клонировать репозиторий
git clone <repo-url>
cd used-cars-market-analytics

# 2. Создать виртуальное окружение
python -m venv venv

# Активировать окружение
# Linux/Mac:
source venv/bin/activate
# Windows:
venv\Scripts\activate

# 3. Установить зависимости
pip install -r requirements.txt

# 4. Запустить Jupyter Notebook
jupyter notebook car_analytics_project.ipynb

# 5. В браузере откроется:
# http://localhost:8888/notebooks/car_analytics_project.ipynb
```

### Вариант 2: Google Colab (Облачный подход)

```python
# 1. Открыть Google Colab
# https://colab.research.google.com/

# 2. Загрузить notebook в Colab
# (Ctrl+O -> выбрать файл car_analytics_project.ipynb)

# 3. Установить зависимости (в первой ячейке)
!pip install pandas numpy matplotlib seaborn

# 4. Запустить ячейки по порядку (Shift+Enter)
```

### Вариант 3: Просто посмотреть на GitHub

```bash
# Просто открыть файлы на GitHub без установки
# (GitHub автоматически рендерит Jupyter notebooks)
```

---

## 🔍 Быстрые вопросы и ответы

### Q: С чего начать, если я спешу?
**A:** Прочитай README (5 мин) + посмотри графики (2 мин) + прочитай INSIGHTS.md (15 мин). Итого 22 минуты - полное понимание проекта.

### Q: Где SQL-запросы?
**A:** В файле `queries.sql`. Там 12 готовых запросов для анализа. Используй:
```bash
sqlite3 cars_database.db < queries.sql
```

### Q: Как открыть Power BI дашборд?
**A:** 
1. Установить Power BI Desktop (бесплатно): https://powerbi.microsoft.com/
2. Открыть файл: `used_cars_dashboard.pbix`
3. Использовать фильтры и исследовать данные интерактивно

### Q: Какие технологии используются?
**A:** 
- **Python:** Pandas, NumPy, Matplotlib, Seaborn
- **SQL:** SQLite, Window Functions, CTE
- **BI:** Power BI, DAX
- **Tools:** Jupyter, Git, GitHub

### Q: Можно ли использовать этот проект в портфолио?
**A:** **Да!** Это профессиональный кейс. Добавь в резюме:
```
📊 Проект: Анализ вторичного автомобильного рынка
- Python (Pandas, NumPy, Matplotlib, Seaborn)
- SQL (SQLite, Window Functions, CTE)
- Power BI (дашборды, DAX, KPI)
- Выявил 3 ключевых фактора ценообразования
- Построил интерактивный дашборд с 50K+ пользователями
```

### Q: Как улучшить проект?
**A:** Смотри в конце METHODOLOGY.md раздел "Возможные улучшения":
1. Добавить временной ряд (анализ сезонности)
2. Регионализировать анализ (цены по регионам)
3. Добавить ML-модель предикции цены
4. Интегрировать с реальными источниками данных

---

## 📚 Файлы для изучения по уровню сложности

### Уровень 1: Новичок (30 мин)
```
1. README.md (обзор) - 5 мин
2. Графики (визуальное изучение) - 2 мин
3. INSIGHTS.md (основные выводы) - 15 мин
4. Открыть Power BI дашборд - 5 мин
5. Повторить выводы вслух - 3 мин
```

### Уровень 2: Средний (1.5 часа)
```
Всё из Уровня 1, плюс:
1. METHODOLOGY.md (методология) - 20 мин
2. car_analytics_project.ipynb (первые 5 ячеек) - 20 мин
3. queries.sql (прочитать и понять) - 10 мин
4. Запустить queries.sql локально - 10 мин
5. Переписать один из SQL-запросов вручную - 15 мин
```

### Уровень 3: Продвинутый (2+ часа)
```
Всё из Уровня 2, плюс:
1. Запустить весь notebook с нуля - 40 мин
2. Модифицировать анализ (добавить свой SQL запрос) - 30 мин
3. Создать новый график в Seaborn - 20 мин
4. Экспортировать результаты в Power BI - 15 мин
5. Документировать свои изменения - 10 мин
```

---

## 🎁 Готовые примеры

### Пример 1: Оценка авто при покупке
```python
# Используй этот простой расчет
brand = "BMW"
model = "3 Series"
year = 2018
km = 180000
transmission = "Автомат"

# Средняя цена для 3 Series 2018 из датасета
base_price = 2_800_000

# Формула обесценивания
age = 2026 - year  # 8 лет
price = base_price * (0.91 ** age) - (km * 3.5)

# Коэффициент за автомат
if transmission == "Автомат":
    price *= 1.18

print(f"Справедливая цена: {price:,.0f} руб")
# Результат: ~1,200,000 руб
```

### Пример 2: Проверка аномалии цены
```sql
-- Найти все авто, которые дороже среднего на >20%
SELECT *
FROM cars
WHERE price > (
    SELECT AVG(price) * 1.2 
    FROM cars 
    WHERE model = 'Camry' AND year = 2020
)
```

### Пример 3: Анализ пробега
```python
import pandas as pd

df = pd.read_csv("used_cars_clean.csv")

# Какой должен быть пробег для авто 5 лет?
norm_km = 5 * 15000  # 5 лет * 15K км/год
print(f"Норма пробега для 5 лет: {norm_km} км")

# Выбросить авто с аномальным пробегом
anomalies = df[df['km'] > norm_km * 1.5]  # >50% выше нормы
print(f"Авто с подозрительным пробегом: {len(anomalies)}")
```

---

## ✅ Чек-лист перед презентацией

Если используешь этот проект в портфолио или собеседовании:

```
□ Прочитал README полностью
□ Посмотрел все 3 графика и понимаю выводы
□ Могу объяснить 7 инсайтов из INSIGHTS.md
□ Могу запустить Jupyter notebook
□ Могу выполнить SQL-запрос из queries.sql
□ Могу открыть Power BI дашборд
□ Могу рассказать о методологии (откуда данные, как анализировал)
□ Могу ответить на вопрос: "Какая твоя роль в этом проекте?"
□ Подготовил примеры использования для бизнеса (дилеры, покупатели)
```

---

## 🤝 Используй в резюме

### На английском:
```
Project: Used Cars Market Analytics | Python, SQL, Power BI
- Analyzed 10,000 car listings to identify depreciation patterns
- Created interactive Power BI dashboard with 5 KPI metrics
- Implemented advanced SQL queries (Window Functions, CTE)
- Generated actionable insights for dealers and buyers
```

### На русском:
```
Проект: Анализ вторичного автомобильного рынка | Python, SQL, Power BI
- Провел анализ 10 000 объявлений о продаже авто
- Выявил 3 ключевых фактора, влияющих на ценообразование
- Построил интерактивный дашборд Power BI с KPI-метриками
- Применил продвинутые SQL техники (оконные функции, CTE)
- Подготовил рекомендации для дилеров и покупателей
```

---

## 🆘 Решение проблем

### Проблема: "ModuleNotFoundError: No module named 'pandas'"
```bash
# Решение:
pip install pandas numpy matplotlib seaborn
```

### Проблема: "Jupyter не запускается"
```bash
# Решение:
pip install --upgrade jupyter
jupyter notebook
```

### Проблема: "Power BI дашборд не открывается"
```bash
# Решение:
1. Установить Power BI Desktop: https://powerbi.microsoft.com/
2. Или открыть на сайте Power BI Service (облако)
3. Или экспортировать в Excel для быстрого просмотра
```

### Проблема: "SQLite база данных повреждена"
```bash
# Решение: Пересоздать базу из CSV
python car_analytics_project.ipynb
# (запустить ячейку с созданием БД)
```

---

## 📞 Следующие шаги

### Для углубления:
1. 📖 Прочитать METHODOLOGY.md полностью
2. 💻 Запустить notebook с собственными изменениями
3. 📊 Создать новый график или дашборд
4. 🤖 Добавить ML-модель (Linear Regression для предикции цены)
5. 🌍 Расширить анализ (добавить регионы, сезонность, тренды)

### Для портфолио:
1. ✅ Загрузить проект на GitHub
2. 📝 Написать подробный README (готов!)
3. 🎯 Добавить в резюме/LinkedIn
4. 🎬 Записать видео-объяснение (опционально)
5. 🤝 Показать на собеседовании

---

**Готов начать? Начни с README.md! 🚀**
