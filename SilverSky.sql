--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

-- Started on 2023-05-14 12:57:41

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 215 (class 1259 OID 25189)
-- Name: category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category (
    id integer NOT NULL,
    name character varying(255)
);


ALTER TABLE public.category OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 25188)
-- Name: category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.category_id_seq OWNER TO postgres;

--
-- TOC entry 3384 (class 0 OID 0)
-- Dependencies: 214
-- Name: category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.category_id_seq OWNED BY public.category.id;


--
-- TOC entry 217 (class 1259 OID 25196)
-- Name: image; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.image (
    id integer NOT NULL,
    file_name character varying(255),
    product_id integer NOT NULL
);


ALTER TABLE public.image OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 25195)
-- Name: image_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.image_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.image_id_seq OWNER TO postgres;

--
-- TOC entry 3385 (class 0 OID 0)
-- Dependencies: 216
-- Name: image_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.image_id_seq OWNED BY public.image.id;


--
-- TOC entry 219 (class 1259 OID 25203)
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    count integer NOT NULL,
    date_time timestamp(6) without time zone,
    number character varying(255),
    price real NOT NULL,
    status smallint,
    person_id integer NOT NULL,
    product_id integer NOT NULL
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 25202)
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_id_seq OWNER TO postgres;

--
-- TOC entry 3386 (class 0 OID 0)
-- Dependencies: 218
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- TOC entry 221 (class 1259 OID 25210)
-- Name: person; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.person (
    id integer NOT NULL,
    login character varying(100),
    password character varying(255),
    role character varying(255)
);


ALTER TABLE public.person OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 25209)
-- Name: person_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.person_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.person_id_seq OWNER TO postgres;

--
-- TOC entry 3387 (class 0 OID 0)
-- Dependencies: 220
-- Name: person_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.person_id_seq OWNED BY public.person.id;


--
-- TOC entry 223 (class 1259 OID 25219)
-- Name: product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product (
    id integer NOT NULL,
    date_time timestamp(6) without time zone,
    description text NOT NULL,
    price real NOT NULL,
    seller character varying(255) NOT NULL,
    title text NOT NULL,
    warehouse character varying(255) NOT NULL,
    category_id integer NOT NULL,
    CONSTRAINT product_price_check CHECK ((price >= (1)::double precision))
);


ALTER TABLE public.product OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 25229)
-- Name: product_cart; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_cart (
    id integer NOT NULL,
    person_id integer,
    product_id integer
);


ALTER TABLE public.product_cart OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 25228)
-- Name: product_cart_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_cart_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_cart_id_seq OWNER TO postgres;

--
-- TOC entry 3388 (class 0 OID 0)
-- Dependencies: 224
-- Name: product_cart_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_cart_id_seq OWNED BY public.product_cart.id;


--
-- TOC entry 222 (class 1259 OID 25218)
-- Name: product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_id_seq OWNER TO postgres;

--
-- TOC entry 3389 (class 0 OID 0)
-- Dependencies: 222
-- Name: product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_id_seq OWNED BY public.product.id;


--
-- TOC entry 3198 (class 2604 OID 25192)
-- Name: category id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category ALTER COLUMN id SET DEFAULT nextval('public.category_id_seq'::regclass);


--
-- TOC entry 3199 (class 2604 OID 25199)
-- Name: image id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.image ALTER COLUMN id SET DEFAULT nextval('public.image_id_seq'::regclass);


--
-- TOC entry 3200 (class 2604 OID 25206)
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- TOC entry 3201 (class 2604 OID 25213)
-- Name: person id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person ALTER COLUMN id SET DEFAULT nextval('public.person_id_seq'::regclass);


--
-- TOC entry 3202 (class 2604 OID 25222)
-- Name: product id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product ALTER COLUMN id SET DEFAULT nextval('public.product_id_seq'::regclass);


--
-- TOC entry 3203 (class 2604 OID 25232)
-- Name: product_cart id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_cart ALTER COLUMN id SET DEFAULT nextval('public.product_cart_id_seq'::regclass);


--
-- TOC entry 3368 (class 0 OID 25189)
-- Dependencies: 215
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.category (id, name) VALUES (1, 'Серьги');
INSERT INTO public.category (id, name) VALUES (2, 'Браслеты');
INSERT INTO public.category (id, name) VALUES (3, 'Кольца');


--
-- TOC entry 3370 (class 0 OID 25196)
-- Dependencies: 217
-- Data for Name: image; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.image (id, file_name, product_id) VALUES (1, '7a556db4-1371-408f-9c7c-a2fddd94dfc6.круг1.jpg', 1);
INSERT INTO public.image (id, file_name, product_id) VALUES (2, 'c564985b-d4e1-4464-9f04-bbe339b8600c.круг2.jpg', 1);
INSERT INTO public.image (id, file_name, product_id) VALUES (3, '706f7508-4e5d-4630-8926-9aea19c97152.круг3.png', 1);
INSERT INTO public.image (id, file_name, product_id) VALUES (4, 'a9c423ff-9ac8-4543-b6da-33ec3518aef2.', 1);
INSERT INTO public.image (id, file_name, product_id) VALUES (5, '34c0a50e-4c1c-4028-9b3f-4afaeacd7ffa.', 1);
INSERT INTO public.image (id, file_name, product_id) VALUES (6, 'acbffedb-a57e-48d0-a8d8-bf2376ea3e46.клевер2.jpg', 2);
INSERT INTO public.image (id, file_name, product_id) VALUES (7, 'dcf660c4-2103-4a42-92a2-475ceccf8c19.клевер1.png', 2);
INSERT INTO public.image (id, file_name, product_id) VALUES (8, 'ba3a0dae-6cfe-48e3-ad10-336d208f3d73.клевер3.jpg', 2);
INSERT INTO public.image (id, file_name, product_id) VALUES (9, 'f9fe645b-307f-4ff5-841e-ae4f8d2f6a5e.', 2);
INSERT INTO public.image (id, file_name, product_id) VALUES (10, '9e2512c9-22e9-4af6-90c3-9ddd7870d1e8.', 2);
INSERT INTO public.image (id, file_name, product_id) VALUES (11, '90b94373-a80b-4774-aca0-d296612d0cdd.каффы1.png', 3);
INSERT INTO public.image (id, file_name, product_id) VALUES (12, 'cd0a71ce-4efa-4e39-8269-40413073f4a7.каффы2.jpg', 3);
INSERT INTO public.image (id, file_name, product_id) VALUES (13, '5fe0df36-63e9-4d35-a3f6-070d65ae8a49.каффы3.jpg', 3);
INSERT INTO public.image (id, file_name, product_id) VALUES (14, '6078e659-e076-4264-b3dd-0a8f7cfa463d.', 3);
INSERT INTO public.image (id, file_name, product_id) VALUES (15, '9ee00690-89c9-437d-adfa-435289e18b30.', 3);
INSERT INTO public.image (id, file_name, product_id) VALUES (21, '7a01efd2-ac65-44f7-82d1-cb04520d7c17.бесконечность1.jpg', 5);
INSERT INTO public.image (id, file_name, product_id) VALUES (22, '087d3163-43c8-4c3d-ba00-8bf6e3193734.бесконечность2.png', 5);
INSERT INTO public.image (id, file_name, product_id) VALUES (23, 'a014725e-d762-437d-b197-e32a1a8f884c.бесконечность3.jpg', 5);
INSERT INTO public.image (id, file_name, product_id) VALUES (24, 'ed2a19fe-c7cd-4e99-b76b-c7bba0ab96a3.', 5);
INSERT INTO public.image (id, file_name, product_id) VALUES (25, '10c5fdd2-96aa-4c8b-a6d7-ad481fda63b6.', 5);
INSERT INTO public.image (id, file_name, product_id) VALUES (26, 'f82db330-ae9b-42b4-92ea-de6ab7abc565.колечки1.jpg', 6);
INSERT INTO public.image (id, file_name, product_id) VALUES (27, 'c0b27f30-09ce-44f2-80b2-2cb1446986ae.колечки2.jpg', 6);
INSERT INTO public.image (id, file_name, product_id) VALUES (28, '5146d76e-99e7-418e-ad85-5ad46c84ab4b.колечки3.jpg', 6);
INSERT INTO public.image (id, file_name, product_id) VALUES (29, 'a1576839-53de-4748-825e-a9d7ab75a5a5.', 6);
INSERT INTO public.image (id, file_name, product_id) VALUES (30, '26a8728a-38b9-4f30-9939-a90da9664015.', 6);
INSERT INTO public.image (id, file_name, product_id) VALUES (31, 'd9721d23-34ef-4c75-a30f-e6caae5ab12d.сердце1.jpg', 7);
INSERT INTO public.image (id, file_name, product_id) VALUES (32, 'd3ce10fd-a344-445a-bb0b-794703f82abd.сердце2.jpg', 7);
INSERT INTO public.image (id, file_name, product_id) VALUES (33, 'ee7c0c28-2bfd-456a-a068-93f70d53d901.сердце3.jpg', 7);
INSERT INTO public.image (id, file_name, product_id) VALUES (34, 'f96e1078-a794-4b04-8715-d397e6c1cacd.', 7);
INSERT INTO public.image (id, file_name, product_id) VALUES (35, '749c85c6-d629-45bb-9cd8-f8f1f0d0b5ac.', 7);
INSERT INTO public.image (id, file_name, product_id) VALUES (36, '7fa7cc88-aaaa-4cde-883f-6cfabdd261be.веточка1.jpg', 8);
INSERT INTO public.image (id, file_name, product_id) VALUES (37, '52ff9267-baa4-4d05-b66c-ff93ea957080.веточка3.jpg', 8);
INSERT INTO public.image (id, file_name, product_id) VALUES (38, 'dc4091dc-f33c-4264-b557-f07116456691.веточка2.jpg', 8);
INSERT INTO public.image (id, file_name, product_id) VALUES (39, 'd36b44b4-9abc-4273-9414-9e7e721f9dff.', 8);
INSERT INTO public.image (id, file_name, product_id) VALUES (40, '0032d933-044d-4178-bf1c-ee85427dfe3b.', 8);
INSERT INTO public.image (id, file_name, product_id) VALUES (41, '1726f85c-2e5a-40cc-86d5-3a5451f6bf8d.лунный1.jpg', 9);
INSERT INTO public.image (id, file_name, product_id) VALUES (42, '61b444c0-45be-4f53-83b9-22a4c633009e.лунный2.jpg', 9);
INSERT INTO public.image (id, file_name, product_id) VALUES (43, 'ea8657b8-09a9-41dc-af9d-0e7964486309.лунный3.jpg', 9);
INSERT INTO public.image (id, file_name, product_id) VALUES (44, 'c9432780-351a-4ead-b51d-482fd93bc032.', 9);
INSERT INTO public.image (id, file_name, product_id) VALUES (45, '75e9690f-7300-44db-8509-6eb6e56fef5f.', 9);
INSERT INTO public.image (id, file_name, product_id) VALUES (46, '3fba08db-20ad-4118-9527-a1e994a76109.цепочка 2.jpg', 10);
INSERT INTO public.image (id, file_name, product_id) VALUES (47, 'ebd81fcc-4524-4bc0-abfa-06dcf48e118f.цепочка1.webp', 10);
INSERT INTO public.image (id, file_name, product_id) VALUES (48, 'aada4637-6e09-4773-a7e8-b550187738df.цепочка3.jpg', 10);
INSERT INTO public.image (id, file_name, product_id) VALUES (49, 'f1e9925d-56c2-457f-91e2-563c0d4f4572.', 10);
INSERT INTO public.image (id, file_name, product_id) VALUES (50, 'd204cadb-a822-418e-8476-9fa74e83e93d.', 10);


--
-- TOC entry 3372 (class 0 OID 25203)
-- Dependencies: 219
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.orders (id, count, date_time, number, price, status, person_id, product_id) VALUES (1, 1, '2023-05-01 19:28:32.366793', 'f71b75c2-13ce-46f2-88ef-027bbdac0a4f', 3000, 1, 1, 7);
INSERT INTO public.orders (id, count, date_time, number, price, status, person_id, product_id) VALUES (2, 1, '2023-05-01 19:28:32.459324', 'f71b75c2-13ce-46f2-88ef-027bbdac0a4f', 3600, 1, 1, 5);
INSERT INTO public.orders (id, count, date_time, number, price, status, person_id, product_id) VALUES (3, 1, '2023-05-01 19:28:32.47399', 'f71b75c2-13ce-46f2-88ef-027bbdac0a4f', 2520, 1, 1, 2);
INSERT INTO public.orders (id, count, date_time, number, price, status, person_id, product_id) VALUES (4, 1, '2023-05-01 19:28:32.487985', 'f71b75c2-13ce-46f2-88ef-027bbdac0a4f', 1450, 1, 1, 10);


--
-- TOC entry 3374 (class 0 OID 25210)
-- Dependencies: 221
-- Data for Name: person; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.person (id, login, password, role) VALUES (1, 'user1', '$2a$10$8yvTuoMis0lYJMENbzyuuufKbTn9L47YWfG5xrAGNaoUKIpWPESJG', 'ROLE_USER');
INSERT INTO public.person (id, login, password, role) VALUES (2, 'admin', '$2a$10$VC0BA3Jhtk9Nl6dADdU9fO5BGZgC81S4Y7zAIknHnVHEP8ru5dMNa', 'ROLE_ADMIN');


--
-- TOC entry 3376 (class 0 OID 25219)
-- Dependencies: 223
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.product (id, date_time, description, price, seller, title, warehouse, category_id) VALUES (1, NULL, 'Женские серьги-гвоздики из серебра 925 пробы с фианитами в форме круга. Стильные дизайнерские серёжки с классическим винтовым замком отлично подходят для повседневной носки, а также эффектно дополнят нарядный, вечерний, праздничный или свадебный образ', 3960, 'Весна', 'Серьги серебряные «Круг»', 'Москва, Камергерский переулок, 38', 1);
INSERT INTO public.product (id, date_time, description, price, seller, title, warehouse, category_id) VALUES (2, NULL, 'Серьги  выполнены из серебра 925 пробы; имеют изящный узор четырехлистный клевер и родированное покрытие.', 2520, 'Зима
', 'Серьги серебряные «Клевер»', 'Москва, Камергерский переулок, 38', 1);
INSERT INTO public.product (id, date_time, description, price, seller, title, warehouse, category_id) VALUES (3, NULL, 'Каффы серебряные – модные, стильные и абсолютно универсальные. Незаменимый аксессуар для любого образа ', 3000, 'Осень', 'Серьги-каффы «Веточка»', 'Москва, ул. Тверская, 20', 1);
INSERT INTO public.product (id, date_time, description, price, seller, title, warehouse, category_id) VALUES (5, NULL, 'Браслет женский серебряный 925 пробы на цепочке станет идеальным подарком для себя, девочкам, лучшим подругам, любимой коллеге. Браслет полностью покрыт слоем родия 8 мкм (имитация белого золота) и поэтому со временем не темнеет. Вставка: фианиты (искусственный аналог бриллианта). 
', 3600, 'Весна
', 'Браслет серебряный «Бесконечность»', 'Москва, Камергерский переулок, 38', 2);
INSERT INTO public.product (id, date_time, description, price, seller, title, warehouse, category_id) VALUES (6, NULL, 'Элегантное изделие идеально дополнит любой ваш образ, так как его красота актуальна и универсальна. Браслет подойдет также для нарядных выходов в свет. Украшение удобно застегивается благодаря карабиновому замку.
', 2560, 'Осень', 'Браслет серебряный «Счастье»', 'Москва, Камергерский переулок, 38', 2);
INSERT INTO public.product (id, date_time, description, price, seller, title, warehouse, category_id) VALUES (7, NULL, 'Женское классическое кольцо из серебра 925 пробы с дорожкой из фианитов украсит ваш повседневный и праздничный образ. Стильное кольцо ювелирное отлично подойдет для повседневной носки, а также эффектно дополнит нарядный, вечерний, праздничный или свадебный образ.
', 3000, 'Весна', 'Кольцо из серебра «Сердце»', 'Москва, Камергерский переулок, 38', 3);
INSERT INTO public.product (id, date_time, description, price, seller, title, warehouse, category_id) VALUES (8, NULL, 'Колечко отлично подойдет для подарка подруге, девушке, жене, девочке, сестре, бабушке или любой женщине, которую хочется порадовать просто так или на новый год, годовщину, день рождения, 8 марта, свадьбу, на 14 февраля - день всех влюбленных, день матери, выпускной, юбилей, новоселье, рождение ребенка. Украшение в стиле минимализм.', 2000, 'Весна', 'Кольцо серебряное «Веточки с камнем» ', 'Москва, ул. Тверская, 20', 3);
INSERT INTO public.product (id, date_time, description, price, seller, title, warehouse, category_id) VALUES (9, NULL, 'Серебряное кольцо из серебра 925 пробы с натуральным лунным камнем. Покрытие - родий. 
', 4000, 'Зима
', 'Кольцо серебряное с лунным камнем', 'Москва, ул. Тверская, 20', 3);
INSERT INTO public.product (id, date_time, description, price, seller, title, warehouse, category_id) VALUES (10, '2023-04-28 17:59:04.036318', 'Ювелирный браслет-цепочка из серебра 925 пробы очень популярен среди женщин и девушек. Браслет женский на руку плетения лав благодаря универсальному дизайну дополнит самые разные украшения: от фантазийных подвесок до шармов.
', 1450, 'Весна', 'Браслет-цепочка', 'Москва, ул. Тверская, 20', 2);


--
-- TOC entry 3378 (class 0 OID 25229)
-- Dependencies: 225
-- Data for Name: product_cart; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3390 (class 0 OID 0)
-- Dependencies: 214
-- Name: category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.category_id_seq', 3, true);


--
-- TOC entry 3391 (class 0 OID 0)
-- Dependencies: 216
-- Name: image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.image_id_seq', 50, true);


--
-- TOC entry 3392 (class 0 OID 0)
-- Dependencies: 218
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 4, true);


--
-- TOC entry 3393 (class 0 OID 0)
-- Dependencies: 220
-- Name: person_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.person_id_seq', 2, true);


--
-- TOC entry 3394 (class 0 OID 0)
-- Dependencies: 224
-- Name: product_cart_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_cart_id_seq', 5, true);


--
-- TOC entry 3395 (class 0 OID 0)
-- Dependencies: 222
-- Name: product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_id_seq', 10, true);


--
-- TOC entry 3206 (class 2606 OID 25194)
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);


--
-- TOC entry 3208 (class 2606 OID 25201)
-- Name: image image_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.image
    ADD CONSTRAINT image_pkey PRIMARY KEY (id);


--
-- TOC entry 3210 (class 2606 OID 25208)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- TOC entry 3212 (class 2606 OID 25217)
-- Name: person person_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_pkey PRIMARY KEY (id);


--
-- TOC entry 3218 (class 2606 OID 25234)
-- Name: product_cart product_cart_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT product_cart_pkey PRIMARY KEY (id);


--
-- TOC entry 3214 (class 2606 OID 25227)
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);


--
-- TOC entry 3216 (class 2606 OID 25236)
-- Name: product uk_qka6vxqdy1dprtqnx9trdd47c; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT uk_qka6vxqdy1dprtqnx9trdd47c UNIQUE (title);


--
-- TOC entry 3220 (class 2606 OID 25242)
-- Name: orders fk1b0m4muwx1t377w9if3w6wwqn; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk1b0m4muwx1t377w9if3w6wwqn FOREIGN KEY (person_id) REFERENCES public.person(id);


--
-- TOC entry 3222 (class 2606 OID 25252)
-- Name: product fk1mtsbur82frn64de7balymq9s; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT fk1mtsbur82frn64de7balymq9s FOREIGN KEY (category_id) REFERENCES public.category(id);


--
-- TOC entry 3221 (class 2606 OID 25247)
-- Name: orders fk787ibr3guwp6xobrpbofnv7le; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk787ibr3guwp6xobrpbofnv7le FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- TOC entry 3219 (class 2606 OID 25237)
-- Name: image fkgpextbyee3uk9u6o2381m7ft1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.image
    ADD CONSTRAINT fkgpextbyee3uk9u6o2381m7ft1 FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- TOC entry 3223 (class 2606 OID 25262)
-- Name: product_cart fkhpnrxdy3jhujameyod08ilvvw; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT fkhpnrxdy3jhujameyod08ilvvw FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- TOC entry 3224 (class 2606 OID 25257)
-- Name: product_cart fksgnkc1ko2i1o9yr2p63ysq3rn; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT fksgnkc1ko2i1o9yr2p63ysq3rn FOREIGN KEY (person_id) REFERENCES public.person(id);


-- Completed on 2023-05-14 12:57:41

--
-- PostgreSQL database dump complete
--

