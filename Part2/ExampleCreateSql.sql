CREATE DATABASE test CHARACTER SET utf8;
USE test;


/*
Vendors 表存储销售产品的供应商

vend_id 唯一的供应商ID
vend_name 供应商名
vend_address 供应商的地址
vend_city 供应商所在城市
vend_state 供应商所在州
vend_zip 供应商地址邮政编码
vend_country 供应商所在国家
*/
CREATE TABLE Vendors
(
	vend_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, 
	vend_name VARCHAR(100), 
	vend_address VARCHAR(100), 
	vend_city VARCHAR(100), 
	vend_state VARCHAR(100), 
	vend_zip VARCHAR(10), 
	vend_country VARCHAR(100)
);


/*
Products 表包含产品目录，每行一个产品

prod_id 唯一的产品ID
vend_id 产品供应商ID（关联到Vendors表的vend_id）
prod_name 产品名
prod_price 产品价格
prod_desc 产品描述
*/
CREATE TABLE Products
(
	prod_id VARCHAR(10) NOT NULL PRIMARY KEY, 
	vend_id INT, prod_name VARCHAR(100), 
	prod_price DECIMAL(10, 2), 
	prod_desc TEXT, 
	FOREIGN KEY(vend_id) REFERENCES Vendors(vend_id)
);


/*
Customers 表存储所有顾客信息

cust_id 唯一的顾客ID
cust_name 顾客名
cust_address 顾客的地址
cust_city 顾客所在城市
cust_state 顾客所在州
cust_zip 顾客地址邮政编码
cust_country 顾客所在国家
cust_contact 顾客的联系名
cust_email 顾客的电子邮件地址
*/
CREATE TABLE Customers
(
	cust_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, 
	cust_name VARCHAR(100), 
	cust_address VARCHAR(100), 
	cust_city VARCHAR(100), 
	cust_state VARCHAR(100), 
	cust_zip VARCHAR(10), 
	cust_country VARCHAR(100),
	cust_contact VARCHAR(100),
	cust_email VARCHAR(100)
);


/*
Orders表存储顾客订单(不是订单细节)

order_num 唯一的订单号
order_date 订单日期
cust_id 订单顾客ID（关联到Customers表的cust_id）
*/
CREATE TABLE Orders
(
	order_num INT NOT NULL PRIMARY KEY AUTO_INCREMENT, 
	order_date DATETIME NOT NULL,
	cust_id INT,
	FOREIGN KEY(cust_id) REFERENCES Customers(cust_id)
);


/*
OrderItems 表存储每个订单中的实际物品，每个订单的每个物品一行

order_num 订单号（关联到Orders表的order_num）
order_item 订单物品号（订单内的顺序）
prod_id 产品ID（关联到Products表的prod_id）
quantity 物品数量
item_price 物品价格
*/
CREATE TABLE OrderItems
(
	order_num INT NOT NULL, 
	order_item INT NOT NULL,
	prod_id VARCHAR(10) NOT NULL,
	quantity INT,
	item_price DECIMAL(10, 2),
	PRIMARY KEY(order_num, order_item),
	FOREIGN KEY(order_num) REFERENCES Orders(order_num),
	FOREIGN KEY(prod_id) REFERENCES Products(prod_id)
);