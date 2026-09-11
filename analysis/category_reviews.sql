-- 2. Quais categorias têm mais avaliações negativas e por quê (atraso, produto diferente do anunciado, etc.)?
CREATE VIEW vw_reviews_sentimento_texto AS
SELECT 
    review_score,
    review_comment_message,
    CASE 
        WHEN review_comment_message LIKE '%ótimo%' 
          OR review_comment_message LIKE '%excelente%'
          OR review_comment_message LIKE '%recomendo%'
          OR review_comment_message LIKE '%adorei%'
          OR review_comment_message LIKE '%perfeito%'
          OR review_comment_message LIKE '%bom%'
		  OR review_comment_message LIKE '%boa%'
        THEN 'positivo'
        WHEN review_comment_message LIKE '%péssimo%'
          OR review_comment_message LIKE '%horrível%'
          OR review_comment_message LIKE '%não recomendo%'
          OR review_comment_message LIKE '%decepcionado%'
          OR review_comment_message LIKE '%ruim%'
        THEN 'negativo'
        ELSE 'indefinido'
    END AS sentimento_texto
FROM order_reviews
WHERE review_comment_message IS NOT NULL AND review_comment_message != '';