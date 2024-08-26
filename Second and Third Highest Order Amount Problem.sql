DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
    order_id INT,
    customer_id INT,
    order_date DATE,
    order_amount DECIMAL(10, 2)
);

INSERT INTO orders (order_id, customer_id, order_date, order_amount) VALUES
(1, 101, '2024-01-10', 150.00),
(2, 101, '2024-02-15', 200.00),
(3, 101, '2024-03-20', 180.00),
(4, 102, '2024-01-12', 200.00),
(5, 102, '2024-02-25', 250.00),
(6, 102, '2024-03-10', 320.00),
(7, 103, '2024-01-25', 400.00),
(8, 103, '2024-02-15', 420.00);

SELECT * FROM ORDERS

-- Write a query to find each customer’s latest order amount
-- along with the amount of the second latest order.

-- Your output should be like 
-- customer_id, lastest_order_amount, second_lastest_order_amount  


SELECT O1.CUSTOMER_ID,
       O1.ORDER_AMOUNT AS LATEST_ORDER_AMOUNT,
	   (SELECT
	      MAX(O3.ORDER_AMOUNT)
	    FROM ORDERS AS O3
	    WHERE O3.CUSTOMER_ID=O1.CUSTOMER_ID
	    AND O3.ORDER_DATE < O1.ORDER_DATE
	   ) AS SECOND_LATEST_ORDER_AMOUNT
FROM ORDERS O1
WHERE O1.ORDER_DATE IN 
	(SELECT MAX(O2.ORDER_DATE) FROM ORDERS O2 WHERE O1.CUSTOMER_ID= O2.CUSTOMER_ID)


--Table 2 will bring out the Latest_Order_Amount
-- Table 3 will bring out the Second_Latest_Order_Amount

