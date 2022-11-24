-- This script was generated by a beta version of the ERD tool in pgAdmin 4.
-- Please log an issue at https://redmine.postgresql.org/projects/pgadmin4/issues/new if you find any bugs, including reproduction steps.
BEGIN;


CREATE TABLE IF NOT EXISTS public.addresses
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    user_id integer NOT NULL,
    street_id integer NOT NULL,
    title character varying(25) COLLATE pg_catalog."default" NOT NULL,
    address character varying(250) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT addresses_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.basket_items
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    basket_id integer NOT NULL,
    product_id integer NOT NULL,
    quantity integer NOT NULL,
    item_total_price integer NOT NULL,
    CONSTRAINT basket_items_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.baskets
(
    id integer NOT NULL,
    total_price integer NOT NULL,
    shipping_price integer NOT NULL,
    CONSTRAINT baskets_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.categories
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    ref_id integer NOT NULL,
    name character varying(50) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT categories_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.cities
(
    id integer NOT NULL,
    name character varying(50) COLLATE pg_catalog."default" NOT NULL,
    country_id integer NOT NULL,
    CONSTRAINT cities_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.corporate_customers
(
    id integer NOT NULL,
    name character varying(100) COLLATE pg_catalog."default" NOT NULL,
    tax_number character varying(100) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT corporate_customers_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.countries
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    name character varying(50) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT countries_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.customers
(
    id integer NOT NULL,
    "number" character varying(25) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT customers_pkey PRIMARY KEY (id)
        INCLUDE(id)
);

CREATE TABLE IF NOT EXISTS public.delivery_options
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    name character varying(50) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT delivery_options_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.districts
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    town_id integer NOT NULL,
    name character varying(50) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT districts_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.employees
(
    id integer NOT NULL,
    "number" character varying(25) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT employees_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.individual_customers
(
    id integer NOT NULL,
    first_name character varying(50) COLLATE pg_catalog."default" NOT NULL,
    last_name character varying(50) COLLATE pg_catalog."default" NOT NULL,
    identity_number character varying(25) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT individual_customers_pkey PRIMARY KEY (identity_number)
);

CREATE TABLE IF NOT EXISTS public.invoices
(
    id integer NOT NULL,
    "number" character(25) COLLATE pg_catalog."default" NOT NULL,
    created_date date NOT NULL,
    CONSTRAINT invoices_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.order_items
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    order_id integer NOT NULL,
    product_id integer NOT NULL,
    quantity integer NOT NULL,
    item_total_price integer NOT NULL,
    CONSTRAINT order_items_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.orders
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    delivery_options_id integer NOT NULL,
    order_address_id integer NOT NULL,
    invoice_address_id integer NOT NULL,
    order_number character varying(25) COLLATE pg_catalog."default" NOT NULL,
    total_price integer NOT NULL,
    CONSTRAINT orders_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.payment_types
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    name character varying(50) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT payment_types_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.payments
(
    id integer NOT NULL,
    payment_type_id integer NOT NULL,
    is_verified boolean NOT NULL,
    CONSTRAINT payments_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.phone_numbers
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    user_id integer NOT NULL,
    "number" character varying(25) COLLATE pg_catalog."default" NOT NULL,
    title character varying(25) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT phone_numbers_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.product_categories
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    product_id integer NOT NULL,
    category_id integer NOT NULL,
    CONSTRAINT product_categories_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.product_char_values
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    name character varying(50) COLLATE pg_catalog."default" NOT NULL,
    product_char_id integer NOT NULL,
    CONSTRAINT product_char_values_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.product_chars
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    name character varying(50) COLLATE pg_catalog."default" NOT NULL,
    description character varying(50) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT product_chars_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.product_details
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    product_id integer NOT NULL,
    product_char_id integer NOT NULL,
    CONSTRAINT product_details_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.products
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    name character varying(100) COLLATE pg_catalog."default" NOT NULL,
    unit_price money NOT NULL,
    stock integer NOT NULL,
    description character varying(255) COLLATE pg_catalog."default" NOT NULL,
    image_url character varying(255) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT products_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.sellers
(
    id integer NOT NULL,
    name character varying(50) COLLATE pg_catalog."default" NOT NULL,
    "number" character varying(25) COLLATE pg_catalog."default" NOT NULL,
    is_verified boolean NOT NULL,
    CONSTRAINT sellers_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.streets
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    district_id integer NOT NULL,
    name character varying(50) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT streets_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.towns
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    city_id integer NOT NULL,
    name character varying(50) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT towns_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.users
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    email character varying(50) COLLATE pg_catalog."default" NOT NULL,
    password character varying(25) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT users_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS public.addresses
    ADD CONSTRAINT street_id_fk FOREIGN KEY (street_id)
    REFERENCES public.streets (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public.addresses
    ADD CONSTRAINT user_id_fk FOREIGN KEY (user_id)
    REFERENCES public.users (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public.basket_items
    ADD CONSTRAINT basket_id_fk FOREIGN KEY (basket_id)
    REFERENCES public.baskets (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public.basket_items
    ADD CONSTRAINT product_id_fk FOREIGN KEY (product_id)
    REFERENCES public.products (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public.baskets
    ADD CONSTRAINT basket_customer FOREIGN KEY (id)
    REFERENCES public.customers (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;
CREATE INDEX IF NOT EXISTS baskets_pkey
    ON public.baskets(id);


ALTER TABLE IF EXISTS public.cities
    ADD CONSTRAINT country_id_fk FOREIGN KEY (country_id)
    REFERENCES public.countries (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.corporate_customers
    ADD CONSTRAINT corporate_customer_customers FOREIGN KEY (id)
    REFERENCES public.customers (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;
CREATE INDEX IF NOT EXISTS corporate_customers_pkey
    ON public.corporate_customers(id);


ALTER TABLE IF EXISTS public.customers
    ADD CONSTRAINT customer_user FOREIGN KEY (id)
    REFERENCES public.users (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;
CREATE INDEX IF NOT EXISTS customers_pkey
    ON public.customers(id);


ALTER TABLE IF EXISTS public.districts
    ADD CONSTRAINT town_id_fk FOREIGN KEY (town_id)
    REFERENCES public.towns (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public.employees
    ADD CONSTRAINT employee_user FOREIGN KEY (id)
    REFERENCES public.users (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;
CREATE INDEX IF NOT EXISTS employees_pkey
    ON public.employees(id);


ALTER TABLE IF EXISTS public.individual_customers
    ADD CONSTRAINT individual_customer_customers FOREIGN KEY (id)
    REFERENCES public.customers (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public.invoices
    ADD CONSTRAINT invoice_order FOREIGN KEY (id)
    REFERENCES public.orders (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;
CREATE INDEX IF NOT EXISTS invoices_pkey
    ON public.invoices(id);


ALTER TABLE IF EXISTS public.order_items
    ADD CONSTRAINT order_id_fk FOREIGN KEY (order_id)
    REFERENCES public.orders (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public.order_items
    ADD CONSTRAINT product_id_fk FOREIGN KEY (product_id)
    REFERENCES public.products (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public.orders
    ADD CONSTRAINT delivery_options_id_fk FOREIGN KEY (delivery_options_id)
    REFERENCES public.delivery_options (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public.orders
    ADD CONSTRAINT invoice_address_id_fk FOREIGN KEY (invoice_address_id)
    REFERENCES public.addresses (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public.orders
    ADD CONSTRAINT order_address_id_fk FOREIGN KEY (order_address_id)
    REFERENCES public.addresses (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public.payments
    ADD CONSTRAINT payment_order FOREIGN KEY (id)
    REFERENCES public.orders (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;
CREATE INDEX IF NOT EXISTS payments_pkey
    ON public.payments(id);


ALTER TABLE IF EXISTS public.payments
    ADD CONSTRAINT payment_type_id_fk FOREIGN KEY (payment_type_id)
    REFERENCES public.payment_types (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public.phone_numbers
    ADD CONSTRAINT user_id_fk FOREIGN KEY (user_id)
    REFERENCES public.users (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public.product_categories
    ADD CONSTRAINT category_id_fk FOREIGN KEY (category_id)
    REFERENCES public.categories (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public.product_categories
    ADD CONSTRAINT product_id_fk FOREIGN KEY (product_id)
    REFERENCES public.products (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public.product_char_values
    ADD CONSTRAINT product_char_id_fk FOREIGN KEY (product_char_id)
    REFERENCES public.product_chars (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public.product_details
    ADD CONSTRAINT product_char_id_fk FOREIGN KEY (product_char_id)
    REFERENCES public.product_chars (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public.product_details
    ADD CONSTRAINT product_id_fk FOREIGN KEY (product_id)
    REFERENCES public.products (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public.sellers
    ADD CONSTRAINT seller_user FOREIGN KEY (id)
    REFERENCES public.users (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;
CREATE INDEX IF NOT EXISTS sellers_pkey
    ON public.sellers(id);


ALTER TABLE IF EXISTS public.streets
    ADD CONSTRAINT district_id_fk FOREIGN KEY (district_id)
    REFERENCES public.districts (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public.towns
    ADD CONSTRAINT city_id_fk FOREIGN KEY (city_id)
    REFERENCES public.cities (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;

END;