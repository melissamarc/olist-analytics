-- 3. Qual o tempo médio de entrega por estado e ele impacta a nota do cliente?
SELECT order_delivered_carrier_date, order_delivered_customer_date 
FROM orders
WHERE order_status = 'delivered';

SELECT
    DAY(order_delivered_carrier_date) AS entrega_loja,
    DAY(order_delivered_customer_date) AS entrega_cliente,
    (DAY(order_delivered_customer_date) - DAY(order_delivered_carrier_date)) AS tempo_entrega
FROM orders;
