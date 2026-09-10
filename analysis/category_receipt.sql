-- 1. Quais categorias de produto geram mais receita?
USE olist;

SELECT c.product_category_name AS categoria, SUM(o.price + o.freight_value) AS receita
FROM category_name_translation AS c
JOIN products AS p
ON c.product_category_name = p.product_category_name
JOIN order_items AS o ON o.product_id = p.product_id
JOIN orders AS ord ON o.order_id = ord.order_id
WHERE ord.order_status <> 'canceled'
GROUP BY c.product_category_name
ORDER BY receita DESC
LIMIT 5;

