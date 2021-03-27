CREATE TABLE customers (
  id SERIAL PRIMARY KEY,
  username VARCHAR(255) UNIQUE NOT NULL,
  "firstName" VARCHAR(50) NOT NULL,
  "lastName" VARCHAR(50) DEFAULT '',
  email VARCHAR(255) UNIQUE NOT NULL,
  password VARCHAR(50) NOT NULL,
  address VARCHAR(255) DEFAULT '',
  postal INTEGER,
  city VARCHAR(255) DEFAULT '',
  phone VARCHAR(255) DEFAULT '',
  "isActive" BOOLEAN DEFAULT 'false',
  "isAdmin" Boolean DEFAULT 'false'
);

CREATE TABLE products (
  id SERIAL PRIMARY KEY,
  "isActive" BOOLEAN DEFAULT true,
  name VARCHAR(255) UNIQUE NOT NULL,
  img VARCHAR(255),
  description TEXT,
  price VARCHAR(255) NOT NULL,
  featured BOOLEAN DEFAULT false,
  stock INTEGER NOT NULL
);

CREATE TABLE reviews (
  id SERIAL PRIMARY KEY,
  username VARCHAR(255),
  rating INTEGER,
  description TEXT,
  "reviewId" INTEGER REFERENCES products(id) NOT NULL
);

CREATE TABLE categories (
  id SERIAL PRIMARY KEY,
  "categoryId" INTEGER REFERENCES products(id),
  "categoryName" VARCHAR(255) NOT NULL,
  description VARCHAR(255)
);

CREATE TABLE keywords (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE product_keywords (
  "productId" INTEGER REFERENCES products(id) UNIQUE,
  "keywordId" INTEGER REFERENCES keywords(id) UNIQUE
);

CREATE TABLE order_art (
  id SERIAL PRIMARY KEY,
  date DATE,
  "customerId" INTEGER REFERENCES customers(id),
  "shipmentDate" DATE NOT NULL,
  "deliveryStatus" BOOLEAN
);

CREATE TABLE order_description (
  id SERIAL PRIMARY KEY,
  quantity INTEGER,
  price INTEGER,
  "orderId" INTEGER REFERENCES order_art(id), 
  total INTEGER
);
