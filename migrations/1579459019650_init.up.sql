CREATE TABLE public.address (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    customer_id uuid
);
CREATE TABLE public.card (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    customer_id uuid
);
CREATE TABLE public.category (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    parent_category_id uuid
);
CREATE TABLE public.collection (
    section_id uuid NOT NULL,
    product_id uuid NOT NULL
);
CREATE TABLE public.contact (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    customer_id uuid
);
CREATE TABLE public.coupon (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    user_id uuid
);
CREATE TABLE public.customer (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL
);
CREATE TABLE public.gallery (
    section_id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    image_id uuid NOT NULL
);
CREATE TABLE public.image (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL
);
CREATE TABLE public."order" (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    customer_id uuid
);
CREATE TABLE public.order_line_item (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    order_id uuid
);
CREATE TABLE public.page (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    site_id uuid
);
CREATE TABLE public.product (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL
);
CREATE TABLE public.product_category (
    product_id uuid NOT NULL,
    category_id uuid NOT NULL
);
CREATE TABLE public.product_coupon (
    coupon_id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    product_id uuid NOT NULL
);
CREATE TABLE public.product_option (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    product_id uuid
);
CREATE TABLE public.section (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    page_id uuid
);
CREATE TABLE public.selected_option (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    variant_id uuid
);
CREATE TABLE public.site (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    user_id text
);
CREATE TABLE public.variant (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    product_id uuid
);
ALTER TABLE ONLY public.address
    ADD CONSTRAINT address_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.card
    ADD CONSTRAINT card_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.collection
    ADD CONSTRAINT collection_pkey PRIMARY KEY (section_id, product_id);
ALTER TABLE ONLY public.contact
    ADD CONSTRAINT contact_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.coupon
    ADD CONSTRAINT coupon_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.gallery
    ADD CONSTRAINT gallery_pkey PRIMARY KEY (section_id, image_id);
ALTER TABLE ONLY public.image
    ADD CONSTRAINT image_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.order_line_item
    ADD CONSTRAINT order_line_item_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.page
    ADD CONSTRAINT page_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.product_category
    ADD CONSTRAINT product_category_pkey PRIMARY KEY (product_id, category_id);
ALTER TABLE ONLY public.product_coupon
    ADD CONSTRAINT product_coupon_pkey PRIMARY KEY (coupon_id, product_id);
ALTER TABLE ONLY public.product_option
    ADD CONSTRAINT product_option_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.section
    ADD CONSTRAINT section_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.selected_option
    ADD CONSTRAINT selected_option_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.site
    ADD CONSTRAINT site_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.variant
    ADD CONSTRAINT variant_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.address
    ADD CONSTRAINT address_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customer(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ONLY public.card
    ADD CONSTRAINT card_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customer(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_parent_category_id_fkey FOREIGN KEY (parent_category_id) REFERENCES public.category(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ONLY public.collection
    ADD CONSTRAINT collection_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.product(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ONLY public.collection
    ADD CONSTRAINT collection_section_id_fkey FOREIGN KEY (section_id) REFERENCES public.section(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ONLY public.contact
    ADD CONSTRAINT contact_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customer(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ONLY public.gallery
    ADD CONSTRAINT gallery_image_id_fkey FOREIGN KEY (image_id) REFERENCES public.image(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ONLY public.gallery
    ADD CONSTRAINT gallery_section_id_fkey FOREIGN KEY (section_id) REFERENCES public.section(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customer(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ONLY public.order_line_item
    ADD CONSTRAINT order_line_item_order_id_fkey FOREIGN KEY (order_id) REFERENCES public."order"(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ONLY public.page
    ADD CONSTRAINT page_site_id_fkey FOREIGN KEY (site_id) REFERENCES public.site(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ONLY public.product_category
    ADD CONSTRAINT product_category_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.category(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ONLY public.product_category
    ADD CONSTRAINT product_category_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.product(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ONLY public.product_coupon
    ADD CONSTRAINT product_coupon_coupon_id_fkey FOREIGN KEY (coupon_id) REFERENCES public.coupon(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ONLY public.product_coupon
    ADD CONSTRAINT product_coupon_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.product(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ONLY public.product_option
    ADD CONSTRAINT product_option_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.product(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ONLY public.section
    ADD CONSTRAINT section_page_id_fkey FOREIGN KEY (page_id) REFERENCES public.page(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ONLY public.selected_option
    ADD CONSTRAINT selected_option_variant_id_fkey FOREIGN KEY (variant_id) REFERENCES public.variant(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ONLY public.variant
    ADD CONSTRAINT variant_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.product(id) ON UPDATE CASCADE ON DELETE CASCADE;
