--
-- PostgreSQL database dump
--

-- Dumped from database version 14.0
-- Dumped by pg_dump version 14.0

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
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id bigint NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: django_site; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.django_site OWNER TO postgres;

--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_site_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_site_id_seq OWNER TO postgres;

--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_site_id_seq OWNED BY public.django_site.id;


--
-- Name: payments_customer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payments_customer (
    id bigint NOT NULL,
    stripe_id character varying(50) NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.payments_customer OWNER TO postgres;

--
-- Name: payments_customer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.payments_customer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payments_customer_id_seq OWNER TO postgres;

--
-- Name: payments_customer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.payments_customer_id_seq OWNED BY public.payments_customer.id;


--
-- Name: payments_order; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payments_order (
    id bigint NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    amount integer NOT NULL,
    status character varying(15) NOT NULL,
    address character varying(255) NOT NULL,
    customer_id bigint NOT NULL,
    CONSTRAINT payments_order_amount_check CHECK ((amount >= 0))
);


ALTER TABLE public.payments_order OWNER TO postgres;

--
-- Name: payments_order_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.payments_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payments_order_id_seq OWNER TO postgres;

--
-- Name: payments_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.payments_order_id_seq OWNED BY public.payments_order.id;


--
-- Name: products_category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products_category (
    id bigint NOT NULL,
    name character varying(200) NOT NULL,
    slug character varying(250) NOT NULL,
    number_of_products integer NOT NULL
);


ALTER TABLE public.products_category OWNER TO postgres;

--
-- Name: products_category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_category_id_seq OWNER TO postgres;

--
-- Name: products_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_category_id_seq OWNED BY public.products_category.id;


--
-- Name: products_comment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products_comment (
    id bigint NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    ip inet,
    text text NOT NULL,
    product_id bigint NOT NULL,
    user_id bigint
);


ALTER TABLE public.products_comment OWNER TO postgres;

--
-- Name: products_comment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_comment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_comment_id_seq OWNER TO postgres;

--
-- Name: products_comment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_comment_id_seq OWNED BY public.products_comment.id;


--
-- Name: products_like; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products_like (
    id bigint NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    ip inet,
    product_id bigint NOT NULL,
    user_id bigint
);


ALTER TABLE public.products_like OWNER TO postgres;

--
-- Name: products_like_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_like_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_like_id_seq OWNER TO postgres;

--
-- Name: products_like_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_like_id_seq OWNED BY public.products_like.id;


--
-- Name: products_product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products_product (
    id bigint NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    name character varying(200) NOT NULL,
    slug character varying(250) NOT NULL,
    price numeric(9,2) NOT NULL,
    description text NOT NULL,
    image character varying(100) NOT NULL,
    category_id bigint NOT NULL
);


ALTER TABLE public.products_product OWNER TO postgres;

--
-- Name: products_product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_product_id_seq OWNER TO postgres;

--
-- Name: products_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_product_id_seq OWNED BY public.products_product.id;


--
-- Name: users_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users_user (
    id bigint NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.users_user OWNER TO postgres;

--
-- Name: users_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users_user_groups (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.users_user_groups OWNER TO postgres;

--
-- Name: users_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_groups_id_seq OWNER TO postgres;

--
-- Name: users_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_user_groups_id_seq OWNED BY public.users_user_groups.id;


--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO postgres;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users_user.id;


--
-- Name: users_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users_user_user_permissions (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.users_user_user_permissions OWNER TO postgres;

--
-- Name: users_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: users_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_user_user_permissions_id_seq OWNED BY public.users_user_user_permissions.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: django_site id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_site ALTER COLUMN id SET DEFAULT nextval('public.django_site_id_seq'::regclass);


--
-- Name: payments_customer id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments_customer ALTER COLUMN id SET DEFAULT nextval('public.payments_customer_id_seq'::regclass);


--
-- Name: payments_order id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments_order ALTER COLUMN id SET DEFAULT nextval('public.payments_order_id_seq'::regclass);


--
-- Name: products_category id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_category ALTER COLUMN id SET DEFAULT nextval('public.products_category_id_seq'::regclass);


--
-- Name: products_comment id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_comment ALTER COLUMN id SET DEFAULT nextval('public.products_comment_id_seq'::regclass);


--
-- Name: products_like id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_like ALTER COLUMN id SET DEFAULT nextval('public.products_like_id_seq'::regclass);


--
-- Name: products_product id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_product ALTER COLUMN id SET DEFAULT nextval('public.products_product_id_seq'::regclass);


--
-- Name: users_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user ALTER COLUMN id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Name: users_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user_groups ALTER COLUMN id SET DEFAULT nextval('public.users_user_groups_id_seq'::regclass);


--
-- Name: users_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.users_user_user_permissions_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add permission	1	add_permission
2	Can change permission	1	change_permission
3	Can delete permission	1	delete_permission
4	Can view permission	1	view_permission
5	Can add group	2	add_group
6	Can change group	2	change_group
7	Can delete group	2	delete_group
8	Can view group	2	view_group
9	Can add content type	3	add_contenttype
10	Can change content type	3	change_contenttype
11	Can delete content type	3	delete_contenttype
12	Can view content type	3	view_contenttype
13	Can add session	4	add_session
14	Can change session	4	change_session
15	Can delete session	4	delete_session
16	Can view session	4	view_session
17	Can add site	5	add_site
18	Can change site	5	change_site
19	Can delete site	5	delete_site
20	Can view site	5	view_site
21	Can add log entry	6	add_logentry
22	Can change log entry	6	change_logentry
23	Can delete log entry	6	delete_logentry
24	Can view log entry	6	view_logentry
25	Can add user	7	add_user
26	Can change user	7	change_user
27	Can delete user	7	delete_user
28	Can view user	7	view_user
29	Can add category	8	add_category
30	Can change category	8	change_category
31	Can delete category	8	delete_category
32	Can view category	8	view_category
33	Can add product	9	add_product
34	Can change product	9	change_product
35	Can delete product	9	delete_product
36	Can view product	9	view_product
37	Can add comment	10	add_comment
38	Can change comment	10	change_comment
39	Can delete comment	10	delete_comment
40	Can view comment	10	view_comment
41	Can add like	11	add_like
42	Can change like	11	change_like
43	Can delete like	11	delete_like
44	Can view like	11	view_like
45	Can add customer	12	add_customer
46	Can change customer	12	change_customer
47	Can delete customer	12	delete_customer
48	Can view customer	12	view_customer
49	Can add order	13	add_order
50	Can change order	13	change_order
51	Can delete order	13	delete_order
52	Can view order	13	view_order
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2021-10-07 16:35:42.290881+03	1	Smartphones	1	[{"added": {}}]	8	1
2	2021-10-07 16:35:56.607303+03	2	Laptops	1	[{"added": {}}]	8	1
3	2021-10-07 16:37:03.213515+03	3	Tablets	1	[{"added": {}}]	8	1
4	2021-10-07 16:39:23.351221+03	1	Samsung Galaxy Z Fold 3	1	[{"added": {}}]	9	1
5	2021-10-07 16:41:00.963016+03	2	ASUS ZenBook 13 UX325JA Pine Gray	1	[{"added": {}}]	9	1
6	2021-10-07 16:42:17.700993+03	2	ASUS ZenBook 13 UX325JA Pine Gray	2	[{"changed": {"fields": ["Picture"]}}]	9	1
7	2021-10-07 16:56:14.114622+03	3	Apple iPhone 12 Pro Max 512GB	1	[{"added": {}}]	9	1
8	2021-10-07 16:58:50.106781+03	4	Apple iPad Air 2020 Wi-Fi 64GB Space Gray	1	[{"added": {}}]	9	1
9	2021-10-08 13:37:32.704146+03	5	Samsung Galaxy A52 8/256GB Black	1	[{"added": {}}]	9	1
10	2021-10-08 13:49:41.547739+03	6	Samsung Galaxy S20 FE SM-G780F 6/128GB Blue	1	[{"added": {}}]	9	1
11	2021-10-08 13:51:14.771936+03	5	Samsung Galaxy A52 8/256GB Black	2	[{"changed": {"fields": ["Slug"]}}]	9	1
12	2021-10-08 14:02:24.826689+03	6	Samsung Galaxy S20 FE SM-G780F 6/128GB Blue	2	[{"changed": {"fields": ["Slug"]}}]	9	1
13	2021-10-08 14:02:55.54287+03	5	Samsung Galaxy A52 8/256GB Black	2	[{"changed": {"fields": ["Slug"]}}]	9	1
14	2021-10-08 14:46:37.004529+03	14	Samsung Galaxy S20 FE SM-G780F 6/128GB Blue	1	[{"added": {}}]	9	1
15	2021-10-08 14:49:24.649959+03	14	Samsung Galaxy S20 FE SM-G780F 6/128GB Blue	2	[{"changed": {"fields": ["Slug"]}}]	9	1
16	2021-10-08 15:07:21.818166+03	14	Samsung Galaxy S20 FE SM-G780F 6/128GB Blue	2	[{"changed": {"fields": ["Slug"]}}]	9	1
17	2021-10-08 15:15:34.078799+03	14	Samsung Galaxy S20 FE SM-G780F 6/128GB Blue	3		9	1
18	2021-10-08 15:15:49.413897+03	6	Samsung Galaxy S20 FE SM-G780F 6/128GB Blue	2	[{"changed": {"fields": ["Picture"]}}]	9	1
19	2021-10-08 15:17:06.123374+03	5	Samsung Galaxy A52 8/256GB Black	2	[{"changed": {"fields": ["Picture"]}}]	9	1
20	2021-10-08 15:18:33.279512+03	5	Samsung Galaxy A52 8/256GB Black	2	[{"changed": {"fields": ["Picture"]}}]	9	1
21	2021-10-08 15:23:23.546002+03	15	Samsung Galaxy A51 2020 6/128GB Blue	1	[{"added": {}}]	9	1
22	2021-10-08 15:24:39.001385+03	15	Samsung Galaxy A51 2020 6/128GB Blue	2	[{"changed": {"fields": ["Picture"]}}]	9	1
23	2021-10-08 15:26:09.039602+03	15	Samsung Galaxy A51 2020 6/128GB Blue	2	[{"changed": {"fields": ["Picture"]}}]	9	1
24	2021-10-08 15:46:44.897069+03	15	Samsung Galaxy A51 2020 6/128GB Blue	2	[{"changed": {"fields": ["Picture"]}}]	9	1
25	2021-10-08 15:58:51.165894+03	15	Samsung Galaxy A51 2020 6/128GB Blue	2	[{"changed": {"fields": ["Picture"]}}]	9	1
26	2021-10-08 15:59:25.438441+03	15	Samsung Galaxy A51 2020 6/128GB Blue	2	[{"changed": {"fields": ["Picture"]}}]	9	1
27	2021-10-08 16:00:36.180826+03	6	Samsung Galaxy S20 FE SM-G780F 6/128GB Blue	2	[{"changed": {"fields": ["Picture"]}}]	9	1
28	2021-10-08 16:21:10.545726+03	16	HUAWEI P smart 2021 4/128GB Crush Green	1	[{"added": {}}]	9	1
29	2021-10-11 01:28:57.596635+03	2	comment from admin	3		10	1
30	2021-10-11 01:29:08.946006+03	5	comment from admin	3		10	1
31	2021-10-11 01:50:13.199135+03	1	localhost:8000	2	[{"changed": {"fields": ["Domain name", "Display name"]}}]	5	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	auth	permission
2	auth	group
3	contenttypes	contenttype
4	sessions	session
5	sites	site
6	admin	logentry
7	users	user
8	products	category
9	products	product
10	products	comment
11	products	like
12	payments	customer
13	payments	order
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2021-10-07 16:03:00.085146+03
2	contenttypes	0002_remove_content_type_name	2021-10-07 16:03:00.096142+03
3	auth	0001_initial	2021-10-07 16:03:00.138129+03
4	auth	0002_alter_permission_name_max_length	2021-10-07 16:03:00.143127+03
5	auth	0003_alter_user_email_max_length	2021-10-07 16:03:00.148126+03
6	auth	0004_alter_user_username_opts	2021-10-07 16:03:00.153124+03
7	auth	0005_alter_user_last_login_null	2021-10-07 16:03:00.157123+03
8	auth	0006_require_contenttypes_0002	2021-10-07 16:03:00.159122+03
9	auth	0007_alter_validators_add_error_messages	2021-10-07 16:03:00.163121+03
10	auth	0008_alter_user_username_max_length	2021-10-07 16:03:00.16712+03
11	users	0001_initial	2021-10-07 16:03:00.207108+03
12	admin	0001_initial	2021-10-07 16:03:00.2271+03
13	admin	0002_logentry_remove_auto_add	2021-10-07 16:03:00.234099+03
14	admin	0003_logentry_add_action_flag_choices	2021-10-07 16:03:00.241096+03
15	auth	0009_alter_user_last_name_max_length	2021-10-07 16:03:00.247094+03
16	auth	0010_alter_group_name_max_length	2021-10-07 16:03:00.259091+03
17	auth	0011_update_proxy_permissions	2021-10-07 16:03:00.265088+03
18	auth	0012_alter_user_first_name_max_length	2021-10-07 16:03:00.272086+03
19	payments	0001_initial	2021-10-07 16:03:00.300079+03
20	payments	0002_auto_20211007_0111	2021-10-07 16:03:00.351061+03
21	products	0001_initial	2021-10-07 16:03:00.42004+03
22	sessions	0001_initial	2021-10-07 16:03:00.430036+03
23	sites	0001_initial	2021-10-07 16:03:00.436034+03
24	sites	0002_alter_domain_unique	2021-10-07 16:03:00.442032+03
25	users	0002_auto_20211007_0108	2021-10-07 16:03:00.457028+03
26	users	0003_alter_user_id	2021-10-07 16:03:00.541+03
27	products	0002_auto_20211008_1334	2021-10-08 13:34:46.538434+03
28	products	0003_auto_20211008_1445	2021-10-08 14:46:02.87344+03
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
v0bjqxadb3me4ut5spsy0q22tskg4hzc	.eJxVjDsOwyAQBe9CHSG-C6RM7zOgBVbBSQSSsasod48tuUjaNzPvzSJua43boCXOhV2ZZJffLWF-UjtAeWC7d557W5c58UPhJx186oVet9P9O6g46l5nKQToZEA5DdpRAOl11jIbqSBpgaY46whLtpi8KiqZnWCw4Cl4Avb5Aq7ANto:1mYT4B:xiy6rKhJuVxP8IY7tQEh5I5PgRPY0_8v_Spu1O_y5TE	2021-10-21 16:04:07.470604+03
o7qziijis96131ct8hfxgq4xkhsomvgv	.eJxVjDsOwyAQBe9CHSG-C6RM7zOgBVbBSQSSsasod48tuUjaNzPvzSJua43boCXOhV2ZZJffLWF-UjtAeWC7d557W5c58UPhJx186oVet9P9O6g46l5nKQToZEA5DdpRAOl11jIbqSBpgaY46whLtpi8KiqZnWCw4Cl4Avb5Aq7ANto:1mYctn:UrmIG0R4FFSooRwK6YlT03qkzG4u8Ff-xpE85axMMF0	2021-10-22 02:34:03.706884+03
9ldikicidzd3jss6syupzf5z0d5l4sr4	.eJxVjDsOwyAQBe9CHSG-C6RM7zOgBVbBSQSSsasod48tuUjaNzPvzSJua43boCXOhV2ZZJffLWF-UjtAeWC7d557W5c58UPhJx186oVet9P9O6g46l5nKQToZEA5DdpRAOl11jIbqSBpgaY46whLtpi8KiqZnWCw4Cl4Avb5Aq7ANto:1mZhcf:rYH1QPgkFbazjsDoY_BYupKWH9Lpxoigi4vkT42LzJo	2021-10-25 01:48:49.163+03
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_site (id, domain, name) FROM stdin;
1	localhost:8000	localhost:8000
\.


--
-- Data for Name: payments_customer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payments_customer (id, stripe_id, user_id) FROM stdin;
\.


--
-- Data for Name: payments_order; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payments_order (id, created, modified, amount, status, address, customer_id) FROM stdin;
\.


--
-- Data for Name: products_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products_category (id, name, slug, number_of_products) FROM stdin;
1	Smartphones	smartphones	6
2	Laptops	laptops	1
3	Tablets	tablets	1
\.


--
-- Data for Name: products_comment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products_comment (id, created, modified, ip, text, product_id, user_id) FROM stdin;
1	2021-10-10 23:02:05.141012+03	2021-10-10 23:02:05.141012+03	\N	Comment #1	16	1
3	2021-10-10 23:13:54.612726+03	2021-10-10 23:13:54.612726+03	\N	Comment #2	16	1
4	2021-10-10 23:32:51.040728+03	2021-10-10 23:32:51.040728+03	127.0.0.1	Anon comment	16	\N
\.


--
-- Data for Name: products_like; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products_like (id, created, modified, ip, product_id, user_id) FROM stdin;
16	2021-10-11 01:26:17.102367+03	2021-10-11 01:26:17.102367+03	\N	6	1
19	2021-10-11 12:37:43.191471+03	2021-10-11 12:37:43.191471+03	127.0.0.1	16	\N
20	2021-10-11 12:37:57.46045+03	2021-10-11 12:37:57.46045+03	\N	16	1
\.


--
-- Data for Name: products_product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products_product (id, created, modified, name, slug, price, description, image, category_id) FROM stdin;
1	2021-10-07 16:39:23.243255+03	2021-10-07 16:39:23.243255+03	Samsung Galaxy Z Fold 3	samsung-galaxy-z-fold-3	2099.32	Samsung Galaxy Z Fold3 5G is a continuation of one of the most futuristic lines of smartphones on the market. The second version received a large list of improvements that relate not only to the technical equipment, but also the performance of the flexible device. Samsung Galaxy Z Fold3 5G has a magnified to 6.2-inch external Super Amoled display, the resolution of which is 2268x832 pixels.	product_pictures/Smartphones/Samsung Galaxy Z Fold 3/galaxy_z_fold_3.png	1
2	2021-10-07 16:41:00.94802+03	2021-10-07 16:42:17.694995+03	ASUS ZenBook 13 UX325JA Pine Gray	asus-zenbook-13-ux325ja-pine-gray	1538.00	ASUS ZenBook 13 UX325JA is a working tool that combines high performance with maximum thinness and lightness of the case. It weighs a little more than a kilogram, which allows you to comfortably carry it everywhere and work away from the walls of the office or home. Complements such mobility and a high level of autonomy.	product_pictures/Laptops/ASUS ZenBook 13 UX325JA Pine Gray/asus_zenbook_13_ux325JA_pine_gray.png	2
3	2021-10-07 16:56:14.104625+03	2021-10-07 16:56:14.104625+03	Apple iPhone 12 Pro Max 512GB	apple-iphone-12-pro-max-512gb	1867.36	Apple iPhone 12 Pro Max - a large-format version of the flagship 2020 from the Cupertino company. The smartphone has received an updated design that combines strict steel borders and new expressive body colors. Apple iPhone 12 Pro Max is equipped with a 6.7-inch screen, which is covered with a specially designed protective ceramic glass, which, according to Apple, can protect it up to 4 times better from shocks. The A14 processor allows you to bring the device's performance to even more incredible heights.	product_pictures/Smartphones/Apple iPhone 12 Pro Max 512GB/apple_iphone_12_pro_max.png	1
4	2021-10-07 16:58:50.092759+03	2021-10-07 16:58:50.092759+03	Apple iPad Air 2020 Wi-Fi 64GB Space Gray	apple-ipad-air-2020-wi-fi-64gb-space-gray	757.98	Apple iPad Air 2020 - an updated version of one of the thinnest, lightest and most stylish tablets in the company's line. The design has been rethought and pleases with sharp corners and edges, as well as a reduced frame around the display, which allowed to increase the screen diagonal to 10.9 inches. Additionally, the tablet received a wide range of bright and unusual colors. The Apple iPad Air 2020 has an IPS display with a resolution of 2360x1640 pixels, wide color gamut, support for proprietary True Tone technology and an Apple Pencil pen. High performance is achieved by the efforts of 6-core Apple A14 Bionic processors. The main camera has a 12 MP module, and is capable of recording video with a resolution of 4K at a frequency of 60 fps. The front camera is equipped with a 7 MP sensor. Apple iPad Air 2020 sets differ not only in the volume of the built-in drive, but also in the presence of LTE.	product_pictures/Tablets/Apple iPad Air 2020 Wi-Fi 64GB Space Gray/apple_ipad_air_2020.png	3
5	2021-10-08 13:37:32.594182+03	2021-10-08 15:18:33.272515+03	Samsung Galaxy A52 8/256GB Black	samsung-galaxy-a52-8256gb-black	478.00	Samsung Galaxy A52 is a line of smartphones of the company, which is a reasonable balance between practical rigor and advanced technical solutions of flagship devices. The model received a large 6.5-inch Super AMOLED display that occupies the entire front surface. It supports a refresh rate of 90 Hz and a maximum brightness of up to 800 nits. It also has a built-in fingerprint scanner. The case of Samsung Galaxy A52 is protected from dust and moisture according to the IP67 standard. The user has a choice of several nice color options.	product_pictures/Smartphones/Samsung Galaxy A52 8256GB Black/samsung_galaxy_a52_8_256_black.png	1
16	2021-10-08 16:21:10.529731+03	2021-10-08 16:21:10.541727+03	HUAWEI P smart 2021 4/128GB Crush Green	huawei-p-smart-2021-4128gb-crush-green	200.00	HUAWEI P smart 2021 is an amazing smartphone that successfully combines a frameless design, bright body colors and a good level of performance. It has an 8-core processor of its own development - Kirin 710A. The 6.67-inch IPS display HUAWEI P smart 2021 occupies almost the entire front surface, from edge to edge. The screen supports a resolution of 2400x1080 pixels and is able to pleasantly surprise with good color accuracy.	product_pictures/Smartphones/HUAWEI P smart 2021 4128GB Crush Green/huawei-p-smart-2021-_uAMLSIU.png	1
15	2021-10-08 15:23:23.480023+03	2021-10-08 15:59:25.432443+03	Samsung Galaxy A51 2020 6/128GB Blue	samsung-galaxy-a51-2020-6128gb-blue	279.00	Samsung Galaxy A51 2020 is an elegant smartphone that combines extravagant design, unusual body colors and a high level of technical equipment. It got a completely frameless performance, and the 6.5-inch Super AMOLED display occupies almost the entire front surface. The front camera of the 32 MP Samsung Galaxy A51 2020 is hidden in a miniature cutout in the screen.	product_pictures/Smartphones/Samsung Galaxy A51 2020 6128GB Blue/samsung-galaxy-a51-2020_yvI63g1.png	1
6	2021-10-08 13:49:41.538742+03	2021-10-08 16:00:36.174828+03	Samsung Galaxy S20 FE SM-G780F 6/128GB Blue	samsung-galaxy-s20-fe-sm-g780f-6128gb-blue	653.00	Samsung Galaxy S20 FE SM-G780F is not quite an ordinary extension of the company's line of flagship solutions, as it was created taking into account the wishes of the company's fans and its devices. It is designed as a slightly more affordable and practical version of its older counterpart and has absorbed only well-established solutions. Samsung Galaxy S20 FE SM-G780F is equipped with a 6.5-inch Super AMOLED display with a resolution of 2400x1080 pixels.	product_pictures/Smartphones/Samsung Galaxy S20 FE SM-G780F 6128GB Blue/samsung-galaxy-s_CZW3tUW.png	1
\.


--
-- Data for Name: users_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
2	pbkdf2_sha256$260000$ClbsanX220q4TDY4txnN7t$pRGN5mOsMm7g8Eb+DaZGcaQRjuQ0Z3E60NCOg69eTc4=	\N	t	shopadmin			shopadmin@example.com	t	t	2021-10-07 17:41:36.012614+03
1	pbkdf2_sha256$260000$6OhdW1ntRzijP80STYUWeh$a4jor0nld3yV7LF36vhr95Xkq4oGRnHMJHEkonSsUCU=	2021-10-11 12:37:52.937383+03	t	admin			admin@example.com	t	t	2021-10-07 16:03:50.105156+03
\.


--
-- Data for Name: users_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: users_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 52, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 31, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 13, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 28, true);


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_site_id_seq', 1, true);


--
-- Name: payments_customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payments_customer_id_seq', 1, false);


--
-- Name: payments_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payments_order_id_seq', 1, false);


--
-- Name: products_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_category_id_seq', 3, true);


--
-- Name: products_comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_comment_id_seq', 5, true);


--
-- Name: products_like_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_like_id_seq', 20, true);


--
-- Name: products_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_product_id_seq', 16, true);


--
-- Name: users_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_user_groups_id_seq', 1, false);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_user_id_seq', 2, true);


--
-- Name: users_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_user_user_permissions_id_seq', 1, false);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site django_site_domain_a2e37b91_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_domain_a2e37b91_uniq UNIQUE (domain);


--
-- Name: django_site django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: payments_customer payments_customer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments_customer
    ADD CONSTRAINT payments_customer_pkey PRIMARY KEY (id);


--
-- Name: payments_customer payments_customer_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments_customer
    ADD CONSTRAINT payments_customer_user_id_key UNIQUE (user_id);


--
-- Name: payments_order payments_order_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments_order
    ADD CONSTRAINT payments_order_pkey PRIMARY KEY (id);


--
-- Name: products_category products_category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_category
    ADD CONSTRAINT products_category_pkey PRIMARY KEY (id);


--
-- Name: products_category products_category_slug_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_category
    ADD CONSTRAINT products_category_slug_key UNIQUE (slug);


--
-- Name: products_comment products_comment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_comment
    ADD CONSTRAINT products_comment_pkey PRIMARY KEY (id);


--
-- Name: products_like products_like_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_like
    ADD CONSTRAINT products_like_pkey PRIMARY KEY (id);


--
-- Name: products_like products_like_product_id_ip_97d722a9_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_like
    ADD CONSTRAINT products_like_product_id_ip_97d722a9_uniq UNIQUE (product_id, ip);


--
-- Name: products_like products_like_product_id_user_id_20f0a0e2_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_like
    ADD CONSTRAINT products_like_product_id_user_id_20f0a0e2_uniq UNIQUE (product_id, user_id);


--
-- Name: products_product products_product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_product
    ADD CONSTRAINT products_product_pkey PRIMARY KEY (id);


--
-- Name: products_product products_product_slug_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_product
    ADD CONSTRAINT products_product_slug_key UNIQUE (slug);


--
-- Name: users_user_groups users_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_pkey PRIMARY KEY (id);


--
-- Name: users_user_groups users_user_groups_user_id_group_id_b88eab82_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_user_id_group_id_b88eab82_uniq UNIQUE (user_id, group_id);


--
-- Name: users_user users_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user
    ADD CONSTRAINT users_user_pkey PRIMARY KEY (id);


--
-- Name: users_user_user_permissions users_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: users_user_user_permissions users_user_user_permissions_user_id_permission_id_43338c45_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_permissions_user_id_permission_id_43338c45_uniq UNIQUE (user_id, permission_id);


--
-- Name: users_user users_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user
    ADD CONSTRAINT users_user_username_key UNIQUE (username);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: django_site_domain_a2e37b91_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_site_domain_a2e37b91_like ON public.django_site USING btree (domain varchar_pattern_ops);


--
-- Name: payments_order_customer_id_8d44d52e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX payments_order_customer_id_8d44d52e ON public.payments_order USING btree (customer_id);


--
-- Name: products_category_slug_c558efae_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX products_category_slug_c558efae_like ON public.products_category USING btree (slug varchar_pattern_ops);


--
-- Name: products_comment_product_id_b55b4f01; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX products_comment_product_id_b55b4f01 ON public.products_comment USING btree (product_id);


--
-- Name: products_comment_user_id_01a779ad; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX products_comment_user_id_01a779ad ON public.products_comment USING btree (user_id);


--
-- Name: products_like_product_id_804fd333; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX products_like_product_id_804fd333 ON public.products_like USING btree (product_id);


--
-- Name: products_like_user_id_0e3c48d0; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX products_like_user_id_0e3c48d0 ON public.products_like USING btree (user_id);


--
-- Name: products_product_category_id_9b594869; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX products_product_category_id_9b594869 ON public.products_product USING btree (category_id);


--
-- Name: products_product_slug_70d3148d_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX products_product_slug_70d3148d_like ON public.products_product USING btree (slug varchar_pattern_ops);


--
-- Name: users_user_groups_group_id_9afc8d0e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_user_groups_group_id_9afc8d0e ON public.users_user_groups USING btree (group_id);


--
-- Name: users_user_groups_user_id_5f6f5a90; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_user_groups_user_id_5f6f5a90 ON public.users_user_groups USING btree (user_id);


--
-- Name: users_user_user_permissions_permission_id_0b93982e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_user_user_permissions_permission_id_0b93982e ON public.users_user_user_permissions USING btree (permission_id);


--
-- Name: users_user_user_permissions_user_id_20aca447; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_user_user_permissions_user_id_20aca447 ON public.users_user_user_permissions USING btree (user_id);


--
-- Name: users_user_username_06e46fe6_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_user_username_06e46fe6_like ON public.users_user USING btree (username varchar_pattern_ops);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: payments_customer payments_customer_user_id_feafd7e4_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments_customer
    ADD CONSTRAINT payments_customer_user_id_feafd7e4_fk FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: payments_order payments_order_customer_id_8d44d52e_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments_order
    ADD CONSTRAINT payments_order_customer_id_8d44d52e_fk FOREIGN KEY (customer_id) REFERENCES public.payments_customer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_comment products_comment_product_id_b55b4f01_fk_products_product_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_comment
    ADD CONSTRAINT products_comment_product_id_b55b4f01_fk_products_product_id FOREIGN KEY (product_id) REFERENCES public.products_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_comment products_comment_user_id_01a779ad_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_comment
    ADD CONSTRAINT products_comment_user_id_01a779ad_fk FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_like products_like_product_id_804fd333_fk_products_product_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_like
    ADD CONSTRAINT products_like_product_id_804fd333_fk_products_product_id FOREIGN KEY (product_id) REFERENCES public.products_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_like products_like_user_id_0e3c48d0_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_like
    ADD CONSTRAINT products_like_user_id_0e3c48d0_fk FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_product products_product_category_id_9b594869_fk_products_category_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_product
    ADD CONSTRAINT products_product_category_id_9b594869_fk_products_category_id FOREIGN KEY (category_id) REFERENCES public.products_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_groups users_user_groups_group_id_9afc8d0e_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_group_id_9afc8d0e_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_user_permissions users_user_user_perm_permission_id_0b93982e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_perm_permission_id_0b93982e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

