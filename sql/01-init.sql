CREATE TABLE roles (
    id uuid PRIMARY KEY,
    name varchar (255) UNIQUE NOT NULL
);

CREATE TABLE user_credentials (
    id uuid PRIMARY KEY,
    username varchar (255) UNIQUE NOT NULL,
    password_hash char (60) NOT NULL,
    role_id uuid REFERENCES roles (id) NOT NULL,
    first_name varchar (63) NOT NULL,
    last_name varchar (63) NOT NULL,
    email varchar (255) NOT NULL
);

CREATE TABLE customers (
    id uuid PRIMARY KEY,
    credential_id uuid REFERENCES user_credentials (id) UNIQUE NOT NULL
);

CREATE TABLE address (
    id uuid PRIMARY KEY,
    customer_id uuid REFERENCES customers (id),
    street text NOT NULL,
    suburb varchar (255) NOT NULL,
    state varchar (255) NOT NULL,
    postcode varchar (7) NOT NULL,
    country varchar (255) NOT NULL
);

CREATE TABLE payment_details (
    id uuid PRIMARY KEY,
    customer_id uuid REFERENCES customers (id),
    card_name varchar (255) NOT NULL,
    card_number varchar (16) NOT NULL,
    card_cvc varchar (3) NOT NULL,
    card_expiry_day varchar (2) NOT NULL,
    card_expiry_year varchar (4) NOT NULL
);

CREATE TABLE categories (
    id serial PRIMARY KEY,
    name varchar (255) NOT NULL,
    description text NOT NULL,
    img_url varchar (255) NOT NULL
);

CREATE TABLE products (
    id serial PRIMARY KEY,
    name varchar (255) NOT NULL,
    description text NOT NULL,
    category_id int REFERENCES categories (id) NOT NULL,
    stock_level int NOT NULL DEFAULT 0,
    order_level int NOT NULL DEFAULT 0,
    price money NOT NULL
);

CREATE TABLE product_images (
    id serial PRIMARY KEY,
    product_id int REFERENCES products (id) NOT NULL,
    img_url varchar (255) NOT NULL
);

CREATE TYPE order_status
    AS ENUM ('processing', 'picked', 'packing', 'onboard_for_delivery');

CREATE TABLE orders (
    id uuid PRIMARY KEY,
    address_id uuid REFERENCES address (id) NOT NULL,
    delivery_instructions text NOT NULL DEFAULT '',
    date_ordered timestamp NOT NULL DEFAULT now(),
    last_update timestamp NOT NULL DEFAULT now(),
    order_status order_status NOT NULL DEFAULT 'processing',
    customer_id uuid REFERENCES customers (id)
);

CREATE TABLE orders_products (
    id uuid PRIMARY KEY,
    order_id uuid REFERENCES orders (id) NOT NULL,
    product_id int REFERENCES products (id) NOT NULL
);
