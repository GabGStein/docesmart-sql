USE DoceSmart;

-- ==========================================
-- 1. CLIENTE
-- ==========================================
INSERT INTO CLIENTE (nome, email, telefone)
VALUES 
('João Pereira', 'joao@example.com', '11998887766'),
('Maria Silva', 'maria@example.com', '11997776655'),
('Carlos Santos', 'carlos@example.com', '11996665544');

-- ==========================================
-- 2. DOCE
-- ==========================================
INSERT INTO DOCE (nome, descricao, preco_venda)
VALUES
('Brigadeiro Tradicional', 'Doce de chocolate enrolado', 2.50),
('Beijinho', 'Doce de coco com leite condensado', 2.00),
('Cajuzinho', 'Doce de amendoim em formato de caju', 2.20);

-- ==========================================
-- 3. INGREDIENTE
-- ==========================================
INSERT INTO INGREDIENTE (nome, unidade_medida)
VALUES
('Chocolate em pó', 'g'),
('Leite condensado', 'ml'),
('Coco ralado', 'g'),
('Amendoim', 'g');

-- ==========================================
-- 4. FORNECEDOR
-- ==========================================
INSERT INTO FORNECEDOR (nome, telefone)
VALUES
('Fornecedor DoceBom', '1134345566'),
('IngredTop Distribuidora', '1133557799');

-- ==========================================
-- 5. COMPRA
-- ==========================================
INSERT INTO COMPRA (data_compra, id_fornecedor)
VALUES
('2025-01-10', 1),
('2025-01-12', 2);

-- ==========================================
-- 6. ITEM_COMPRA
-- ==========================================
INSERT INTO ITEM_COMPRA (id_compra, id_ingrediente, quantidade, preco_unitario)
VALUES
(1, 1, 500, 0.05),   -- Chocolate em pó
(1, 2, 1000, 0.04),  -- Leite condensado
(2, 3, 300, 0.03),   -- Coco ralado
(2, 4, 400, 0.02);   -- Amendoim

-- ==========================================
-- 7. ESTOQUE (quantidade inicial = quantidade comprada)
-- ==========================================
INSERT INTO ESTOQUE (id_ingrediente, quantidade_disponivel, data_atualizacao)
VALUES
(1, 500, '2025-01-10'),
(2, 1000, '2025-01-10'),
(3, 300, '2025-01-12'),
(4, 400, '2025-01-12');

-- ==========================================
-- 8. PEDIDO
-- ==========================================
INSERT INTO PEDIDO (data_pedido, valor_total, id_cliente)
VALUES
('2025-01-20', 10.20, 1),
('2025-01-22', 7.00, 2);

-- ==========================================
-- 9. ITEM_PEDIDO
-- ==========================================
INSERT INTO ITEM_PEDIDO (id_pedido, id_doce, quantidade, preco_unitario)
VALUES
(1, 1, 2, 2.50),   -- 2 Brigadeiros
(1, 3, 1, 2.20),   -- 1 Cajuzinho
(2, 2, 3, 2.00);   -- 3 Beijinhos
