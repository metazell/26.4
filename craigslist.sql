-- Create Regions table
CREATE TABLE regions (
    region_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);

-- Create Users table
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(100) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    preferred_region_id INT REFERENCES regions(region_id)
);

-- Create Posts table
CREATE TABLE posts (
    post_id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    text TEXT NOT NULL,
    user_id INT REFERENCES users(user_id),
    location VARCHAR(255),
    region_id INT REFERENCES regions(region_id)
);

-- Create Categories table
CREATE TABLE categories (
    category_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);

-- Create Post_Categories table (Join Table)
CREATE TABLE post_categories (
    post_id INT REFERENCES posts(post_id),
    category_id INT REFERENCES categories(category_id),
    PRIMARY KEY (post_id, category_id)
);
