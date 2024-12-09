-- Create database
CREATE DATABASE AppFood;
USE AppFood;

-- Create `user` table
CREATE TABLE user (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(255),
    email VARCHAR(255) UNIQUE,
    password VARCHAR(255)
);

-- Create `restaurant` table
CREATE TABLE restaurant (
    res_id INT PRIMARY KEY AUTO_INCREMENT,
    res_name VARCHAR(255),
    image VARCHAR(255),
    `desc` VARCHAR(500)
);

-- Create `food_type` table
CREATE TABLE food_type (
    type_id INT PRIMARY KEY AUTO_INCREMENT,
    type_name VARCHAR(255)
);

-- Create `food` table
CREATE TABLE food (
    food_id INT PRIMARY KEY AUTO_INCREMENT,
    food_name VARCHAR(255),
    image VARCHAR(255),
    price FLOAT,
    `desc` VARCHAR(500),
    type_id INT,
    FOREIGN KEY (type_id) REFERENCES food_type(type_id)
);

-- Create `sub_food` table
CREATE TABLE sub_food (
    sub_id INT PRIMARY KEY AUTO_INCREMENT,
    sub_name VARCHAR(255),
    sub_price FLOAT,
    food_id INT,
    FOREIGN KEY (food_id) REFERENCES food(food_id)
);

-- Create `order` table
CREATE TABLE `order` (
    user_id INT,
    food_id INT,
    amount INT,
    code VARCHAR(50),
    arr_sub_id VARCHAR(255),
    FOREIGN KEY (user_id) REFERENCES user(user_id),
    FOREIGN KEY (food_id) REFERENCES food(food_id)
);

-- Create `rate_res` table
CREATE TABLE rate_res (
    user_id INT,
    res_id INT,
    amount INT,
    date_rate DATETIME,
    FOREIGN KEY (user_id) REFERENCES user(user_id),
    FOREIGN KEY (res_id) REFERENCES restaurant(res_id)
);

-- Create `like_res` table
CREATE TABLE like_res (
    user_id INT,
    res_id INT,
    date_like DATETIME,
    FOREIGN KEY (user_id) REFERENCES user(user_id),
    FOREIGN KEY (res_id) REFERENCES restaurant(res_id)
);


-- Insert data into `user` table
INSERT INTO user (full_name, email, password) VALUES
('Nguyen Van A', 'nguyenvana@example.com', 'password123'),
('Tran Thi B', 'tranthib@example.com', 'password456'),
('Le Van C', 'levanc@example.com', 'password789'),
('Pham Thi D', 'phamthid@example.com', 'password000'),
('Hoang Van E', 'hoangvane@example.com', 'password111');

-- Insert data into `restaurant` table
INSERT INTO restaurant (res_name, image, `desc`) VALUES
('Nhà hàng A', 'image_a.jpg', 'Mô tả nhà hàng A'),
('Nhà hàng B', 'image_b.jpg', 'Mô tả nhà hàng B'),
('Nhà hàng C', 'image_c.jpg', 'Mô tả nhà hàng C');

-- Insert data into `food_type` table
INSERT INTO food_type (type_name) VALUES
('Món chính'),
('Món phụ'),
('Đồ uống');

-- Insert data into `food` table
INSERT INTO food (food_name, image, price, `desc`, type_id) VALUES
('Phở bò', 'pho_bo.jpg', 50000, 'Món phở bò truyền thống', 1),
('Cơm gà', 'com_ga.jpg', 45000, 'Món cơm gà hấp dẫn', 1),
('Trà đá', 'tra_da.jpg', 5000, 'Trà đá mát lạnh', 3),
('Gỏi cuốn', 'goi_cuon.jpg', 30000, 'Món gỏi cuốn tươi ngon', 2);

-- Insert data into `sub_food` table
INSERT INTO sub_food (sub_name, sub_price, food_id) VALUES
('Thêm rau', 5000, 1),
('Thêm nước sốt', 10000, 2),
('Thêm đá', 2000, 3);

-- Insert data into `order` table
INSERT INTO `order` (user_id, food_id, amount, code, arr_sub_id) VALUES
(1, 1, 2, 'ORD001', '1,2'),
(2, 2, 1, 'ORD002', '2'),
(3, 3, 3, 'ORD003', '3'),
(1, 4, 1, 'ORD004', '');

-- Insert data into `rate_res` table
INSERT INTO rate_res (user_id, res_id, amount, date_rate) VALUES
(1, 1, 4, '2023-12-01 10:00:00'),
(2, 2, 5, '2023-12-02 11:30:00'),
(3, 3, 3, '2023-12-03 12:45:00');

-- Insert data into `like_res` table
INSERT INTO like_res (user_id, res_id, date_like) VALUES
(1, 1, '2023-12-01 09:00:00'),
(1, 2, '2023-12-01 09:30:00'),
(2, 2, '2023-12-02 10:00:00'),
(3, 3, '2023-12-03 11:00:00'),
(4, 1, '2023-12-04 08:30:00');