--
-- PostgreSQL database dump
--

-- Dumped from database version 13.4
-- Dumped by pg_dump version 13.4

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
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


--
-- Name: orders_order; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.orders_order (
    id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    email character varying(254) NOT NULL,
    address character varying(250) NOT NULL,
    postal_code character varying(20) NOT NULL,
    city character varying(100) NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    paid boolean NOT NULL,
    braintree_id character varying(150) NOT NULL
);


--
-- Name: orders_order_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.orders_order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: orders_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.orders_order_id_seq OWNED BY public.orders_order.id;


--
-- Name: orders_orderitem; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.orders_orderitem (
    id integer NOT NULL,
    price numeric(10,2) NOT NULL,
    quantity integer NOT NULL,
    order_id integer NOT NULL,
    product_id integer NOT NULL,
    CONSTRAINT orders_orderitem_quantity_check CHECK ((quantity >= 0))
);


--
-- Name: orders_orderitem_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.orders_orderitem_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: orders_orderitem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.orders_orderitem_id_seq OWNED BY public.orders_orderitem.id;


--
-- Name: shop_category; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.shop_category (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    slug character varying(200) NOT NULL
);


--
-- Name: shop_category_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.shop_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: shop_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.shop_category_id_seq OWNED BY public.shop_category.id;


--
-- Name: shop_product; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.shop_product (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    slug character varying(200) NOT NULL,
    image character varying(100) NOT NULL,
    description text NOT NULL,
    price numeric(10,2) NOT NULL,
    available boolean NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    category_id integer NOT NULL
);


--
-- Name: shop_product_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.shop_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: shop_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.shop_product_id_seq OWNED BY public.shop_product.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: orders_order id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders_order ALTER COLUMN id SET DEFAULT nextval('public.orders_order_id_seq'::regclass);


--
-- Name: orders_orderitem id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders_orderitem ALTER COLUMN id SET DEFAULT nextval('public.orders_orderitem_id_seq'::regclass);


--
-- Name: shop_category id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.shop_category ALTER COLUMN id SET DEFAULT nextval('public.shop_category_id_seq'::regclass);


--
-- Name: shop_product id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.shop_product ALTER COLUMN id SET DEFAULT nextval('public.shop_product_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add category	7	add_category
26	Can change category	7	change_category
27	Can delete category	7	delete_category
28	Can view category	7	view_category
29	Can add product	8	add_product
30	Can change product	8	change_product
31	Can delete product	8	delete_product
32	Can view product	8	view_product
33	Can add order item	9	add_orderitem
34	Can change order item	9	change_orderitem
35	Can delete order item	9	delete_orderitem
36	Can view order item	9	view_orderitem
37	Can add order	10	add_order
38	Can change order	10	change_order
39	Can delete order	10	delete_order
40	Can view order	10	view_order
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$180000$cJhQ6WVve53x$xQEfg57ZS+MOSemle+Og0G+wQpqXExFQrjJpUNvWFks=	2021-08-23 18:39:02.582-06	t	admin			czarina.catambing@usask.ca	t	t	2020-06-14 22:23:46.521-06
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2020-06-16 07:56:27.81-06	1	Dairy	1	[{"added": {}}]	7	1
2	2020-06-16 07:56:30.334-06	1	Milk	1	[{"added": {}}]	8	1
3	2020-06-16 07:56:40.586-06	2	Produce	1	[{"added": {}}]	7	1
4	2020-06-16 07:57:12.105-06	2	Lemon	1	[{"added": {}}]	8	1
5	2021-08-23 16:50:16.041-06	1	Dairyland - 2% Milk, 2 Litre	2	[{"changed": {"fields": ["Name", "Slug", "Image", "Description", "Price"]}}]	8	1
6	2021-08-23 16:51:01.003-06	3	International Delight - Coffee Whitener - French Vanilla, 946 Millilitre	1	[{"added": {}}]	8	1
7	2021-08-23 16:51:31.188-06	3	Bakery	1	[{"added": {}}]	7	1
8	2021-08-23 16:51:38.866-06	4	Frozen	1	[{"added": {}}]	7	1
9	2021-08-23 16:51:52.751-06	5	Health and beauty	1	[{"added": {}}]	7	1
10	2021-08-23 16:52:07.968-06	6	Meat and seafood	1	[{"added": {}}]	7	1
11	2021-08-23 16:52:12.697-06	7	Pantry	1	[{"added": {}}]	7	1
12	2021-08-23 16:52:31.071-06	8	Deli and readymade meals	1	[{"added": {}}]	7	1
13	2021-08-23 16:52:47.802-06	9	Cleaning and home	1	[{"added": {}}]	7	1
14	2021-08-23 16:52:53.096-06	10	Pet care	1	[{"added": {}}]	7	1
15	2021-08-23 16:53:02.06-06	1	Dairy and eggs	2	[{"changed": {"fields": ["Name"]}}]	7	1
16	2021-08-23 16:54:20.709-06	4	Cauliflower	1	[{"added": {}}]	8	1
17	2021-08-23 16:56:16.92-06	11	Pharmacy	1	[{"added": {}}]	7	1
18	2021-08-23 16:56:45.489-06	5	Broccolio	1	[{"added": {}}]	8	1
19	2021-08-23 16:57:44.05-06	6	Apples - gala small	1	[{"added": {}}]	8	1
20	2021-08-23 16:58:15.996-06	5	Broccoli	2	[{"changed": {"fields": ["Name", "Slug"]}}]	8	1
21	2021-08-23 16:59:22.739-06	7	D'Italiano - Thick Sliced Bread - Original, 675 Gram	1	[{"added": {}}]	8	1
22	2021-08-23 17:00:15.085-06	8	Bake Shop - Pizza Pretzels, 4 Each	1	[{"added": {}}]	8	1
23	2021-08-23 17:01:14.955-06	9	Cascade - Complete Action Pacs Fresh Scent Dawn, 72 Each	1	[{"added": {}}]	8	1
24	2021-08-23 17:02:08.723-06	10	Lysol - All Purpose Cleaner - Lemon, 650 Millilitre 2 for $7	1	[{"added": {}}]	8	1
25	2021-08-23 17:03:15.367-06	11	Armstrong - Natural Cheddar Cheese - Old, 1.35 Kilogram	1	[{"added": {}}]	8	1
26	2021-08-23 17:03:58.604-06	12	Kraft - Grated Parmesan Cheese, 250 Gram	1	[{"added": {}}]	8	1
27	2021-08-23 17:04:46.81-06	13	Seven Layer - Mexican Dip, 420 Gram	1	[{"added": {}}]	8	1
28	2021-08-23 17:05:38.388-06	14	Lumber Jack Sandwich, 1 Each	1	[{"added": {}}]	8	1
29	2021-08-23 17:06:33.705-06	6	Apples - gala small	2	[{"changed": {"fields": ["Image"]}}]	8	1
30	2021-08-23 17:06:44.437-06	4	Cauliflower	2	[{"changed": {"fields": ["Image"]}}]	8	1
31	2021-08-23 17:07:02.552-06	3	International Delight - Coffee Whitener - French Vanilla, 946 Millilitre	2	[{"changed": {"fields": ["Image"]}}]	8	1
32	2021-08-23 17:09:23.357-06	15	Kellogg's - Eggo Waffles Original, 48 Each	1	[{"added": {}}]	8	1
33	2021-08-23 17:10:14.698-06	16	Janes - Pub Style Chicken Strips, 700 Gram	1	[{"added": {}}]	8	1
34	2021-08-23 17:10:52.65-06	17	Bassili's Best - Meat Lasagna with 4 Cheeses, 2.27 Kilogram	1	[{"added": {}}]	8	1
35	2021-08-23 17:11:45.735-06	18	Q-Tips - Cotton Swabs, 400 Each	1	[{"added": {}}]	8	1
36	2021-08-23 17:12:23.925-06	19	Cerave - Moisturizing Cream, 453 Gram	1	[{"added": {}}]	8	1
37	2021-08-23 17:13:10.904-06	20	Tylenol - Extra Strength eZTabs, 150 Each	1	[{"added": {}}]	8	1
38	2021-08-23 17:13:30.929-06	19	Cerave - Moisturizing Cream, 453 Gram	2	[{"changed": {"fields": ["Image"]}}]	8	1
39	2021-08-23 17:15:10.477-06	21	Maple Leaf - Top Dogs Original Wieners, 10 Each	1	[{"added": {}}]	8	1
40	2021-08-23 17:16:22.058-06	22	Tray Pack Canada Prime Rib Eye Steak, 400 Gram	1	[{"added": {}}]	8	1
41	2021-08-23 17:17:02.96-06	23	Harvest - Bacon - Thick Sliced, 1 Kilogram	1	[{"added": {}}]	8	1
42	2021-08-23 17:17:37.464-06	24	Wild Sockeye Salmon Fillets, 450 Gram	1	[{"added": {}}]	8	1
43	2021-08-23 17:18:27.704-06	25	Folgers - Coffee - Classic Roast, 920 Gram	1	[{"added": {}}]	8	1
44	2021-08-23 17:19:08.693-06	26	Tostitos - Tortilla Chips- Rounds, 295 Gram	1	[{"added": {}}]	8	1
45	2021-08-23 17:20:12.799-06	27	Friskies - Cat Food - Chef's Blend, 7.5 Kilogram	1	[{"added": {}}]	8	1
46	2021-08-23 17:20:42.285-06	20	Tylenol - Extra Strength eZTabs, 150 Each	2	[{"changed": {"fields": ["Category"]}}]	8	1
47	2021-08-23 17:21:16.908-06	24	Wild Sockeye Salmon Fillets, 450 Gram	2	[{"changed": {"fields": ["Image"]}}]	8	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	shop	category
8	shop	product
9	orders	orderitem
10	orders	order
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2021-08-23 20:50:44.842034-06
2	auth	0001_initial	2021-08-23 20:50:44.899742-06
3	admin	0001_initial	2021-08-23 20:50:44.957862-06
4	admin	0002_logentry_remove_auto_add	2021-08-23 20:50:44.973827-06
5	admin	0003_logentry_add_action_flag_choices	2021-08-23 20:50:44.981831-06
6	contenttypes	0002_remove_content_type_name	2021-08-23 20:50:45.000763-06
7	auth	0002_alter_permission_name_max_length	2021-08-23 20:50:45.004752-06
8	auth	0003_alter_user_email_max_length	2021-08-23 20:50:45.013481-06
9	auth	0004_alter_user_username_opts	2021-08-23 20:50:45.022462-06
10	auth	0005_alter_user_last_login_null	2021-08-23 20:50:45.031454-06
11	auth	0006_require_contenttypes_0002	2021-08-23 20:50:45.034425-06
12	auth	0007_alter_validators_add_error_messages	2021-08-23 20:50:45.043401-06
13	auth	0008_alter_user_username_max_length	2021-08-23 20:50:45.066391-06
14	auth	0009_alter_user_last_name_max_length	2021-08-23 20:50:45.075316-06
15	auth	0010_alter_group_name_max_length	2021-08-23 20:50:45.08529-06
16	auth	0011_update_proxy_permissions	2021-08-23 20:50:45.09427-06
17	shop	0001_initial	2021-08-23 20:50:45.116206-06
18	orders	0001_initial	2021-08-23 20:50:45.161126-06
19	orders	0002_auto_20200625_2159	2021-08-23 20:50:45.202381-06
20	orders	0003_order_orderitem	2021-08-23 20:50:45.230481-06
21	sessions	0001_initial	2021-08-23 20:50:45.251562-06
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
09zdhdomp428slatxtxn4inispjm02qh	ZGRiZTkzYTA1MDUyNDZiYmNmOGM1YTZhODdjMWU5OWJjNTJiZDUwOTp7ImNhcnQiOnsiMiI6eyJxdWFudGl0eSI6MSwicHJpY2UiOiIyLjAwIn19fQ==	2020-07-07 08:31:44.826-06
0wy6nm7wp1hc55a75bwscd8wth2fot3u	NDU2YWQzYzEwMDU3M2MyNmI3OGJiNmIzOTE3YWNhNGNlMGFhOGIyNDp7ImNhcnQiOnt9fQ==	2020-07-06 07:35:01.849-06
1x4cfnx8m8t4ucilnqqmrite9zij752w	NDU2YWQzYzEwMDU3M2MyNmI3OGJiNmIzOTE3YWNhNGNlMGFhOGIyNDp7ImNhcnQiOnt9fQ==	2020-07-07 08:23:51.401-06
1yzzhrfkf2ymnrx0w2xwd664fjy2vlqr	ZGRiZTkzYTA1MDUyNDZiYmNmOGM1YTZhODdjMWU5OWJjNTJiZDUwOTp7ImNhcnQiOnsiMiI6eyJxdWFudGl0eSI6MSwicHJpY2UiOiIyLjAwIn19fQ==	2020-07-07 08:21:55.015-06
2mahdntnz11qur4kmq8113dmkremziki	NDU2YWQzYzEwMDU3M2MyNmI3OGJiNmIzOTE3YWNhNGNlMGFhOGIyNDp7ImNhcnQiOnt9fQ==	2020-07-06 08:36:06.169-06
366xp5dn3gllfsgmmzo0tz92rxihzyr2	NDU2YWQzYzEwMDU3M2MyNmI3OGJiNmIzOTE3YWNhNGNlMGFhOGIyNDp7ImNhcnQiOnt9fQ==	2020-07-07 08:28:05.573-06
38osur9x246amdwvig95wbync51vp3hv	ZGRiZTkzYTA1MDUyNDZiYmNmOGM1YTZhODdjMWU5OWJjNTJiZDUwOTp7ImNhcnQiOnsiMiI6eyJxdWFudGl0eSI6MSwicHJpY2UiOiIyLjAwIn19fQ==	2020-07-07 08:31:13.568-06
3ihzwlxifj478rv3fcwpy8iyuhbr6it5	NDU2YWQzYzEwMDU3M2MyNmI3OGJiNmIzOTE3YWNhNGNlMGFhOGIyNDp7ImNhcnQiOnt9fQ==	2020-07-06 08:47:27.128-06
491b6og9hudp4l0919dq1mgr86jcsvlc	ZGRiZTkzYTA1MDUyNDZiYmNmOGM1YTZhODdjMWU5OWJjNTJiZDUwOTp7ImNhcnQiOnsiMiI6eyJxdWFudGl0eSI6MSwicHJpY2UiOiIyLjAwIn19fQ==	2020-07-07 08:25:18.131-06
50n9h8k47o4p80wmzx7ax9n4daa450hm	NDU2YWQzYzEwMDU3M2MyNmI3OGJiNmIzOTE3YWNhNGNlMGFhOGIyNDp7ImNhcnQiOnt9fQ==	2020-07-07 08:31:44.849-06
59fnr3rd642fa5tl32orr1vsbhnsn7sb	ZGRiZTkzYTA1MDUyNDZiYmNmOGM1YTZhODdjMWU5OWJjNTJiZDUwOTp7ImNhcnQiOnsiMiI6eyJxdWFudGl0eSI6MSwicHJpY2UiOiIyLjAwIn19fQ==	2020-07-06 22:18:57.802-06
5xe4kkmuu0w5vtb57c3ntsfaw9ygft2t	ZGRiZTkzYTA1MDUyNDZiYmNmOGM1YTZhODdjMWU5OWJjNTJiZDUwOTp7ImNhcnQiOnsiMiI6eyJxdWFudGl0eSI6MSwicHJpY2UiOiIyLjAwIn19fQ==	2020-07-07 08:23:51.361-06
62g4dlnx27rrcnsyvw2qn7c5myyj39yh	NDU2YWQzYzEwMDU3M2MyNmI3OGJiNmIzOTE3YWNhNGNlMGFhOGIyNDp7ImNhcnQiOnt9fQ==	2020-07-07 08:21:26.344-06
6e7vqpwxa5hfs56hrslr66uzwr4tzhru	NDU2YWQzYzEwMDU3M2MyNmI3OGJiNmIzOTE3YWNhNGNlMGFhOGIyNDp7ImNhcnQiOnt9fQ==	2020-07-06 07:51:11.433-06
6rmqy2rncui5xd9hlwmor8da483uvw7r	NDU2YWQzYzEwMDU3M2MyNmI3OGJiNmIzOTE3YWNhNGNlMGFhOGIyNDp7ImNhcnQiOnt9fQ==	2020-07-06 07:50:31.91-06
75sfp3oa3ybeavozt0n1n2yzcouhxt10	MjFiODAwMGZlZGIyNzE1MGZjODk0ZGQ0MDJhZDM4Y2QyY2E1MjQ2Yjp7ImNhcnQiOnsiMiI6eyJxdWFudGl0eSI6MiwicHJpY2UiOiIyLjAwIn19fQ==	2020-07-06 08:47:27.105-06
8l122plcstlfms1j7xz5uysx90eapnq1	NDU2YWQzYzEwMDU3M2MyNmI3OGJiNmIzOTE3YWNhNGNlMGFhOGIyNDp7ImNhcnQiOnt9fQ==	2020-07-06 07:44:34.323-06
9eoqrfa6rgcf00dd61vyqqds0apje0lc	NDU2YWQzYzEwMDU3M2MyNmI3OGJiNmIzOTE3YWNhNGNlMGFhOGIyNDp7ImNhcnQiOnt9fQ==	2020-07-07 08:31:13.606-06
a4w8ehffj7xy98nmenvg93ygpvfbl67r	NDU2YWQzYzEwMDU3M2MyNmI3OGJiNmIzOTE3YWNhNGNlMGFhOGIyNDp7ImNhcnQiOnt9fQ==	2020-07-06 07:50:31.875-06
a6jdcclgijeuzf3cu3bl4yetfze5qr12	ZWJjNjM3NzdiNzllNWEyZGM3YWRmNzc5OGZkZGEzMjUwYzM4NWQ4OTp7ImNhcnQiOnsiMiI6eyJxdWFudGl0eSI6MTAsInByaWNlIjoiMi4wMCJ9fX0=	2020-07-06 21:42:18.577-06
ae1864qj12ydnttvyragikn90ifx2hqt	NDU2YWQzYzEwMDU3M2MyNmI3OGJiNmIzOTE3YWNhNGNlMGFhOGIyNDp7ImNhcnQiOnt9fQ==	2020-07-06 07:51:24.85-06
akykhnibb4j0liwlbnbwjc3l1fdeu2so	NDU2YWQzYzEwMDU3M2MyNmI3OGJiNmIzOTE3YWNhNGNlMGFhOGIyNDp7ImNhcnQiOnt9fQ==	2020-07-05 22:17:17.673-06
aoc4ssz4ij2g9zjowefm7lrsfzop52it	NDU2YWQzYzEwMDU3M2MyNmI3OGJiNmIzOTE3YWNhNGNlMGFhOGIyNDp7ImNhcnQiOnt9fQ==	2020-07-06 21:42:29.469-06
b3ahf5i9yahz59pgtdxi8pmi9g0c5bgc	ZGRiZTkzYTA1MDUyNDZiYmNmOGM1YTZhODdjMWU5OWJjNTJiZDUwOTp7ImNhcnQiOnsiMiI6eyJxdWFudGl0eSI6MSwicHJpY2UiOiIyLjAwIn19fQ==	2020-07-06 22:18:34.99-06
bgfoynrozwypbd5udzut6geq52qaafg4	ZGRiZTkzYTA1MDUyNDZiYmNmOGM1YTZhODdjMWU5OWJjNTJiZDUwOTp7ImNhcnQiOnsiMiI6eyJxdWFudGl0eSI6MSwicHJpY2UiOiIyLjAwIn19fQ==	2020-07-07 08:24:26.373-06
ccj30g6x7gw91kckhkwfqyevcaa0eczr	NDU2YWQzYzEwMDU3M2MyNmI3OGJiNmIzOTE3YWNhNGNlMGFhOGIyNDp7ImNhcnQiOnt9fQ==	2020-07-07 08:25:18.159-06
con4mz72fzk93gsly1vln0c4944t9t7r	NDU2YWQzYzEwMDU3M2MyNmI3OGJiNmIzOTE3YWNhNGNlMGFhOGIyNDp7ImNhcnQiOnt9fQ==	2020-07-06 07:51:11.418-06
ctaquvm9ariescqu5t1mwmoz7w1bn9eu	MmE5NDBjYmMyMGI0MGI1ZGE5MGNjMmNiNjY3NDAyNDExZTc0YzJiMTp7ImNhcnQiOnt9LCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYWYxNDI2YTY3NDkyNjY2YjEzMWMxM2Q5NWE0OTdjOTIyNzI2MzhmOSJ9	2021-09-06 17:21:26.234-06
dhvefqtdc7xk1xwziqqrt0lcwt6ky1op	NDU2YWQzYzEwMDU3M2MyNmI3OGJiNmIzOTE3YWNhNGNlMGFhOGIyNDp7ImNhcnQiOnt9fQ==	2020-07-07 08:27:11.08-06
e7bjv4576airwy8wu9bcq890jb6t3t1d	ODNjNThhYmIyNjU4NzBjNzIwYTc1ZjUyNTU3NzJhNzExZWEwN2JiOTp7ImNhcnQiOnsiMiI6eyJxdWFudGl0eSI6NCwicHJpY2UiOiIyLjAwIn19fQ==	2020-07-06 08:36:06.138-06
efdx57jwrziibqwbo154lvzv2n7qxxt3	ZGRiZTkzYTA1MDUyNDZiYmNmOGM1YTZhODdjMWU5OWJjNTJiZDUwOTp7ImNhcnQiOnsiMiI6eyJxdWFudGl0eSI6MSwicHJpY2UiOiIyLjAwIn19fQ==	2020-07-07 08:14:19.214-06
f6ubcivfznrocqfrf7h8xplbtv49m4qu	MjFiODAwMGZlZGIyNzE1MGZjODk0ZGQ0MDJhZDM4Y2QyY2E1MjQ2Yjp7ImNhcnQiOnsiMiI6eyJxdWFudGl0eSI6MiwicHJpY2UiOiIyLjAwIn19fQ==	2020-07-06 08:36:12.586-06
fsi5m0nyv2nw39954t2kgc31s0nenoia	ZTc5NjJhMzRjMTg1ZWMxNmY4MjBmZDE3NDVjMjc1YmJjNjMzNjU0Njp7ImNhcnQiOnsiMSI6eyJxdWFudGl0eSI6MSwicHJpY2UiOiI0LjAwIn19LCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYWYxNDI2YTY3NDkyNjY2YjEzMWMxM2Q5NWE0OTdjOTIyNzI2MzhmOSJ9	2021-09-06 18:39:02.587-06
jhe3lerknb6prnq63u2844w8turd8ych	NDU2YWQzYzEwMDU3M2MyNmI3OGJiNmIzOTE3YWNhNGNlMGFhOGIyNDp7ImNhcnQiOnt9fQ==	2020-07-07 21:12:07.237-06
kbs1i1siod0pbsp8sjv8tw36wrdmur19	NDU2YWQzYzEwMDU3M2MyNmI3OGJiNmIzOTE3YWNhNGNlMGFhOGIyNDp7ImNhcnQiOnt9fQ==	2020-07-06 08:30:30.754-06
lrz19c3cfcm0d1oxcmozae95ysg6ba6x	ZGRiZTkzYTA1MDUyNDZiYmNmOGM1YTZhODdjMWU5OWJjNTJiZDUwOTp7ImNhcnQiOnsiMiI6eyJxdWFudGl0eSI6MSwicHJpY2UiOiIyLjAwIn19fQ==	2020-07-06 21:42:03.526-06
miopwo6xvxo9hquifmjewn0rdn5izqjc	NDU2YWQzYzEwMDU3M2MyNmI3OGJiNmIzOTE3YWNhNGNlMGFhOGIyNDp7ImNhcnQiOnt9fQ==	2020-07-06 22:18:57.827-06
ndzozk3yepahg410fx9aw8kk45av7ns8	ZGRiZTkzYTA1MDUyNDZiYmNmOGM1YTZhODdjMWU5OWJjNTJiZDUwOTp7ImNhcnQiOnsiMiI6eyJxdWFudGl0eSI6MSwicHJpY2UiOiIyLjAwIn19fQ==	2020-07-07 08:03:06.371-06
nrjlqdoh9ts89gur16hj4qdnns236f75	ZGRiZTkzYTA1MDUyNDZiYmNmOGM1YTZhODdjMWU5OWJjNTJiZDUwOTp7ImNhcnQiOnsiMiI6eyJxdWFudGl0eSI6MSwicHJpY2UiOiIyLjAwIn19fQ==	2020-07-07 07:57:16.93-06
o09nscosk4zu4agerdc1u6j1ehznkhu3	NDU2YWQzYzEwMDU3M2MyNmI3OGJiNmIzOTE3YWNhNGNlMGFhOGIyNDp7ImNhcnQiOnt9fQ==	2020-07-05 22:26:39.987-06
oodege7fzyp8vx2s0orfma1tfyhmurcg	NDU2YWQzYzEwMDU3M2MyNmI3OGJiNmIzOTE3YWNhNGNlMGFhOGIyNDp7ImNhcnQiOnt9fQ==	2020-07-07 07:57:16.965-06
ov4zcz319vxm5zew3cgc47auuvesrzyy	NDU2YWQzYzEwMDU3M2MyNmI3OGJiNmIzOTE3YWNhNGNlMGFhOGIyNDp7ImNhcnQiOnt9fQ==	2020-07-05 22:27:46.952-06
oxnriigx93ugeyvyecoxke01s43xeszn	NDU2YWQzYzEwMDU3M2MyNmI3OGJiNmIzOTE3YWNhNGNlMGFhOGIyNDp7ImNhcnQiOnt9fQ==	2020-07-07 08:24:26.412-06
pwqzzidlrrygqe7h1nm9rtgppd5zyu4h	ZGRiZTkzYTA1MDUyNDZiYmNmOGM1YTZhODdjMWU5OWJjNTJiZDUwOTp7ImNhcnQiOnsiMiI6eyJxdWFudGl0eSI6MSwicHJpY2UiOiIyLjAwIn19fQ==	2020-07-07 08:27:11.038-06
qbm1keuqxri54yar64sswq0xq8d9ermz	NDU2YWQzYzEwMDU3M2MyNmI3OGJiNmIzOTE3YWNhNGNlMGFhOGIyNDp7ImNhcnQiOnt9fQ==	2020-07-06 21:42:03.556-06
qeel70tbmedhv4kisd1drv93v5tom6n6	NDU2YWQzYzEwMDU3M2MyNmI3OGJiNmIzOTE3YWNhNGNlMGFhOGIyNDp7ImNhcnQiOnt9fQ==	2020-07-06 22:18:35.028-06
r6p62ehahyl8mtlse9z0hr2w339jvx2a	NDU2YWQzYzEwMDU3M2MyNmI3OGJiNmIzOTE3YWNhNGNlMGFhOGIyNDp7ImNhcnQiOnt9fQ==	2020-07-07 08:25:08.586-06
re7sbczxqt8945zpsl7zn2205adgn045	NDU2YWQzYzEwMDU3M2MyNmI3OGJiNmIzOTE3YWNhNGNlMGFhOGIyNDp7ImNhcnQiOnt9fQ==	2020-07-07 08:21:55.037-06
s36w6uua2v6uuv0cd6eyhn4f43jdf1z2	NDU2YWQzYzEwMDU3M2MyNmI3OGJiNmIzOTE3YWNhNGNlMGFhOGIyNDp7ImNhcnQiOnt9fQ==	2020-07-06 08:30:30.695-06
s6ajbs09mg8kf5tk4png9kqvd7cyetot	NDU2YWQzYzEwMDU3M2MyNmI3OGJiNmIzOTE3YWNhNGNlMGFhOGIyNDp7ImNhcnQiOnt9fQ==	2020-07-06 07:44:34.351-06
sv12jryyi0jrtmdaz8au7m2p0ey92j5s	NDU2YWQzYzEwMDU3M2MyNmI3OGJiNmIzOTE3YWNhNGNlMGFhOGIyNDp7ImNhcnQiOnt9fQ==	2020-07-06 07:51:24.868-06
szfuo10jwzk5rmz6paf7zqskytdhoe3u	NDU2YWQzYzEwMDU3M2MyNmI3OGJiNmIzOTE3YWNhNGNlMGFhOGIyNDp7ImNhcnQiOnt9fQ==	2020-07-07 08:14:19.253-06
t09afnihnnlcyu7fdm7dko5zh2w6sdml	NDU2YWQzYzEwMDU3M2MyNmI3OGJiNmIzOTE3YWNhNGNlMGFhOGIyNDp7ImNhcnQiOnt9fQ==	2020-07-06 07:44:38.576-06
tz2tq00lo07lgcp7ajfzx3fmhk39iosa	NDU2YWQzYzEwMDU3M2MyNmI3OGJiNmIzOTE3YWNhNGNlMGFhOGIyNDp7ImNhcnQiOnt9fQ==	2020-07-07 08:03:06.414-06
ulbnzqimrm14hptqku09u4i0o5u58ahv	NDU2YWQzYzEwMDU3M2MyNmI3OGJiNmIzOTE3YWNhNGNlMGFhOGIyNDp7ImNhcnQiOnt9fQ==	2020-07-06 21:42:18.598-06
vlnp0djegxkctqla316hyc00rcv05oz1	ZGRiZTkzYTA1MDUyNDZiYmNmOGM1YTZhODdjMWU5OWJjNTJiZDUwOTp7ImNhcnQiOnsiMiI6eyJxdWFudGl0eSI6MSwicHJpY2UiOiIyLjAwIn19fQ==	2020-07-07 21:12:11.619-06
vt9t7qufljzfruoztofc46v7jy725kha	NDU2YWQzYzEwMDU3M2MyNmI3OGJiNmIzOTE3YWNhNGNlMGFhOGIyNDp7ImNhcnQiOnt9fQ==	2020-07-06 08:36:12.608-06
vvna1roe5d6t264lb07g5nmop3e5l6g3	ZGRiZTkzYTA1MDUyNDZiYmNmOGM1YTZhODdjMWU5OWJjNTJiZDUwOTp7ImNhcnQiOnsiMiI6eyJxdWFudGl0eSI6MSwicHJpY2UiOiIyLjAwIn19fQ==	2020-07-07 08:21:26.299-06
w9qf77duxq3tq80oyh6zrf9fb4sr1tli	YzJmNDBmZGFjNWU4ZDA0NmVhMGU5OTUyODE0ZGJhZDlkZDUwZDQxMjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1ZTkwMzkyMDliNTYyY2FjMTAyZmI1ZDQ1NDUzODc0NTVhY2U1MDA4IiwiY2FydCI6e319	2020-07-11 11:45:53.974-06
wjrf0vw5xjsxbumb15n3ufncrbliwk91	ZWJjNjM3NzdiNzllNWEyZGM3YWRmNzc5OGZkZGEzMjUwYzM4NWQ4OTp7ImNhcnQiOnsiMiI6eyJxdWFudGl0eSI6MTAsInByaWNlIjoiMi4wMCJ9fX0=	2020-07-06 21:42:29.449-06
wu1see4dhinsfw9f75gnauvebhpl5ef1	NDU2YWQzYzEwMDU3M2MyNmI3OGJiNmIzOTE3YWNhNGNlMGFhOGIyNDp7ImNhcnQiOnt9fQ==	2020-07-07 21:12:11.643-06
y6zgtjcg30yv8bdjesh08ijttge7opkw	NDU2YWQzYzEwMDU3M2MyNmI3OGJiNmIzOTE3YWNhNGNlMGFhOGIyNDp7ImNhcnQiOnt9fQ==	2020-07-06 07:44:38.592-06
yatlbn1117k5f8djpej1zrun9jtsyolu	NDYxYzU5M2NkYmE4NTlkMmFkM2Y1NGQyZjVkYTczODI1NzI2OTE3ODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1ZTkwMzkyMDliNTYyY2FjMTAyZmI1ZDQ1NDUzODc0NTVhY2U1MDA4In0=	2020-06-30 07:55:17.055-06
z5j17dpa40j4e6y1875rl0j10kmnvac0	ZGRiZTkzYTA1MDUyNDZiYmNmOGM1YTZhODdjMWU5OWJjNTJiZDUwOTp7ImNhcnQiOnsiMiI6eyJxdWFudGl0eSI6MSwicHJpY2UiOiIyLjAwIn19fQ==	2020-07-07 08:28:05.535-06
z6ucepot7p3nqgii6hji8qiayf2p5fyt	ZGRiZTkzYTA1MDUyNDZiYmNmOGM1YTZhODdjMWU5OWJjNTJiZDUwOTp7ImNhcnQiOnsiMiI6eyJxdWFudGl0eSI6MSwicHJpY2UiOiIyLjAwIn19fQ==	2020-07-07 08:25:08.544-06
\.


--
-- Data for Name: orders_order; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.orders_order (id, first_name, last_name, email, address, postal_code, city, created, updated, paid, braintree_id) FROM stdin;
1	CZARINA	CATAMBING	czarina.catambing@usask.ca	125 108th Street East, B	S7NIP5	Saskatoon	2020-06-27 11:45:52.72-06	2020-06-27 11:45:52.72-06	f	
\.


--
-- Data for Name: orders_orderitem; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.orders_orderitem (id, price, quantity, order_id, product_id) FROM stdin;
1	4.00	1	1	1
\.


--
-- Data for Name: shop_category; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.shop_category (id, name, slug) FROM stdin;
1	Dairy and eggs	dairy
2	Produce	produce
3	Bakery	bakery
4	Frozen	frozen
5	Health and beauty	health-and-beauty
6	Meat and seafood	meat-and-seafood
7	Pantry	pantry
8	Deli and readymade meals	deli-and-readymade-meals
9	Cleaning and home	cleaning-and-home
10	Pet care	pet-care
11	Pharmacy	pharmacy
\.


--
-- Data for Name: shop_product; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.shop_product (id, name, slug, image, description, price, available, created, updated, category_id) FROM stdin;
1	Dairyland - 2% Milk, 2 Litre	dairyland-milk	products/2021/08/23/dairy_milk.jpg	Partly Skimmed Milk An Excellent Source of Calcium Vitamins A & D Added	3.99	t	2020-06-16 07:56:30.333-06	2021-08-23 16:50:16.032-06	1
2	Lemon	lemon	products/2020/06/16/lemon.jpeg	Fresh lemon	2.00	t	2020-06-16 07:57:12.104-06	2020-06-16 07:57:12.104-06	2
3	International Delight - Coffee Whitener - French Vanilla, 946 Millilitre	international-delight-coffee-whitener-french-vanilla-946-millilitre	products/2021/08/23/dairy_creamer.jpg	Smooth, creamy vanilla flavour inspired by the rich, French style of ice cream.	4.49	t	2021-08-23 16:51:00.995-06	2021-08-23 17:07:02.543-06	1
4	Cauliflower	cauliflower	products/2021/08/23/produce_cauliflower.jpg	NO.1 Grade USA. Raw cauliflower is slightly sulfurous and faintly bitter in flavor but once cooked, it transforms to a sweet and milky, almost nutty flavor.	3.98	t	2021-08-23 16:54:20.7-06	2021-08-23 17:06:44.432-06	2
5	Broccoli	broccoli	products/2021/08/23/produce_brocoli.jpg	Broccoli is an edible green plant in the cabbage family whose large flowering head is eaten as a vegetable.	5.35	t	2021-08-23 16:56:45.481-06	2021-08-23 16:58:15.991-06	2
6	Apples - gala small	apples-gala-small	products/2021/08/23/produce_apple.jpg	Extra Fancy Grade, BC. A Mildly Sweet Flavor and Long Availability Window.	1.05	t	2021-08-23 16:57:44.043-06	2021-08-23 17:06:33.697-06	2
7	D'Italiano - Thick Sliced Bread - Original, 675 Gram	ditaliano-thick-sliced-bread-original-675-gram	products/2021/08/23/bakery_ditaliano.jpg	May contain: sesame seeds, soy.	4.79	t	2021-08-23 16:59:22.731-06	2021-08-23 16:59:22.731-06	3
8	Bake Shop - Pizza Pretzels, 4 Each	bake-shop-pizza-pretzels-4-each	products/2021/08/23/bakery_pizzapretzel.jpg	This dough is carefully rolled and hand twisted into a pretzel, given a good coat of pizza sauce, herbs and spices then topped with shredded cheese. Enjoy with your favourite sauce for dipping and dunking or savour this satisfying snack on its own.	4.99	t	2021-08-23 17:00:15.076-06	2021-08-23 17:00:15.076-06	3
9	Cascade - Complete Action Pacs Fresh Scent Dawn, 72 Each	cascade-complete-action-pacs-fresh-scent-dawn-72-each	products/2021/08/23/cleaning_cascade.jpg	Power away stuck-on messes,no pre-wash nessessary! Every ActionPac is formulated with the grease fighting power of Dawn. Rinse aid action rinses away residues and leaves brilliant shine.	19.99	t	2021-08-23 17:01:14.952-06	2021-08-23 17:01:14.952-06	9
10	Lysol - All Purpose Cleaner - Lemon, 650 Millilitre 2 for $7	lysol-all-purpose-cleaner-lemon-650-millilitre-2-7	products/2021/08/23/cleaning_lysol.jpg	Can be used on surfaces throughout your home, from the kitchen to the bathroom. It starts cleaning on contact and kills 99.9% of germs.	4.49	t	2021-08-23 17:02:08.719-06	2021-08-23 17:02:08.72-06	9
11	Armstrong - Natural Cheddar Cheese - Old, 1.35 Kilogram	armstrong-natural-cheddar-cheese-old-135-kilogram	products/2021/08/23/dairy_armstrong.jpg	Great in sandwiches, soups & more! 31% M.F. 39% Moisture.	21.99	t	2021-08-23 17:03:15.363-06	2021-08-23 17:03:15.363-06	1
12	Kraft - Grated Parmesan Cheese, 250 Gram	kraft-grated-parmesan-cheese-250-gram	products/2021/08/23/dairy_parm.jpg	31% M.F. 24% Moisture.	8.99	t	2021-08-23 17:03:58.6-06	2021-08-23 17:03:58.6-06	1
13	Seven Layer - Mexican Dip, 420 Gram	seven-layer-mexican-dip-420-gram	products/2021/08/23/deli_sevenlayer.jpg		6.99	t	2021-08-23 17:04:46.805-06	2021-08-23 17:04:46.805-06	8
14	Lumber Jack Sandwich, 1 Each	lumber-jack-sandwich-1-each	products/2021/08/23/deli_sandwich.jpg	Fresh Packaged Ready to Eat.	12.99	t	2021-08-23 17:05:38.385-06	2021-08-23 17:05:38.385-06	8
15	Kellogg's - Eggo Waffles Original, 48 Each	kelloggs-eggo-waffles-original-48-each	products/2021/08/23/frozen_eggo.jpg	48 Frozen Waffles.\r\n\r\nIngredients\r\nWHEAT FLOUR, WATER, VEGETABLE AND PALM OIL SHORTENING, SUGAR, WHOLE EGG, BAKING POWDER, VEGETABLE OIL, DEXTROSE, SALT, PALM OIL, SPICE, MODIFIED MILK INGREDIENTS, SOY LECITHIN. CONTAINS WHEAT, EGG, MILK AND SOY	13.49	t	2021-08-23 17:09:23.348-06	2021-08-23 17:09:23.348-06	4
16	Janes - Pub Style Chicken Strips, 700 Gram	janes-pub-style-chicken-strips-700-gram	products/2021/08/23/frozen_chicken.jpg	Frozen, Fully Cooked Breaded Chicken Cutlettes. Made with White Meat. No Preservatives, 0 trans fat, Low in Saturated Fat, No Artificial Flavours or Colours	14.99	t	2021-08-23 17:10:14.689-06	2021-08-23 17:10:14.69-06	4
17	Bassili's Best - Meat Lasagna with 4 Cheeses, 2.27 Kilogram	bassilis-best-meat-lasagna-4-cheeses-227-kilogram	products/2021/08/23/frozen_lasagna.jpg	Frozen. Fresh Pasta with Hearty Tomato Meat Sauce, Mozzarella, Ricotta, Cheddar and Parmesan Cheese. Serves 10 Portions.	15.99	t	2021-08-23 17:10:52.643-06	2021-08-23 17:10:52.643-06	4
18	Q-Tips - Cotton Swabs, 400 Each	q-tips-cotton-swabs-400-each	products/2021/08/23/health_qtips.jpg	The Most Cotton at the Tip.	3.99	t	2021-08-23 17:11:45.72-06	2021-08-23 17:11:45.72-06	5
19	Cerave - Moisturizing Cream, 453 Gram	cerave-moisturizing-cream-453-gram	products/2021/08/23/health_cerve.jpg	CeraVe Moisturizing Cream acts as both by effectively hydrating as it helps restore the skins protective barrier. Developed with dermatologists and ideal for dry and very dry skin on the face and body, this rich, non-greasy, fast-absorbing moisturizing c	24.29	t	2021-08-23 17:12:23.916-06	2021-08-23 17:13:30.918-06	5
20	Tylenol - Extra Strength eZTabs, 150 Each	tylenol-extra-strength-eztabs-150-each	products/2021/08/23/health_tylenol.jpg	Acetaminophen Tablets 500mg each, for fast relief of headache, pain, or fever.	16.79	t	2021-08-23 17:13:10.901-06	2021-08-23 17:20:42.278-06	11
21	Maple Leaf - Top Dogs Original Wieners, 10 Each	maple-leaf-top-dogs-original-wieners-10-each	products/2021/08/23/meat_sausage.jpg	Made with Chicken, Pork and Natural Ingredients.	4.99	t	2021-08-23 17:15:10.468-06	2021-08-23 17:15:10.468-06	6
22	Tray Pack Canada Prime Rib Eye Steak, 400 Gram	tray-pack-canada-prime-rib-eye-steak-400-gram	products/2021/08/23/meat_steak.jpg	This premium cut of meat is chosen from the top 2% of triple AAA cattle, for its liberal marbling, it features beautiful red meat laced with thin striations of white fat and is sure to provide the ultimate in tenderness, juiciness, and flavor giving an ex	26.45	t	2021-08-23 17:16:22.049-06	2021-08-23 17:16:22.049-06	6
23	Harvest - Bacon - Thick Sliced, 1 Kilogram	harvest-bacon-thick-sliced-1-kilogram	products/2021/08/23/meat_bacon.jpg	Naturally smoked. Gluten free, no MSG added.	24.99	t	2021-08-23 17:17:02.955-06	2021-08-23 17:17:02.955-06	6
24	Wild Sockeye Salmon Fillets, 450 Gram	wild-sockeye-salmon-fillets-450-gram	products/2021/08/23/meat_salmon.jpg	Previously Frozen. Ocean Wise Recommended.Packed form our Seafood Dept.Average Pack of Fillet May Weigh 225g to 1000g. Please indicate in your cart review notes if a prefered size/weight required.	17.06	t	2021-08-23 17:17:37.455-06	2021-08-23 17:21:16.896-06	6
25	Folgers - Coffee - Classic Roast, 920 Gram	folgers-coffee-classic-roast-920-gram	products/2021/08/23/pantry_folgers.jpg		10.99	t	2021-08-23 17:18:27.695-06	2021-08-23 17:18:27.695-06	7
26	Tostitos - Tortilla Chips- Rounds, 295 Gram	tostitos-tortilla-chips-rounds-295-gram	products/2021/08/23/pantry_tostitos.jpg	Bite Size Rounds. Tortilla Chips. White Premium Corn. 0 Trans Fat	4.29	t	2021-08-23 17:19:08.689-06	2021-08-23 17:19:08.689-06	7
27	Friskies - Cat Food - Chef's Blend, 7.5 Kilogram	friskies-cat-food-chefs-blend-75-kilogram	products/2021/08/23/pet_catfood.jpg	Blend of Chicken, Beef, Tuna, Turkey, Salmon, Cheese & Egg Flavours	24.49	t	2021-08-23 17:20:12.79-06	2021-08-23 17:20:12.791-06	10
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 40, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 47, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 10, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 21, true);


--
-- Name: orders_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.orders_order_id_seq', 1, true);


--
-- Name: orders_orderitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.orders_orderitem_id_seq', 1, true);


--
-- Name: shop_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.shop_category_id_seq', 11, true);


--
-- Name: shop_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.shop_product_id_seq', 27, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: orders_order orders_order_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders_order
    ADD CONSTRAINT orders_order_pkey PRIMARY KEY (id);


--
-- Name: orders_orderitem orders_orderitem_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders_orderitem
    ADD CONSTRAINT orders_orderitem_pkey PRIMARY KEY (id);


--
-- Name: shop_category shop_category_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.shop_category
    ADD CONSTRAINT shop_category_pkey PRIMARY KEY (id);


--
-- Name: shop_category shop_category_slug_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.shop_category
    ADD CONSTRAINT shop_category_slug_key UNIQUE (slug);


--
-- Name: shop_product shop_product_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.shop_product
    ADD CONSTRAINT shop_product_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: orders_orderitem_order_id_fe61a34d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX orders_orderitem_order_id_fe61a34d ON public.orders_orderitem USING btree (order_id);


--
-- Name: orders_orderitem_product_id_afe4254a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX orders_orderitem_product_id_afe4254a ON public.orders_orderitem USING btree (product_id);


--
-- Name: shop_category_name_11b68823; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX shop_category_name_11b68823 ON public.shop_category USING btree (name);


--
-- Name: shop_category_name_11b68823_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX shop_category_name_11b68823_like ON public.shop_category USING btree (name varchar_pattern_ops);


--
-- Name: shop_category_slug_4508178e_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX shop_category_slug_4508178e_like ON public.shop_category USING btree (slug varchar_pattern_ops);


--
-- Name: shop_product_category_id_14d7eea8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX shop_product_category_id_14d7eea8 ON public.shop_product USING btree (category_id);


--
-- Name: shop_product_id_slug_68aad32e_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX shop_product_id_slug_68aad32e_idx ON public.shop_product USING btree (id, slug);


--
-- Name: shop_product_name_b8d5e94c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX shop_product_name_b8d5e94c ON public.shop_product USING btree (name);


--
-- Name: shop_product_name_b8d5e94c_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX shop_product_name_b8d5e94c_like ON public.shop_product USING btree (name varchar_pattern_ops);


--
-- Name: shop_product_slug_30bd2d5d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX shop_product_slug_30bd2d5d ON public.shop_product USING btree (slug);


--
-- Name: shop_product_slug_30bd2d5d_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX shop_product_slug_30bd2d5d_like ON public.shop_product USING btree (slug varchar_pattern_ops);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: orders_orderitem orders_orderitem_order_id_fe61a34d_fk_orders_order_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders_orderitem
    ADD CONSTRAINT orders_orderitem_order_id_fe61a34d_fk_orders_order_id FOREIGN KEY (order_id) REFERENCES public.orders_order(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: orders_orderitem orders_orderitem_product_id_afe4254a_fk_shop_product_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders_orderitem
    ADD CONSTRAINT orders_orderitem_product_id_afe4254a_fk_shop_product_id FOREIGN KEY (product_id) REFERENCES public.shop_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: shop_product shop_product_category_id_14d7eea8_fk_shop_category_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.shop_product
    ADD CONSTRAINT shop_product_category_id_14d7eea8_fk_shop_category_id FOREIGN KEY (category_id) REFERENCES public.shop_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

