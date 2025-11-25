USE DoceSmart;

-- 1. Listar todos os clientes em ordem alfabética
SELECT id_cliente, nome, email
FROM CLIENTE
ORDER BY nome ASC;

-- 2. Listar os doces com preço acima de 2.20
SELECT id_doce, nome, preco_venda
FROM DOCE
WHERE preco_venda >= 2.20;

-- 3. Consultar pedidos com os dados do cliente (JOIN)
SELECT 
    P.id_pedido,
    P.data_pedido,
    C.nome AS cliente_nome,
    P.valor_total
FROM PEDIDO P
JOIN CLIENTE C ON P.id_cliente = C.id_cliente;

-- 4. Listar os ingredientes e suas quantidades em estoque
SELECT 
    I.nome AS ingrediente,
    E.quantidade_disponivel,
    I.unidade_medida,
    E.data_atualizacao
FROM ESTOQUE E
JOIN INGREDIENTE I ON E.id_ingrediente = I.id_ingrediente;

-- 5. Listar os 3 doces mais caros
SELECT id_doce, nome, preco_venda
FROM DOCE
ORDER BY preco_venda DESC
LIMIT 3;
