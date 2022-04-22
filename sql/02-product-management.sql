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

