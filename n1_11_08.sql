--
-- PostgreSQL database dump
--

-- Dumped from database version 12.7
-- Dumped by pg_dump version 12.7

-- Started on 2021-08-12 12:18:36

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 3 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 2834 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 202 (class 1259 OID 16394)
-- Name: building; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.building (
    building_id integer NOT NULL,
    search_url character varying(300),
    year smallint,
    address character varying(200),
    lon real,
    lat real
);


ALTER TABLE public.building OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 16406)
-- Name: flat_record; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.flat_record (
    flat_record_id integer NOT NULL,
    flat_id integer NOT NULL,
    record_date timestamp without time zone NOT NULL,
    building integer NOT NULL,
    url character varying(300),
    area real,
    apartment_floor smallint,
    max_floor smallint,
    material character varying(50),
    price money
);


ALTER TABLE public.flat_record OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 16404)
-- Name: flat_record_flat_record_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.flat_record_flat_record_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.flat_record_flat_record_id_seq OWNER TO postgres;

--
-- TOC entry 2835 (class 0 OID 0)
-- Dependencies: 203
-- Name: flat_record_flat_record_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.flat_record_flat_record_id_seq OWNED BY public.flat_record.flat_record_id;


--
-- TOC entry 2692 (class 2604 OID 16409)
-- Name: flat_record flat_record_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.flat_record ALTER COLUMN flat_record_id SET DEFAULT nextval('public.flat_record_flat_record_id_seq'::regclass);


--
-- TOC entry 2826 (class 0 OID 16394)
-- Dependencies: 202
-- Data for Name: building; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.building (building_id, search_url, year, address, lon, lat) FROM stdin;
327082	https://novosibirsk.n1.ru/search/?addresses%5B0%5D%5Bstreet_id%5D=864816&addresses%5B0%5D%5Bhouse_number%5D=9&deal_type=sell	1958	Ленина, 9	55.029224	82.91356
579630	https://novosibirsk.n1.ru/search/?addresses%5B0%5D%5Bstreet_id%5D=864752&addresses%5B0%5D%5Bhouse_number%5D=157&deal_type=sell	1959	Красный проспект, 157	55.058167	82.912285
365479	https://novosibirsk.n1.ru/search/?addresses%5B0%5D%5Bstreet_id%5D=865373&addresses%5B0%5D%5Bhouse_number%5D=96%2F2&deal_type=sell	2016	Сухарная, 96/2	55.045956	82.86477
355180	https://novosibirsk.n1.ru/search/?addresses%5B0%5D%5Bstreet_id%5D=864939&addresses%5B0%5D%5Bhouse_number%5D=63%2F1&deal_type=sell	2014	Некрасова, 63/1	55.047516	82.9369
489928	https://novosibirsk.n1.ru/search/?addresses%5B0%5D%5Bstreet_id%5D=864292&addresses%5B0%5D%5Bhouse_number%5D=125%2F1&deal_type=sell	2007	Выборная, 125/1	55.003445	83.02068
341549	https://novosibirsk.n1.ru/search/?addresses%5B0%5D%5Bstreet_id%5D=865348&addresses%5B0%5D%5Bhouse_number%5D=1&deal_type=sell	2020	Стартовая, 1	54.99864	82.90753
341291	https://novosibirsk.n1.ru/search/?addresses%5B0%5D%5Bstreet_id%5D=864344&addresses%5B0%5D%5Bhouse_number%5D=67&deal_type=sell	2009	Горский микрорайон, 67	54.995583	82.89217
569706	https://novosibirsk.n1.ru/search/?addresses%5B0%5D%5Bstreet_id%5D=865074&addresses%5B0%5D%5Bhouse_number%5D=166&deal_type=sell	2015	Петухова, 166	54.93788	82.95377
326581	https://novosibirsk.n1.ru/search/?addresses%5B0%5D%5Bstreet_id%5D=864351&addresses%5B0%5D%5Bhouse_number%5D=104&deal_type=sell	1977	Максима Горького, 104	55.02794	82.931786
339091	https://novosibirsk.n1.ru/search/?addresses%5B0%5D%5Bstreet_id%5D=865282&addresses%5B0%5D%5Bhouse_number%5D=37&deal_type=sell	1995	Серебренниковская, 37	55.02878	82.923996
\.


--
-- TOC entry 2828 (class 0 OID 16406)
-- Dependencies: 204
-- Data for Name: flat_record; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.flat_record (flat_record_id, flat_id, record_date, building, url, area, apartment_floor, max_floor, material, price) FROM stdin;
1	73884226	2021-08-12 00:00:00	489928	https://novosibirsk.n1.ru/view/73884226/	50	5	10	Кирпич	5 000 000,00 ₽
406	73665642	2021-08-11 00:00:00	579630	https://novosibirsk.n1.ru/view/73665642/	72	4	7	Кирпич	7 900 000,00 ₽
407	73854017	2021-08-11 00:00:00	579630	https://novosibirsk.n1.ru/view/73854017/	80	3	7	Кирпич	6 850 000,00 ₽
408	73609764	2021-08-11 00:00:00	579630	https://novosibirsk.n1.ru/view/73609764/	95	3	7	Кирпич	12 000 000,00 ₽
409	73739546	2021-08-11 00:00:00	579630	https://novosibirsk.n1.ru/view/73739546/	47	6	6	Кирпич	5 690 000,00 ₽
410	73732596	2021-08-11 00:00:00	579630	https://novosibirsk.n1.ru/view/73732596/	49	2	6	Кирпич	5 650 000,00 ₽
411	73633063	2021-08-11 00:00:00	579630	https://novosibirsk.n1.ru/view/73633063/	94	5	7	Кирпич	7 700 000,00 ₽
412	73816114	2021-08-11 00:00:00	365479	https://novosibirsk.n1.ru/view/73816114/	29	9	16	Монолит	3 600 000,00 ₽
413	73786914	2021-08-11 00:00:00	365479	https://novosibirsk.n1.ru/view/73786914/	105	17	17	Монолит	8 990 000,00 ₽
414	73747057	2021-08-11 00:00:00	365479	https://novosibirsk.n1.ru/view/73747057/	90	12	17	Монолит	9 500 000,00 ₽
415	73080599	2021-08-11 00:00:00	365479	https://novosibirsk.n1.ru/view/73080599/	26	11	17	Кирпич - монолит	3 580 000,00 ₽
416	73700844	2021-08-11 00:00:00	365479	https://novosibirsk.n1.ru/view/73700844/	29	9	17	Монолит	3 600 000,00 ₽
417	73884752	2021-08-11 00:00:00	365479	https://novosibirsk.n1.ru/view/73884752/	105	17	17	Кирпич	9 000 000,00 ₽
418	73881808	2021-08-11 00:00:00	365479	https://novosibirsk.n1.ru/view/73881808/	59	9	17	Кирпич	5 550 000,00 ₽
419	73807309	2021-08-11 00:00:00	365479	https://novosibirsk.n1.ru/view/73807309/	40	16	17	Кирпич	4 980 000,00 ₽
420	72760635	2021-08-11 00:00:00	365479	https://novosibirsk.n1.ru/view/72760635/	92	6	17	Кирпич - монолит	9 300 000,00 ₽
421	73725640	2021-08-11 00:00:00	365479	https://novosibirsk.n1.ru/view/73725640/	103	12	17	Кирпич - монолит	8 100 000,00 ₽
422	73697214	2021-08-11 00:00:00	365479	https://novosibirsk.n1.ru/view/73697214/	25	9	17	Кирпич - монолит	3 560 000,00 ₽
423	72680361	2021-08-11 00:00:00	365479	https://novosibirsk.n1.ru/view/72680361/	85	2	17	Кирпич - монолит	6 950 000,00 ₽
424	73360052	2021-08-11 00:00:00	355180	https://novosibirsk.n1.ru/view/73360052/	59	10	17	Кирпич - монолит	7 199 000,00 ₽
425	72137544	2021-08-11 00:00:00	355180	https://novosibirsk.n1.ru/view/72137544/	144	17	17	Кирпич	14 100 000,00 ₽
426	72714406	2021-08-11 00:00:00	355180	https://novosibirsk.n1.ru/view/72714406/	85	4	17	Кирпич - монолит	8 100 000,00 ₽
427	73845893	2021-08-11 00:00:00	355180	https://novosibirsk.n1.ru/view/73845893/	150	17	18	Кирпич	14 100 000,00 ₽
428	73110808	2021-08-11 00:00:00	355180	https://novosibirsk.n1.ru/view/73110808/	105	17	18	Кирпич	9 880 000,00 ₽
429	72458765	2021-08-11 00:00:00	355180	https://novosibirsk.n1.ru/view/72458765/	69	7	18	Кирпич	7 700 000,00 ₽
430	73105420	2021-08-11 00:00:00	355180	https://novosibirsk.n1.ru/view/73105420/	105	17	18	Кирпич - монолит	9 100 000,00 ₽
323	73884226	2021-08-11 00:00:00	489928	https://novosibirsk.n1.ru/view/73884226/	50	5	10	Кирпич	5 000 000,00 ₽
324	72923306	2021-08-11 00:00:00	489928	https://novosibirsk.n1.ru/view/72923306/	70	3	10	Кирпич	7 000 000,00 ₽
325	73902314	2021-08-11 00:00:00	489928	https://novosibirsk.n1.ru/view/73902314/	50	8	10	Кирпич	4 550 000,00 ₽
326	73594125	2021-08-11 00:00:00	489928	https://novosibirsk.n1.ru/view/73594125/	71	10	10	Кирпич	6 950 000,00 ₽
327	73143254	2021-08-11 00:00:00	341549	https://novosibirsk.n1.ru/view/73143254/	70	16	18	Кирпич - монолит	9 950 000,00 ₽
328	73870698	2021-08-11 00:00:00	341549	https://novosibirsk.n1.ru/view/73870698/	36	13	17	Кирпич - монолит	3 960 000,00 ₽
329	73838688	2021-08-11 00:00:00	341549	https://novosibirsk.n1.ru/view/73838688/	86	4	17	Кирпич - монолит	9 200 000,00 ₽
330	73727748	2021-08-11 00:00:00	341549	https://novosibirsk.n1.ru/view/73727748/	80	1	17	Кирпич	6 700 000,00 ₽
331	73688480	2021-08-11 00:00:00	341549	https://novosibirsk.n1.ru/view/73688480/	85	7	18	Кирпич - монолит	9 390 000,00 ₽
332	73862323	2021-08-11 00:00:00	341549	https://novosibirsk.n1.ru/view/73862323/	43	9	17	Кирпич	4 700 000,00 ₽
333	73683928	2021-08-11 00:00:00	341549	https://novosibirsk.n1.ru/view/73683928/	41	2	15	Монолит	4 100 000,00 ₽
334	72721377	2021-08-11 00:00:00	341549	https://novosibirsk.n1.ru/view/72721377/	84	2	15	Кирпич	7 470 000,00 ₽
335	71174680	2021-08-11 00:00:00	341549	https://novosibirsk.n1.ru/view/71174680/	99	18	19	Кирпич	8 969 000,00 ₽
336	73261918	2021-08-11 00:00:00	341549	https://novosibirsk.n1.ru/view/73261918/	44	3	17	Кирпич	4 800 000,00 ₽
337	73861563	2021-08-11 00:00:00	341549	https://novosibirsk.n1.ru/view/73861563/	37	19	19	Кирпич - монолит	4 100 000,00 ₽
338	73900200	2021-08-11 00:00:00	341549	https://novosibirsk.n1.ru/view/73900200/	44	8	19	Кирпич - монолит	5 100 000,00 ₽
339	72912050	2021-08-11 00:00:00	341549	https://novosibirsk.n1.ru/view/72912050/	44	6	19	Кирпич - монолит	5 100 000,00 ₽
340	72544556	2021-08-11 00:00:00	341549	https://novosibirsk.n1.ru/view/72544556/	36	12	19	Кирпич	3 980 000,00 ₽
341	72308655	2021-08-11 00:00:00	341549	https://novosibirsk.n1.ru/view/72308655/	38	14	16	Кирпич - монолит	4 000 000,00 ₽
342	71384346	2021-08-11 00:00:00	341549	https://novosibirsk.n1.ru/view/71384346/	34	4	19	Кирпич	3 750 000,00 ₽
343	72967993	2021-08-11 00:00:00	341549	https://novosibirsk.n1.ru/view/72967993/	33	10	17	Кирпич - монолит	3 900 000,00 ₽
344	73793215	2021-08-11 00:00:00	341549	https://novosibirsk.n1.ru/view/73793215/	98	3	18	Кирпич	9 200 000,00 ₽
345	73884530	2021-08-11 00:00:00	341549	https://novosibirsk.n1.ru/view/73884530/	68	9	18	Кирпич	7 500 000,00 ₽
346	73041565	2021-08-11 00:00:00	341549	https://novosibirsk.n1.ru/view/73041565/	48	9	18	Кирпич	5 500 000,00 ₽
347	73678466	2021-08-11 00:00:00	341549	https://novosibirsk.n1.ru/view/73678466/	81	11	18	Кирпич	7 500 000,00 ₽
348	73678418	2021-08-11 00:00:00	341549	https://novosibirsk.n1.ru/view/73678418/	99	18	19	Кирпич	8 700 000,00 ₽
349	73616811	2021-08-11 00:00:00	341549	https://novosibirsk.n1.ru/view/73616811/	45	6	15	Кирпич	5 100 000,00 ₽
350	73867430	2021-08-11 00:00:00	341549	https://novosibirsk.n1.ru/view/73867430/	48	4	18	Кирпич	5 670 000,00 ₽
351	73758577	2021-08-11 00:00:00	341549	https://novosibirsk.n1.ru/view/73758577/	23	5	18	Кирпич	3 500 000,00 ₽
352	73224086	2021-08-11 00:00:00	341549	https://novosibirsk.n1.ru/view/73224086/	108	10	18	Кирпич	8 300 000,00 ₽
353	73049549	2021-08-11 00:00:00	341549	https://novosibirsk.n1.ru/view/73049549/	37	14	18	Кирпич	3 980 000,00 ₽
354	73853745	2021-08-11 00:00:00	341549	https://novosibirsk.n1.ru/view/73853745/	29	14	18	Кирпич	4 200 000,00 ₽
355	73750603	2021-08-11 00:00:00	341549	https://novosibirsk.n1.ru/view/73750603/	32	15	17	Кирпич - монолит	4 500 000,00 ₽
356	73899935	2021-08-11 00:00:00	341549	https://novosibirsk.n1.ru/view/73899935/	90	12	18	Кирпич	17 950 000,00 ₽
357	73796489	2021-08-11 00:00:00	341549	https://novosibirsk.n1.ru/view/73796489/	81	12	15	Кирпич	8 536 000,00 ₽
358	73191630	2021-08-11 00:00:00	341549	https://novosibirsk.n1.ru/view/73191630/	84	2	17	Кирпич	7 470 000,00 ₽
359	73785581	2021-08-11 00:00:00	341549	https://novosibirsk.n1.ru/view/73785581/	107	4	18	Кирпич	7 500 000,00 ₽
360	73828503	2021-08-11 00:00:00	341549	https://novosibirsk.n1.ru/view/73828503/	110	6	19	Кирпич	13 500 000,00 ₽
361	73840758	2021-08-11 00:00:00	341549	https://novosibirsk.n1.ru/view/73840758/	38	2	17	Кирпич	4 060 000,00 ₽
362	73771464	2021-08-11 00:00:00	341549	https://novosibirsk.n1.ru/view/73771464/	69	9	18	Кирпич	7 850 000,00 ₽
363	73771459	2021-08-11 00:00:00	341549	https://novosibirsk.n1.ru/view/73771459/	65	7	18	Кирпич	7 350 000,00 ₽
364	73741445	2021-08-11 00:00:00	341549	https://novosibirsk.n1.ru/view/73741445/	67	7	17	Кирпич - монолит	7 349 000,00 ₽
365	73895574	2021-08-11 00:00:00	341549	https://novosibirsk.n1.ru/view/73895574/	33	10	18	Кирпич - монолит	3 900 000,00 ₽
366	73788999	2021-08-11 00:00:00	341549	https://novosibirsk.n1.ru/view/73788999/	68	9	18	Кирпич - монолит	7 840 000,00 ₽
2	72923306	2021-08-12 00:00:00	489928	https://novosibirsk.n1.ru/view/72923306/	70	3	10	Кирпич	7 000 000,00 ₽
3	73902314	2021-08-12 00:00:00	489928	https://novosibirsk.n1.ru/view/73902314/	50	8	10	Кирпич	4 650 000,00 ₽
4	73594125	2021-08-12 00:00:00	489928	https://novosibirsk.n1.ru/view/73594125/	71	10	10	Кирпич	6 950 000,00 ₽
5	73143254	2021-08-12 00:00:00	341549	https://novosibirsk.n1.ru/view/73143254/	70	16	18	Кирпич - монолит	9 950 000,00 ₽
6	73870698	2021-08-12 00:00:00	341549	https://novosibirsk.n1.ru/view/73870698/	36	13	17	Кирпич - монолит	3 960 000,00 ₽
7	73838688	2021-08-12 00:00:00	341549	https://novosibirsk.n1.ru/view/73838688/	86	4	17	Кирпич - монолит	9 200 000,00 ₽
8	73727748	2021-08-12 00:00:00	341549	https://novosibirsk.n1.ru/view/73727748/	80	1	17	Кирпич	6 700 000,00 ₽
9	73688480	2021-08-12 00:00:00	341549	https://novosibirsk.n1.ru/view/73688480/	85	7	18	Кирпич - монолит	9 390 000,00 ₽
23	73884530	2021-08-12 00:00:00	341549	https://novosibirsk.n1.ru/view/73884530/	68	9	18	Кирпич	7 500 000,00 ₽
24	73041565	2021-08-12 00:00:00	341549	https://novosibirsk.n1.ru/view/73041565/	48	9	18	Кирпич	5 500 000,00 ₽
25	73678466	2021-08-12 00:00:00	341549	https://novosibirsk.n1.ru/view/73678466/	81	11	18	Кирпич	7 500 000,00 ₽
54	73803139	2021-08-12 00:00:00	341549	https://novosibirsk.n1.ru/view/73803139/	49	11	18	Кирпич	6 400 000,00 ₽
26	73678418	2021-08-12 00:00:00	341549	https://novosibirsk.n1.ru/view/73678418/	99	18	19	Кирпич	8 700 000,00 ₽
27	73616811	2021-08-12 00:00:00	341549	https://novosibirsk.n1.ru/view/73616811/	45	6	15	Кирпич	5 100 000,00 ₽
28	73867430	2021-08-12 00:00:00	341549	https://novosibirsk.n1.ru/view/73867430/	48	4	18	Кирпич	5 670 000,00 ₽
29	73758577	2021-08-12 00:00:00	341549	https://novosibirsk.n1.ru/view/73758577/	23	5	18	Кирпич	3 500 000,00 ₽
30	73224086	2021-08-12 00:00:00	341549	https://novosibirsk.n1.ru/view/73224086/	108	10	18	Кирпич	8 300 000,00 ₽
31	73049549	2021-08-12 00:00:00	341549	https://novosibirsk.n1.ru/view/73049549/	37	14	18	Кирпич	3 980 000,00 ₽
32	73853745	2021-08-12 00:00:00	341549	https://novosibirsk.n1.ru/view/73853745/	29	14	18	Кирпич	4 200 000,00 ₽
34	73899935	2021-08-12 00:00:00	341549	https://novosibirsk.n1.ru/view/73899935/	90	12	18	Кирпич	17 950 000,00 ₽
35	73796489	2021-08-12 00:00:00	341549	https://novosibirsk.n1.ru/view/73796489/	81	12	15	Кирпич	8 536 000,00 ₽
37	73785581	2021-08-12 00:00:00	341549	https://novosibirsk.n1.ru/view/73785581/	107	4	18	Кирпич	7 500 000,00 ₽
38	73828503	2021-08-12 00:00:00	341549	https://novosibirsk.n1.ru/view/73828503/	110	6	19	Кирпич	13 500 000,00 ₽
39	73840758	2021-08-12 00:00:00	341549	https://novosibirsk.n1.ru/view/73840758/	38	2	17	Кирпич	4 060 000,00 ₽
22	73793215	2021-08-12 00:00:00	341549	https://novosibirsk.n1.ru/view/73793215/	98	3	18	Кирпич	9 200 000,00 ₽
43	73895574	2021-08-12 00:00:00	341549	https://novosibirsk.n1.ru/view/73895574/	33	10	18	Кирпич - монолит	3 900 000,00 ₽
44	73788999	2021-08-12 00:00:00	341549	https://novosibirsk.n1.ru/view/73788999/	68	9	18	Кирпич - монолит	7 840 000,00 ₽
45	73632105	2021-08-12 00:00:00	341549	https://novosibirsk.n1.ru/view/73632105/	36	13	15	Кирпич - монолит	3 960 000,00 ₽
46	72853229	2021-08-12 00:00:00	341549	https://novosibirsk.n1.ru/view/72853229/	23	10	18	Кирпич - монолит	3 200 000,00 ₽
47	73836830	2021-08-12 00:00:00	341549	https://novosibirsk.n1.ru/view/73836830/	35	12	18	Кирпич - монолит	4 000 000,00 ₽
42	73741445	2021-08-12 00:00:00	341549	https://novosibirsk.n1.ru/view/73741445/	67	7	17	Кирпич - монолит	7 349 000,00 ₽
48	73835882	2021-08-12 00:00:00	341549	https://novosibirsk.n1.ru/view/73835882/	81	12	17	Кирпич	8 300 000,00 ₽
49	73700655	2021-08-12 00:00:00	341549	https://novosibirsk.n1.ru/view/73700655/	113	4	18	Кирпич	9 830 000,00 ₽
10	73862323	2021-08-12 00:00:00	341549	https://novosibirsk.n1.ru/view/73862323/	43	9	17	Кирпич	4 700 000,00 ₽
11	73683928	2021-08-12 00:00:00	341549	https://novosibirsk.n1.ru/view/73683928/	41	2	15	Монолит	4 100 000,00 ₽
12	72721377	2021-08-12 00:00:00	341549	https://novosibirsk.n1.ru/view/72721377/	84	2	15	Кирпич	7 470 000,00 ₽
13	71174680	2021-08-12 00:00:00	341549	https://novosibirsk.n1.ru/view/71174680/	99	18	19	Кирпич	8 969 000,00 ₽
14	73261918	2021-08-12 00:00:00	341549	https://novosibirsk.n1.ru/view/73261918/	44	3	17	Кирпич	4 800 000,00 ₽
15	73861563	2021-08-12 00:00:00	341549	https://novosibirsk.n1.ru/view/73861563/	37	19	19	Кирпич - монолит	4 100 000,00 ₽
16	73900200	2021-08-12 00:00:00	341549	https://novosibirsk.n1.ru/view/73900200/	44	8	19	Кирпич - монолит	5 100 000,00 ₽
17	72912050	2021-08-12 00:00:00	341549	https://novosibirsk.n1.ru/view/72912050/	44	6	19	Кирпич - монолит	5 100 000,00 ₽
18	72544556	2021-08-12 00:00:00	341549	https://novosibirsk.n1.ru/view/72544556/	36	12	19	Кирпич	3 980 000,00 ₽
19	72308655	2021-08-12 00:00:00	341549	https://novosibirsk.n1.ru/view/72308655/	38	14	16	Кирпич - монолит	4 000 000,00 ₽
20	71384346	2021-08-12 00:00:00	341549	https://novosibirsk.n1.ru/view/71384346/	34	4	19	Кирпич	3 750 000,00 ₽
21	72967993	2021-08-12 00:00:00	341549	https://novosibirsk.n1.ru/view/72967993/	33	10	17	Кирпич - монолит	3 900 000,00 ₽
33	73750603	2021-08-12 00:00:00	341549	https://novosibirsk.n1.ru/view/73750603/	32	15	17	Кирпич - монолит	4 500 000,00 ₽
36	73191630	2021-08-12 00:00:00	341549	https://novosibirsk.n1.ru/view/73191630/	84	2	17	Кирпич	7 470 000,00 ₽
40	73771464	2021-08-12 00:00:00	341549	https://novosibirsk.n1.ru/view/73771464/	69	9	18	Кирпич	7 850 000,00 ₽
41	73771459	2021-08-12 00:00:00	341549	https://novosibirsk.n1.ru/view/73771459/	65	7	18	Кирпич	7 350 000,00 ₽
50	73865991	2021-08-12 00:00:00	341549	https://novosibirsk.n1.ru/view/73865991/	43	3	17	Кирпич - монолит	4 750 000,00 ₽
51	73744074	2021-08-12 00:00:00	341549	https://novosibirsk.n1.ru/view/73744074/	65	2	17	Кирпич - монолит	7 800 000,00 ₽
52	72928838	2021-08-12 00:00:00	341549	https://novosibirsk.n1.ru/view/72928838/	61	14	19	Кирпич - монолит	7 000 000,00 ₽
53	73866593	2021-08-12 00:00:00	341549	https://novosibirsk.n1.ru/view/73866593/	42	4	25		4 750 000,00 ₽
55	70293424	2021-08-12 00:00:00	341549	https://novosibirsk.n1.ru/view/70293424/	38	19	19	Кирпич	4 200 000,00 ₽
56	73173085	2021-08-12 00:00:00	341549	https://novosibirsk.n1.ru/view/73173085/	26	10	17	Кирпич - монолит	3 200 000,00 ₽
57	72521410	2021-08-12 00:00:00	341549	https://novosibirsk.n1.ru/view/72521410/	82	3	17	Кирпич - монолит	6 533 000,00 ₽
60	73768648	2021-08-12 00:00:00	341291	https://novosibirsk.n1.ru/view/73768648/	41	2	17	Монолит	4 250 000,00 ₽
61	73083908	2021-08-12 00:00:00	341291	https://novosibirsk.n1.ru/view/73083908/	36	12	16	Монолит	3 650 000,00 ₽
58	73716366	2021-08-12 00:00:00	341291	https://novosibirsk.n1.ru/view/73716366/	41	1	17	Монолит	4 100 000,00 ₽
59	73123360	2021-08-12 00:00:00	341291	https://novosibirsk.n1.ru/view/73123360/	36	6	17	Монолит	3 600 000,00 ₽
62	73816587	2021-08-12 00:00:00	341291	https://novosibirsk.n1.ru/view/73816587/	37	12	17	Кирпич - монолит	4 300 000,00 ₽
66	73849703	2021-08-12 00:00:00	569706	https://novosibirsk.n1.ru/view/73849703/	37	9	10	Панель	2 490 000,00 ₽
67	73173998	2021-08-12 00:00:00	569706	https://novosibirsk.n1.ru/view/73173998/	32	10	10	Панель	2 590 000,00 ₽
69	73737352	2021-08-12 00:00:00	569706	https://novosibirsk.n1.ru/view/73737352/	39	2	10	Панель	2 710 000,00 ₽
63	73159821	2021-08-12 00:00:00	569706	https://novosibirsk.n1.ru/view/73159821/	32	1	10	Панель	2 800 000,00 ₽
64	73038568	2021-08-12 00:00:00	569706	https://novosibirsk.n1.ru/view/73038568/	32	1	10	Панель	2 600 000,00 ₽
65	73083857	2021-08-12 00:00:00	569706	https://novosibirsk.n1.ru/view/73083857/	32	1	10	Панель	2 800 000,00 ₽
68	73883813	2021-08-12 00:00:00	569706	https://novosibirsk.n1.ru/view/73883813/	34	3	10	Панель	2 650 000,00 ₽
70	73121206	2021-08-12 00:00:00	569706	https://novosibirsk.n1.ru/view/73121206/	34	10	10	Панель	2 590 000,00 ₽
71	72793583	2021-08-12 00:00:00	569706	https://novosibirsk.n1.ru/view/72793583/	36	9	10	Панель	2 600 000,00 ₽
72	73048135	2021-08-12 00:00:00	569706	https://novosibirsk.n1.ru/view/73048135/	32	1	10	Панель	2 800 000,00 ₽
73	73851342	2021-08-12 00:00:00	326581	https://novosibirsk.n1.ru/view/73851342/	57	9	9	Кирпич	7 200 000,00 ₽
74	73064445	2021-08-12 00:00:00	326581	https://novosibirsk.n1.ru/view/73064445/	65	2	9	Кирпич	6 260 000,00 ₽
76	73717174	2021-08-12 00:00:00	339091	https://novosibirsk.n1.ru/view/73717174/	323	8	9	Кирпич	30 000 000,00 ₽
77	71785110	2021-08-12 00:00:00	339091	https://novosibirsk.n1.ru/view/71785110/	152	8	9	Кирпич	15 900 000,00 ₽
75	73768910	2021-08-12 00:00:00	339091	https://novosibirsk.n1.ru/view/73768910/	61	4	9	Кирпич	7 650 000,00 ₽
78	73745430	2021-08-12 00:00:00	339091	https://novosibirsk.n1.ru/view/73745430/	61	4	9	Кирпич	7 500 000,00 ₽
80	73900051	2021-08-12 00:00:00	327082	https://novosibirsk.n1.ru/view/73900051/	63	3	5	Кирпич	7 600 000,00 ₽
81	73883117	2021-08-12 00:00:00	327082	https://novosibirsk.n1.ru/view/73883117/	63	5	5	Кирпич	7 000 000,00 ₽
79	73847475	2021-08-12 00:00:00	327082	https://novosibirsk.n1.ru/view/73847475/	65	3	5	Кирпич	7 600 000,00 ₽
82	73148599	2021-08-12 00:00:00	327082	https://novosibirsk.n1.ru/view/73148599/	65	3	5	Кирпич	7 600 000,00 ₽
83	73665642	2021-08-12 00:00:00	579630	https://novosibirsk.n1.ru/view/73665642/	72	4	7	Кирпич	7 900 000,00 ₽
84	73854017	2021-08-12 00:00:00	579630	https://novosibirsk.n1.ru/view/73854017/	80	3	7	Кирпич	6 850 000,00 ₽
85	73609764	2021-08-12 00:00:00	579630	https://novosibirsk.n1.ru/view/73609764/	95	3	7	Кирпич	12 000 000,00 ₽
86	73739546	2021-08-12 00:00:00	579630	https://novosibirsk.n1.ru/view/73739546/	47	6	6	Кирпич	5 690 000,00 ₽
87	73732596	2021-08-12 00:00:00	579630	https://novosibirsk.n1.ru/view/73732596/	49	2	6	Кирпич	5 650 000,00 ₽
88	73633063	2021-08-12 00:00:00	579630	https://novosibirsk.n1.ru/view/73633063/	94	5	7	Кирпич	7 700 000,00 ₽
94	73884752	2021-08-12 00:00:00	365479	https://novosibirsk.n1.ru/view/73884752/	105	17	17	Кирпич	9 000 000,00 ₽
95	73881808	2021-08-12 00:00:00	365479	https://novosibirsk.n1.ru/view/73881808/	59	9	17	Кирпич	5 550 000,00 ₽
96	73807309	2021-08-12 00:00:00	365479	https://novosibirsk.n1.ru/view/73807309/	40	16	17	Кирпич	4 980 000,00 ₽
98	73725640	2021-08-12 00:00:00	365479	https://novosibirsk.n1.ru/view/73725640/	103	12	17	Кирпич - монолит	8 100 000,00 ₽
100	72680361	2021-08-12 00:00:00	365479	https://novosibirsk.n1.ru/view/72680361/	85	2	17	Кирпич - монолит	6 950 000,00 ₽
89	73816114	2021-08-12 00:00:00	365479	https://novosibirsk.n1.ru/view/73816114/	29	9	16	Монолит	3 600 000,00 ₽
90	73786914	2021-08-12 00:00:00	365479	https://novosibirsk.n1.ru/view/73786914/	105	17	17	Монолит	8 990 000,00 ₽
91	73747057	2021-08-12 00:00:00	365479	https://novosibirsk.n1.ru/view/73747057/	90	12	17	Монолит	9 500 000,00 ₽
92	73080599	2021-08-12 00:00:00	365479	https://novosibirsk.n1.ru/view/73080599/	26	11	17	Кирпич - монолит	3 580 000,00 ₽
93	73700844	2021-08-12 00:00:00	365479	https://novosibirsk.n1.ru/view/73700844/	29	9	17	Монолит	3 600 000,00 ₽
97	72760635	2021-08-12 00:00:00	365479	https://novosibirsk.n1.ru/view/72760635/	92	6	17	Кирпич - монолит	9 300 000,00 ₽
99	73697214	2021-08-12 00:00:00	365479	https://novosibirsk.n1.ru/view/73697214/	25	9	17	Кирпич - монолит	3 560 000,00 ₽
367	73632105	2021-08-11 00:00:00	341549	https://novosibirsk.n1.ru/view/73632105/	36	13	15	Кирпич - монолит	3 960 000,00 ₽
368	72853229	2021-08-11 00:00:00	341549	https://novosibirsk.n1.ru/view/72853229/	23	10	18	Кирпич - монолит	3 200 000,00 ₽
369	73836830	2021-08-11 00:00:00	341549	https://novosibirsk.n1.ru/view/73836830/	35	12	18	Кирпич - монолит	4 000 000,00 ₽
370	73835882	2021-08-11 00:00:00	341549	https://novosibirsk.n1.ru/view/73835882/	81	12	17	Кирпич	8 300 000,00 ₽
371	73700655	2021-08-11 00:00:00	341549	https://novosibirsk.n1.ru/view/73700655/	113	4	18	Кирпич	9 830 000,00 ₽
372	73865991	2021-08-11 00:00:00	341549	https://novosibirsk.n1.ru/view/73865991/	43	3	17	Кирпич - монолит	4 750 000,00 ₽
373	73744074	2021-08-11 00:00:00	341549	https://novosibirsk.n1.ru/view/73744074/	65	2	17	Кирпич - монолит	7 800 000,00 ₽
374	72928838	2021-08-11 00:00:00	341549	https://novosibirsk.n1.ru/view/72928838/	61	14	19	Кирпич - монолит	7 000 000,00 ₽
375	73866593	2021-08-11 00:00:00	341549	https://novosibirsk.n1.ru/view/73866593/	42	4	25		4 750 000,00 ₽
376	73803139	2021-08-11 00:00:00	341549	https://novosibirsk.n1.ru/view/73803139/	49	11	18	Кирпич	6 400 000,00 ₽
377	70293424	2021-08-11 00:00:00	341549	https://novosibirsk.n1.ru/view/70293424/	38	19	19	Кирпич	4 200 000,00 ₽
378	73173085	2021-08-11 00:00:00	341549	https://novosibirsk.n1.ru/view/73173085/	26	10	17	Кирпич - монолит	3 200 000,00 ₽
379	72521410	2021-08-11 00:00:00	341549	https://novosibirsk.n1.ru/view/72521410/	82	3	17	Кирпич - монолит	6 533 000,00 ₽
380	73716366	2021-08-11 00:00:00	341291	https://novosibirsk.n1.ru/view/73716366/	41	1	17	Монолит	4 100 000,00 ₽
381	73123360	2021-08-11 00:00:00	341291	https://novosibirsk.n1.ru/view/73123360/	36	6	17	Монолит	3 600 000,00 ₽
382	73768648	2021-08-11 00:00:00	341291	https://novosibirsk.n1.ru/view/73768648/	41	2	17	Монолит	4 250 000,00 ₽
383	73083908	2021-08-11 00:00:00	341291	https://novosibirsk.n1.ru/view/73083908/	36	12	16	Монолит	3 650 000,00 ₽
384	73816587	2021-08-11 00:00:00	341291	https://novosibirsk.n1.ru/view/73816587/	37	12	17	Кирпич - монолит	4 300 000,00 ₽
385	73159821	2021-08-11 00:00:00	569706	https://novosibirsk.n1.ru/view/73159821/	32	1	10	Панель	2 800 000,00 ₽
386	73038568	2021-08-11 00:00:00	569706	https://novosibirsk.n1.ru/view/73038568/	32	1	10	Панель	2 600 000,00 ₽
387	73083857	2021-08-11 00:00:00	569706	https://novosibirsk.n1.ru/view/73083857/	32	1	10	Панель	2 800 000,00 ₽
388	73849703	2021-08-11 00:00:00	569706	https://novosibirsk.n1.ru/view/73849703/	37	9	10	Панель	2 490 000,00 ₽
389	73173998	2021-08-11 00:00:00	569706	https://novosibirsk.n1.ru/view/73173998/	32	10	10	Панель	2 590 000,00 ₽
390	73883813	2021-08-11 00:00:00	569706	https://novosibirsk.n1.ru/view/73883813/	34	3	10	Панель	2 650 000,00 ₽
391	73737352	2021-08-11 00:00:00	569706	https://novosibirsk.n1.ru/view/73737352/	39	2	10	Панель	2 710 000,00 ₽
392	73121206	2021-08-11 00:00:00	569706	https://novosibirsk.n1.ru/view/73121206/	34	10	10	Панель	2 590 000,00 ₽
393	72793583	2021-08-11 00:00:00	569706	https://novosibirsk.n1.ru/view/72793583/	36	9	10	Панель	2 600 000,00 ₽
394	73048135	2021-08-11 00:00:00	569706	https://novosibirsk.n1.ru/view/73048135/	32	1	10	Панель	2 800 000,00 ₽
395	73851342	2021-08-11 00:00:00	326581	https://novosibirsk.n1.ru/view/73851342/	57	9	9	Кирпич	7 200 000,00 ₽
396	73064445	2021-08-11 00:00:00	326581	https://novosibirsk.n1.ru/view/73064445/	65	2	9	Кирпич	6 260 000,00 ₽
397	73768910	2021-08-11 00:00:00	339091	https://novosibirsk.n1.ru/view/73768910/	61	4	9	Кирпич	7 650 000,00 ₽
398	73717174	2021-08-11 00:00:00	339091	https://novosibirsk.n1.ru/view/73717174/	323	8	9	Кирпич	30 000 000,00 ₽
399	71785110	2021-08-11 00:00:00	339091	https://novosibirsk.n1.ru/view/71785110/	152	8	9	Кирпич	15 900 000,00 ₽
400	73745430	2021-08-11 00:00:00	339091	https://novosibirsk.n1.ru/view/73745430/	61	4	9	Кирпич	7 500 000,00 ₽
401	73847475	2021-08-11 00:00:00	327082	https://novosibirsk.n1.ru/view/73847475/	65	3	5	Кирпич	7 600 000,00 ₽
402	73900051	2021-08-11 00:00:00	327082	https://novosibirsk.n1.ru/view/73900051/	63	3	5	Кирпич	7 600 000,00 ₽
403	73883117	2021-08-11 00:00:00	327082	https://novosibirsk.n1.ru/view/73883117/	63	5	5	Кирпич	7 000 000,00 ₽
404	73263070	2021-08-11 00:00:00	327082	https://novosibirsk.n1.ru/view/73263070/	64	3	5	Кирпич	7 600 000,00 ₽
405	73148599	2021-08-11 00:00:00	327082	https://novosibirsk.n1.ru/view/73148599/	65	3	5	Кирпич	7 600 000,00 ₽
102	72137544	2021-08-12 00:00:00	355180	https://novosibirsk.n1.ru/view/72137544/	144	17	17	Кирпич	14 100 000,00 ₽
104	73845893	2021-08-12 00:00:00	355180	https://novosibirsk.n1.ru/view/73845893/	150	17	18	Кирпич	14 100 000,00 ₽
105	73110808	2021-08-12 00:00:00	355180	https://novosibirsk.n1.ru/view/73110808/	105	17	18	Кирпич	9 880 000,00 ₽
106	72458765	2021-08-12 00:00:00	355180	https://novosibirsk.n1.ru/view/72458765/	69	7	18	Кирпич	7 700 000,00 ₽
101	73360052	2021-08-12 00:00:00	355180	https://novosibirsk.n1.ru/view/73360052/	59	10	17	Кирпич - монолит	7 199 000,00 ₽
103	72714406	2021-08-12 00:00:00	355180	https://novosibirsk.n1.ru/view/72714406/	85	4	17	Кирпич - монолит	8 100 000,00 ₽
107	73105420	2021-08-12 00:00:00	355180	https://novosibirsk.n1.ru/view/73105420/	105	17	18	Кирпич - монолит	9 100 000,00 ₽
\.


--
-- TOC entry 2836 (class 0 OID 0)
-- Dependencies: 203
-- Name: flat_record_flat_record_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.flat_record_flat_record_id_seq', 644, true);


--
-- TOC entry 2694 (class 2606 OID 16401)
-- Name: building building_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.building
    ADD CONSTRAINT building_pkey PRIMARY KEY (building_id);


--
-- TOC entry 2696 (class 2606 OID 16423)
-- Name: flat_record flat_record_flat_id_record_date_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.flat_record
    ADD CONSTRAINT flat_record_flat_id_record_date_key UNIQUE (flat_id, record_date);


--
-- TOC entry 2698 (class 2606 OID 16411)
-- Name: flat_record flat_record_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.flat_record
    ADD CONSTRAINT flat_record_pkey PRIMARY KEY (flat_record_id);


--
-- TOC entry 2699 (class 2606 OID 16417)
-- Name: flat_record flat_record_building_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.flat_record
    ADD CONSTRAINT flat_record_building_fkey FOREIGN KEY (building) REFERENCES public.building(building_id) NOT VALID;


-- Completed on 2021-08-12 12:18:36

--
-- PostgreSQL database dump complete
--

