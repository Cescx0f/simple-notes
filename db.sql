--
-- PostgreSQL database dump
--

-- Dumped from database version 10.7 (Debian 10.7-1.pgdg90+1)
-- Dumped by pg_dump version 12.1 (Ubuntu 12.1-1.pgdg18.04+1)

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
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

SET default_tablespace = '';

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    email character varying(256),
    id bigint DEFAULT nextval('public.users_id_seq'::regclass) NOT NULL,
    nickname character varying(256),
    password character varying(256),
    created timestamp with time zone
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (email, id, nickname, password, created) FROM stdin;
asd@asd.asd	1	asd	$2y$10$gWFH47mMXhTQ4m.5Egh.Y.W78YgeE/ARrSX.vCeQBQfu5kEsw1WZe	\N
asd@asd.asd	2	asd	$2y$10$4zHHQtjqhqlfueYWRsxnZ.xjHJkmJOyeo9ebcUrAhk9jFffG1jrx6	\N
asd@asd.asd	3	asd	$2y$10$GOyMdAI0fUgYeRQHfKUu2OOrmYrZbp5MtVBRh77aOPf7pmDz1FrDW	\N
asd@asd.asd	4	asd	$2y$10$LqBBQlHXc9vReFioVgxez.fNI3ty1rBCCqxvFpIGhRVpYQQheVWa.	\N
asd@asd.asd	5	asd	$2y$10$BOgnooaXuXTI7jXtuRYHNeUs/vgbU4cWCtuPYXEaZwSKRsxOVjnZW	\N
asd@asd.asd	6	asd	$2y$10$q.cpbmOg9L7hWqq7lGrYk.B6VLbhwi5bRj9R0udpZ.eoAd9.GB3OG	\N
asd@asd.asd	7	asd	$2y$10$17lRjVUMjd8h3U5HmydBJOY6edz0F0pgwRBvfY6SRnQ9/DtzT5c8a	\N
asd@asd.asd	8	asd	$2y$10$HbeUou/bNFRxmwy7dUlWA.WHe06hZ.blC5GkiJXqKh3Fnp2XgvLCO	\N
asd@asd.asd	9	asd	$2y$10$vlFLSefhtbHqwj24fuJPcunpARCll5BWGArn/mkO08oN2h9DGcCae	\N
asd@asd.asd	10	asd	$2y$10$rh3KVkDtrBJ45bra2a1iF.CVW.E6DtvBvS1wR5HOi.aArhlV/rCaO	\N
asd@asd.asd	11	asd	$2y$10$K5E/eaAs.RQRFrUsz1IKF.a4Rhf6/iOMVsmxyhacIkCtkMO152IlW	\N
asd@asd.asd	12	asd	$2y$10$VOuJsf3sRdbGJ5NwzOvymeHQrk0/n8Rulp399NcFDfntLJL8BCLom	\N
asd@asd.asd	13	asd	$2y$10$4uof8wF9vlRdeV0iZRGPUOZvYib/FGJWjJwRoB34wqT4sE/xHpzja	\N
asd@asd.asd	14	asd	$2y$10$HuYogMrlhXIfWqcd6KZzWefn14NG9cdpjvs6cYlOHv5/iq/C/OwdW	\N
asd@asd.asd	15	asd	$2y$10$Y/5PbWClJlDGq.IITID4.uttcnxwSQY/ksZ9YzOJd6qIX0bPg6/Ce	\N
asd@asd.asd	16	asd	$2y$10$D.kBsdYPLDmoUnQo9zX5ZOPHYCWA14YteMB/579r2r2Uv.ubY.eiu	\N
asd@asd.asd	17	asd	$2y$10$pntZTu7cKmyO1IAH00irZ.387zJHHAXPUAc4oM7PC3mpHWQcwpKvO	\N
asd@asd.asd	18	asd	$2y$10$vLZPuGXwPSL58vkwg.jlJeA/ATIRQH084LqOlAHuMrfHmtntnEFn.	\N
asd@asd.asd	19	asd	$2y$10$U4bIaq4xTsqqD6tQUL/STe/jcRCpHcXT7x8lKDDq.cmGJNgQ4Pfb2	\N
asd@asd.asd	20	asd	$2y$10$y5N7Tl9P2qhlBIG6z/kgJeeLPbqod82bgzE7gsGj31M8tmqnu6FUu	\N
asd@asd.asd	21	asd	$2y$10$28whdhTVjGdFcFPleWur/OZIiiN56aAwJp04pKm9nB8J2YhBOYpii	\N
asd@asd.asd	22	asd	$2y$10$G/vZcnGw2YTBua9zPPnuoeBHWfLWeXxZIvEW3jIDjfkKhHJAYi9ju	\N
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 22, true);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--
