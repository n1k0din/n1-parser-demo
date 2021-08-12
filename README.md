# Парсер n1.ru #

## Задача ##

Получить данные с сайта https://novosibirsk.n1.ru
- Нужно выбрать 10 многоэтажных домов и выгрузить из них данные о продажах квартир. А именно:
  - Адрес объявления
  - Общая площадь квартиры
  - Этаж
  - Год сдачи дома
  - Цена
  - Материал дома
  - Широта и долгота здания в котором размещено объявление
-  Автоматизировать выгрузку (например, раз в день)

Получим 10 домов и все объявления о продажах в них. Получив данные за два дня по одним и тем же домам нужно посчитать изменение средней цены кв.м. в доме.

Поднять БД на PostgreSQL(или любой другой) и загрузить туда выгруженные данные за два дня.
Итогом выполнения ТЗ будет отправленная нам структура БД и примеры любых выполненных запросов на Ваше усмотрение.

## Решение ##

### Парсер ###

Скрипт-парсер читает идентификаторы зданий из входного файла `buildings.txt` (адреса указаны для наглядности):
```
489928 Выборная, 125/1
341549 Стартовая, 1
341291 Горский, 67
...
```

Использует `requests` и `beautifulsoup`.
Для каждого здания находит на странице https://novosibirsk.n1.ru/building/ базовую информацию о доме и ссылку на объявления в этом доме. По этой ссылке собирает информацию об объявлениях в доме.
Результат работы парсера - json файл:
  ```json
  {
    "489928": {
      "search_url": "https://novosibirsk.n1.ru/search/?addresses%5B0%5D%5Bstreet_id%5D=864292&addresses%5B0%5D%5Bhouse_number%5D=125%2F1&deal_type=sell",
      "year": 2007,
      "address": "Выборная, 125/1",
      "lon": "82.9346",
      "lat": "55.0415",
      "flats": {
        "73884226": {
          "url": "https://novosibirsk.n1.ru/view/73884226/",
          "area": 50.0,
          "apartment_floor": 5,
          "max_floor": 10,
          "material": "Кирпич",
          "price": 5000000
        },
        "72923306": {
          "url": "https://novosibirsk.n1.ru/view/72923306/",
          "area": 70.0,
          "apartment_floor": 3,
          "max_floor": 10,
          "material": "Кирпич",
          "price": 7000000
        },
        "73902314": {
          "url": "https://novosibirsk.n1.ru/view/73902314/",
          "area": 50.0,
          "apartment_floor": 8,
          "max_floor": 10,
          "material": "Кирпич",
          "price": 4550000
        },  
      }  
    }
  }  
  ```

### Загрузчик в БД ###

Подключается к загружает данные из json файла в БД с нужной датой загрузки.

### База дынных ###

#### Таблица building ####

  ```sql
  CREATE TABLE public.building
  (
      building_id integer NOT NULL,
      search_url character varying(300) COLLATE pg_catalog."default",
      year smallint,
      address character varying(200) COLLATE pg_catalog."default",
      lon real,
      lat real,
      CONSTRAINT building_pkey PRIMARY KEY (building_id)
  )
  ```

#### Таблица flat_record ####

  ```sql
  CREATE TABLE public.flat_record
  (
      flat_record_id integer NOT NULL DEFAULT nextval('flat_record_flat_record_id_seq'::regclass),
      flat_id integer NOT NULL,
      record_date timestamp without time zone NOT NULL,
      building integer NOT NULL,
      url character varying(300) COLLATE pg_catalog."default",
      area real,
      apartment_floor smallint,
      max_floor smallint,
      material character varying(50) COLLATE pg_catalog."default",
      price money,
      CONSTRAINT flat_record_pkey PRIMARY KEY (flat_record_id),
      CONSTRAINT flat_record_flat_id_record_date_key UNIQUE (flat_id, record_date),
      CONSTRAINT flat_record_building_fkey FOREIGN KEY (building)
          REFERENCES public.building (building_id) MATCH SIMPLE
          ON UPDATE NO ACTION
          ON DELETE NO ACTION
          NOT VALID
  )
  ```

### Примеры запросов ###

#### Средняя стоимость квартиры в зависимости от материала дома ####

  ```sql
  SELECT
  	material,
  	AVG(price::numeric)::money
  FROM flat_record
  GROUP BY material
  ```

#### Результат ####
material | avg
---------| ---
Панель  | 2 663 000,00 ₽
Монолит | 5 043 333,33 ₽
Кирпич | 7 916 956,52 ₽
Кирпич - монолит | 5 964 033,33 ₽
пусто | 4 750 000,00 ₽

#### Средняя стомость квадрата по дням ####
  ```sql
  SELECT
  	record_date,
  	avg(price::numeric / area)
  FROM flat_record
  GROUP BY
  	record_date
  ```

##### Результат #####
record_date | avg
------------|---
2021-08-11 00:00:00 |	106361.46382414125
2021-08-12 00:00:00 |106264.37470100234

#### Изменение средней цены за квадрат по всем домам за 11-12 августа 2021 ####

  ```sql
  WITH building_date_avg_m2 AS (
  	SELECT
  		building,
  		record_date,
  		avg(price::numeric / area) as "avg_m2"
  	FROM flat_record
  	GROUP BY
  		building,
  		record_date
  )

  SELECT
  	t1.building,
  	building.address,
  	t1.avg_m2 as "11 08",
  	t2.avg_m2 as "12 08",
  	t2.avg_m2 - t1.avg_m2 as "diff"
  FROM building_date_avg_m2 t1
  INNER JOIN building_date_avg_m2 t2 ON
  	t2.building = t1.building AND
  	t1.record_date = '20210811' AND
  	t2.record_date = '20210812'
  INNER JOIN building ON
  	t1.building = building.building_id

  ```

##### Результат `11-12-diff.csv` #####

building | address | 11 08 |	12 08	| diff
---------|---------|-------|--------|-----
327082 | Ленина, 9 | 116868.43711843711 | 116398.0463980464 | -470.3907203907147
579630	Красный проспект, 157 | 106657.97625819022 | 106657.97625819022 | 0
365479 | Сухарная, 96/2 | 107109.77453028773 | 107109.77453028776 | 2.9103830456733704e-11
355180 | Некрасова, 63/1 | 100226.26301810333 | 100226.26301810333 | 0
489928 | Выборная, 125/1 | 97221.8309859155 | 97721.8309859155 | 500
341549 | Стартовая, 1 | 111498.40462326742 | 111498.40462326743 | 1.4551915228366852e-11
341291 | Горский микрорайон, 67 | 104252.7283380942 | 104252.7283380942 | 0
569706 | Петухова, 166 | 78781.18460655225 | 78781.18460655225 | 0
326581 | Максима Горького, 104 | 111311.74089068826 | 111311.74089068826 | 0
339091 | Серебренниковская, 37 | 111461.29396538598 | 111461.29396538598 | 0
