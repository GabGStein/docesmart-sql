CREATE DATABASE IF NOT EXISTS DoceSmart;
USE DoceSmart;


-- 1. CLIENTE
CREATE TABLE CLIENTE (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    telefone VARCHAR(50)
) ENGINE=InnoDB;


-- 2. DOCE
CREATE TABLE DOCE (
    id_doce INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao VARCHAR(255),
    preco_venda DECIMAL(10,2) NOT NULL
) ENGINE=InnoDB;

-- 3. INGREDIENTE
CREATE TABLE INGREDIENTE (
    id_ingrediente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    unidade_medida VARCHAR(50) NOT NULL
) ENGINE=InnoDB;

-- 4. FORNECEDOR
CREATE TABLE FORNECEDOR (
    id_fornecedor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(50)
) ENGINE=InnoDB;

-- 5. PEDIDO
CREATE TABLE PEDIDO (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    data_pedido DATE NOT NULL,
    valor_total DECIMAL(10,2) NOT NULL DEFAULT 0,
    id_cliente INT NOT NULL,
    FOREIGN KEY (id_cliente) 
        REFERENCES CLIENTE(id_cliente)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
) ENGINE=InnoDB;

-- 6. ITEM_PEDIDO
CREATE TABLE ITEM_PEDIDO (
    id_item_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT NOT NULL,
    id_doce INT NOT NULL,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_pedido) 
        REFERENCES PEDIDO(id_pedido)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (id_doce)
        REFERENCES DOCE(id_doce)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
) ENGINE=InnoDB;

-- 7. COMPRA
CREATE TABLE COMPRA (
    id_compra INT AUTO_INCREMENT PRIMARY KEY,
    data_compra DATE NOT NULL,
    id_fornecedor INT NOT NULL,
    FOREIGN KEY (id_fornecedor)
        REFERENCES FORNECEDOR(id_fornecedor)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
) ENGINE=InnoDB;

-- 8. ITEM_COMPRA
CREATE TABLE ITEM_COMPRA (
    id_item_compra INT AUTO_INCREMENT PRIMARY KEY,
    id_compra INT NOT NULL,
    id_ingrediente INT NOT NULL,
    quantidade DECIMAL(10,2) NOT NULL,
    preco_unitario DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_compra)
        REFERENCES COMPRA(id_compra)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (id_ingrediente)
        REFERENCES INGREDIENTE(id_ingrediente)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
) ENGINE=InnoDB;

-- 9. ESTOQUE
CREATE TABLE ESTOQUE (
    id_estoque INT AUTO_INCREMENT PRIMARY KEY,
    id_ingrediente INT NOT NULL,
    quantidade_disponivel DECIMAL(10,2) NOT NULL DEFAULT 0,
    data_atualizacao DATE NOT NULL,
    FOREIGN KEY (id_ingrediente)
        REFERENCES INGREDIENTE(id_ingrediente)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
) ENGINE=InnoDB;

