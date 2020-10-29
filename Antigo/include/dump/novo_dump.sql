--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: banners; Type: TABLE; Schema: public; Owner: userdexter; Tablespace: 
--

CREATE TABLE banners (
    id integer NOT NULL,
    descricao character varying(60) NOT NULL,
    imagem character varying(60) NOT NULL
);


ALTER TABLE banners OWNER TO userdexter;

--
-- Name: banners_id_seq; Type: SEQUENCE; Schema: public; Owner: userdexter
--

CREATE SEQUENCE banners_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE banners_id_seq OWNER TO userdexter;

--
-- Name: banners_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: userdexter
--

ALTER SEQUENCE banners_id_seq OWNED BY banners.id;


--
-- Name: clientes; Type: TABLE; Schema: public; Owner: userdexter; Tablespace: 
--

CREATE TABLE clientes (
    id integer NOT NULL,
    cpf_cnpj character varying(14) NOT NULL,
    nome_razao character varying(255) NOT NULL,
    email character varying(60) NOT NULL,
    telefone character varying(20) NOT NULL
);


ALTER TABLE clientes OWNER TO userdexter;

--
-- Name: clientes_id_seq; Type: SEQUENCE; Schema: public; Owner: userdexter
--

CREATE SEQUENCE clientes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE clientes_id_seq OWNER TO userdexter;

--
-- Name: clientes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: userdexter
--

ALTER SEQUENCE clientes_id_seq OWNED BY clientes.id;


--
-- Name: conteudos; Type: TABLE; Schema: public; Owner: userdexter; Tablespace: 
--

CREATE TABLE conteudos (
    id integer NOT NULL,
    titulo character varying(60) NOT NULL,
    texto text NOT NULL
);


ALTER TABLE conteudos OWNER TO userdexter;

--
-- Name: conteudos_id_seq; Type: SEQUENCE; Schema: public; Owner: userdexter
--

CREATE SEQUENCE conteudos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE conteudos_id_seq OWNER TO userdexter;

--
-- Name: conteudos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: userdexter
--

ALTER SEQUENCE conteudos_id_seq OWNED BY conteudos.id;


--
-- Name: funcionarios; Type: TABLE; Schema: public; Owner: userdexter; Tablespace: 
--

CREATE TABLE funcionarios (
    id integer NOT NULL,
    email character varying(60) NOT NULL,
    prf_id character varying(10) NOT NULL,
    nome character varying(255) NOT NULL,
    senha character varying(32) NOT NULL
);


ALTER TABLE funcionarios OWNER TO userdexter;

--
-- Name: funcionarios_id_seq; Type: SEQUENCE; Schema: public; Owner: userdexter
--

CREATE SEQUENCE funcionarios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE funcionarios_id_seq OWNER TO userdexter;

--
-- Name: funcionarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: userdexter
--

ALTER SEQUENCE funcionarios_id_seq OWNED BY funcionarios.id;


--
-- Name: menus; Type: TABLE; Schema: public; Owner: userdexter; Tablespace: 
--

CREATE TABLE menus (
    id integer NOT NULL,
    prf_id character varying(10) NOT NULL,
    descricao character varying(30) NOT NULL,
    link character varying(100) NOT NULL
);


ALTER TABLE menus OWNER TO userdexter;

--
-- Name: menus_id_seq; Type: SEQUENCE; Schema: public; Owner: userdexter
--

CREATE SEQUENCE menus_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE menus_id_seq OWNER TO userdexter;

--
-- Name: menus_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: userdexter
--

ALTER SEQUENCE menus_id_seq OWNED BY menus.id;


--
-- Name: perfis; Type: TABLE; Schema: public; Owner: userdexter; Tablespace: 
--

CREATE TABLE perfis (
    id character varying(10) NOT NULL,
    descricao character varying(10) NOT NULL
);


ALTER TABLE perfis OWNER TO userdexter;

--
-- Name: id; Type: DEFAULT; Schema: public; Owner: userdexter
--

ALTER TABLE ONLY banners ALTER COLUMN id SET DEFAULT nextval('banners_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: userdexter
--

ALTER TABLE ONLY clientes ALTER COLUMN id SET DEFAULT nextval('clientes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: userdexter
--

ALTER TABLE ONLY conteudos ALTER COLUMN id SET DEFAULT nextval('conteudos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: userdexter
--

ALTER TABLE ONLY funcionarios ALTER COLUMN id SET DEFAULT nextval('funcionarios_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: userdexter
--

ALTER TABLE ONLY menus ALTER COLUMN id SET DEFAULT nextval('menus_id_seq'::regclass);


--
-- Data for Name: banners; Type: TABLE DATA; Schema: public; Owner: userdexter
--

COPY banners (id, descricao, imagem) FROM stdin;
1	Banner1	banner/1.jpg
2	Banner2	banner/2.jpg
3	Banner3	banner/3.jpg
4	Banner4	banner/4.jpg
5	sdfsdfsdfsd	banner/20140721204038_4Linuxappliance1.png
6	sdfsdf	banner/20140721204358_4Linuxappliance1.png
7	teste	banner/20140729091525_18164.jpg
8	sdfsdfsdfsdfsd	banner/20140729093000_18164.jpg
9	sdfsdfsdfsdfsdfsdfsdfsd	banner/20140729093412_52310.jpg
10	sdfsdfsd	banner/20140729093533_ativa_destativa_menu.png
11	sdfsdf	../public/banner/20140903192137_carro.jpg
12	asdasdasd	../../public/banner/20140903192230_A-Tuned-Car.jpg
13	sdfsdfsdf	../../public/banner/20140903192405_A-Tuned-Car.jpg
14	sdfsdfsd	../../public/banner/20140903192636_A-Tuned-Car.jpg
15	sdfsdfsd	../../public/banner/20140903192645_download.jpg
16	fsdfsdf	banner/20140903195756_logozcpe.jpg
17	sdfsdf	banner/20140903195807_print_porto.png
18	tedsfsdf	banner/20140903195922_52310.jpg
\.


--
-- Name: banners_id_seq; Type: SEQUENCE SET; Schema: public; Owner: userdexter
--

SELECT pg_catalog.setval('banners_id_seq', 18, true);


--
-- Data for Name: clientes; Type: TABLE DATA; Schema: public; Owner: userdexter
--

COPY clientes (id, cpf_cnpj, nome_razao, email, telefone) FROM stdin;
8	hkjh	khkjh	jkhk	khj
9	hkjh	khkjh	jkhk	khj
10	hkjh	khkjh	jkhk	khj
11	hkjh	khkjh	jkhk	khj
12	hkjh	khkjh	jkhk	khj
13	hkjh	khkjh	jkhk	khj
14	kllkjlk	jlkjjlkj	lkjl	jlkj
15	654654	Alterado	465465	4654
6	werwer	teste	werwe	rwerwe
16	sdfsdf	dfsdfsdf	sdfsdfsdsdfs	fsdfsdfsdf
17	sdfsdfsdf	fsdfsdfsdf	sdfsf	sdfsdfsdf
18	kjhkjhk	khhkhk	hkhjkhkj	hkh
19	dfsf	Teste de Gravar	fdsdf	fsdfsdfsdf
20	jkljl	lkjklj	kjlkjlk	ljkl
21	jkljl	lkjklj	kjlkjlk	ljkl
22	jkljl	lkjklj	kjlkjlk	ljkl
23	jllk	ljlkj	ljj	kljlj
24	232342	Rafael	rrrdfsd	sdfsdfsd
4	654654	dsfsd	465465	4654
5	oi	Tim	oi	oi
25	111.111.111-10	dsfsdfs	sdfsdfsdfs	sdfsdfsdfsd
26	222.222.888-20	teste	sdfsdfsdf	sdfsdfsd
27	111.111.111-10	fgsdfsdsdf	sdfsdfsdf	sdfsdfsdfsd
\.


--
-- Name: clientes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: userdexter
--

SELECT pg_catalog.setval('clientes_id_seq', 27, true);


--
-- Data for Name: conteudos; Type: TABLE DATA; Schema: public; Owner: userdexter
--

COPY conteudos (id, titulo, texto) FROM stdin;
1	Sobre	Ipsum...
\.


--
-- Name: conteudos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: userdexter
--

SELECT pg_catalog.setval('conteudos_id_seq', 1, true);


--
-- Data for Name: funcionarios; Type: TABLE DATA; Schema: public; Owner: userdexter
--

COPY funcionarios (id, email, prf_id, nome, senha) FROM stdin;
1	admin@dexter.com	admin	Administrador	e10adc3949ba59abbe56e057f20f883e
\.


--
-- Name: funcionarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: userdexter
--

SELECT pg_catalog.setval('funcionarios_id_seq', 1, true);


--
-- Data for Name: menus; Type: TABLE DATA; Schema: public; Owner: userdexter
--

COPY menus (id, prf_id, descricao, link) FROM stdin;
1	front	Início	index.php
3	front	Tipos de Encomenda	index.php?modulo=TiposEncomendas&acao=listar
4	front	Rastrear Encomendas	index.php?modulo=Encomendas&acao=rastrear
5	front	Sobre	index.php?modulo=Conteudos&acao=exibir&id=1
6	admin	Clientes	admin.php?modulo=Clientes&acao=gerenciar
7	admin	Menus	admin.php?modulo=Menus&acao=gerenciar
8	admin	Conteudos	admin.php?modulo=Conteudos&acao=gerenciar
9	admin	Tipos de Encomenda	admin.php?modulo=TiposEncomendas&acao=gerenciar
10	admin	Encomendas	admin.php?modulo=Encomendas&acao=gerenciar
11	admin	Funcionarios	admin.php?modulo=Funcionarios&acao=gerenciar
12	admin	Banners	admin.php?modulo=Banners&acao=gerenciar
2	front	Cadastre-se	index.php?modulo=Clientes&acao=cadastro
13	admin	teste	#
14	admin	sdfsdf	sdfsdfd
\.


--
-- Name: menus_id_seq; Type: SEQUENCE SET; Schema: public; Owner: userdexter
--

SELECT pg_catalog.setval('menus_id_seq', 14, true);


--
-- Data for Name: perfis; Type: TABLE DATA; Schema: public; Owner: userdexter
--

COPY perfis (id, descricao) FROM stdin;
admin	Admin
front	Frontend
\.


--
-- Name: banners_pkey; Type: CONSTRAINT; Schema: public; Owner: userdexter; Tablespace: 
--

ALTER TABLE ONLY banners
    ADD CONSTRAINT banners_pkey PRIMARY KEY (id);


--
-- Name: clientes_pkey; Type: CONSTRAINT; Schema: public; Owner: userdexter; Tablespace: 
--

ALTER TABLE ONLY clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (id);


--
-- Name: conteudos_pkey; Type: CONSTRAINT; Schema: public; Owner: userdexter; Tablespace: 
--

ALTER TABLE ONLY conteudos
    ADD CONSTRAINT conteudos_pkey PRIMARY KEY (id);


--
-- Name: funcionarios_pkey; Type: CONSTRAINT; Schema: public; Owner: userdexter; Tablespace: 
--

ALTER TABLE ONLY funcionarios
    ADD CONSTRAINT funcionarios_pkey PRIMARY KEY (id);


--
-- Name: menus_pkey; Type: CONSTRAINT; Schema: public; Owner: userdexter; Tablespace: 
--

ALTER TABLE ONLY menus
    ADD CONSTRAINT menus_pkey PRIMARY KEY (id);


--
-- Name: perfis_pkey; Type: CONSTRAINT; Schema: public; Owner: userdexter; Tablespace: 
--

ALTER TABLE ONLY perfis
    ADD CONSTRAINT perfis_pkey PRIMARY KEY (id);


--
-- Name: funcionarios_fk; Type: FK CONSTRAINT; Schema: public; Owner: userdexter
--

ALTER TABLE ONLY funcionarios
    ADD CONSTRAINT funcionarios_fk FOREIGN KEY (prf_id) REFERENCES perfis(id) ON UPDATE CASCADE;


--
-- Name: menus_fk; Type: FK CONSTRAINT; Schema: public; Owner: userdexter
--

ALTER TABLE ONLY menus
    ADD CONSTRAINT menus_fk FOREIGN KEY (prf_id) REFERENCES perfis(id) ON UPDATE CASCADE;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

