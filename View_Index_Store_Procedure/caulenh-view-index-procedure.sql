ALTER TABLE products ADD UNIQUE (productCode);

-- chỉ mục
ALTER TABLE products ADD INDEX idx_name_price (productName , productPrice);
EXPLAIN SELECT * FROM products  WHERE productName = 'addd' AND productPrice > 100;

-- -view
CREATE VIEW products_view_price_top as tạo 
SELECT productCode, productName, productPrice,productStatus 
FROM products where productPrice >100;
select * from products_view_price_top;
DROP VIEW IF EXISTS products_view_price_top;

-- store PROCEDURE 

-- procedure lấy ra tất cả sản phẩm
CREATE PROCEDURE GetAllProducts() 
BEGIN
    SELECT * FROM products;
end

-- procedure thêm cả sản phẩm
CREATE PROCEDURE addProduct(IN code VARCHAR(50),IN name varchar(100),
IN price varchar(100),IN amount int(11),in des varchar(100),in status varchar(20)) 
BEGIN
    INSERT INTO products(productCode, productName, productPrice, productAmount, productDescription, productStatus)
VALUES (code, name, price, amount,des,status);
END 

-- procedure sửa sản phẩm
CREATE PROCEDURE updateProduct(in updateId int(11),IN code VARCHAR(50),IN name varchar(100),
IN price varchar(100),IN amount int(11),in des varchar(100),in status varchar(20)) 
BEGIN
 UPDATE products
    SET productCode=code,
        productName = name,
        productPrice = price,
        productAmount = amount,
        productDescription = des,
        productStatus = status
    WHERE id = updateId;
END 

-- procedure xóa sản phẩm
create procedure deleteProduct(in deleId int(11))
begin
	DELETE FROM products WHERE id=deleId;
end


-- DROP PROCEDURE IF EXISTS addProduct;

-- gọi các procedure;
call GetAllProducts();
call addProduct('pd08','ádas',1234,123,'dádd','ok');
call updateProduct(7,'pd088','ádas',2234,153,'dádd','ossk');
call deleteProduct(7);
