USE DoceSmart;

-- ============================
-- ⚡ COMANDOS UPDATE
-- ============================

-- 1. Atualizar telefone de um cliente específico
UPDATE CLIENTE
SET telefone = '1199999-8888'
WHERE id_cliente = 1;

-- 2. Ajustar o preço de venda de um doce
UPDATE DOCE
SET preco_venda = preco_venda + 1.00
WHERE id_doce = 2;

-- 3. Atualizar quantidade em estoque após uma reposição
UPDATE ESTOQUE
SET quantidade_disponivel = quantidade_disponivel + 200,
    data_atualizacao = CURDATE()
WHERE id_ingrediente = 1;

-- ============================
-- ⚡ COMANDOS DELETE
-- ============================

-- 1) Deletar um item de pedido pelo id_item_pedido (DELETE simples por PK)
DELETE FROM ITEM_PEDIDO
WHERE id_item_pedido = 3;

-- 2) Deletar um item de compra pelo id_item_compra (DELETE simples por PK)
DELETE FROM ITEM_COMPRA
WHERE id_item_compra = 3;

-- 3) Deletar um cliente que não possui pedidos (ex.: id_cliente = 3 no dataset de exemplo)
--    Este DELETE é seguro porque estamos removendo um cliente sem dependências (sem pedidos).
DELETE FROM CLIENTE
WHERE id_cliente = 3
  AND NOT EXISTS (
    SELECT 1 FROM PEDIDO P WHERE P.id_cliente = CLIENTE.id_cliente
  );

