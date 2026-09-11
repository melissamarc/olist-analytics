-- 2. Quais categorias têm mais avaliações negativas
--  e por quê (atraso, produto diferente do anunciado, etc.)?
WITH reviews_categorizados AS (
    SELECT 
        o.order_id,
        c.product_category_name,
        r.review_score,
        r.review_comment_message,
        CASE 
            WHEN r.review_comment_message LIKE '%atraso%' 
              OR r.review_comment_message LIKE '%demorou%'
              OR r.review_comment_message LIKE '%não chegou%'
            THEN 'atraso na entrega'

            WHEN r.review_comment_message LIKE '%defeito%'
              OR r.review_comment_message LIKE '%quebrado%'
              OR r.review_comment_message LIKE '%não funciona%'
            THEN 'produto com defeito'

            WHEN r.review_comment_message LIKE '%diferente%'
              OR r.review_comment_message LIKE '%errado%'
              OR r.review_comment_message LIKE '%não é o que%'
            THEN 'produto divergente do anunciado'

            WHEN r.review_comment_message LIKE '%embalagem%'
              OR r.review_comment_message LIKE '%caixa%'
            THEN 'problema de embalagem'

            WHEN r.review_comment_message IS NULL 
              OR r.review_comment_message = ''
            THEN 'sem comentário'

            ELSE 'outro / não identificado'
        END AS motivo
    FROM category_name_translation AS c
    JOIN products AS p ON p.product_category_name = c.product_category_name
    JOIN order_items AS i ON i.product_id = p.product_id
    JOIN orders AS o ON o.order_id = i.order_id
    JOIN order_reviews AS r ON r.order_id = o.order_id
    WHERE r.review_score < 3
),
contagem AS (
    SELECT 
        product_category_name,
        motivo,
        COUNT(DISTINCT order_id) AS qtd_pedidos
    FROM reviews_categorizados
    GROUP BY product_category_name, motivo
)

SELECT 
    product_category_name,
    motivo,
    qtd_pedidos,
    SUM(qtd_pedidos) OVER (PARTITION BY product_category_name) AS total_categoria
FROM contagem
ORDER BY total_categoria DESC, qtd_pedidos DESC;