-- Tabela CLIENTE
CREATE TABLE CLIENTE (
    ID_Cliente SERIAL PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Data_Nascimento DATE,
    Endereco VARCHAR(200),
    Categoria_Fidelidade VARCHAR(10) CHECK (Categoria_Fidelidade IN ('Bronze', 'Prata', 'Ouro', 'Platina')),
    Data_Ultima_Alteracao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela HOTEL
CREATE TABLE HOTEL (
    ID_Hotel SERIAL PRIMARY KEY,
    Nome_Hotel VARCHAR(100) NOT NULL,
    Cidade VARCHAR(100),
    Pais VARCHAR(50),
    Data_Inauguracao DATE
);

-- Tabela QUARTO
CREATE TABLE QUARTO (
    ID_Quarto SERIAL PRIMARY KEY,
    ID_Hotel INT,
    Tipo_Quarto VARCHAR(10) CHECK (Tipo_Quarto IN ('Standard', 'Luxo', 'Suíte')) NOT NULL,
    Status_Manutencao VARCHAR(15) CHECK (Status_Manutencao IN ('Disponível', 'Em manutenção')) NOT NULL,
    Data_Ultima_Reforma DATE,
    FOREIGN KEY (ID_Hotel) REFERENCES HOTEL(ID_Hotel) ON DELETE CASCADE
);

-- Tabela RESERVA
CREATE TABLE RESERVA (
    ID_Reserva SERIAL PRIMARY KEY,
    ID_Cliente INT,
    ID_Hotel INT,
    ID_Quarto INT,
    Data_Checkin DATE,
    Data_Checkout DATE,
    Valor_Total_Reserva DECIMAL(10, 2),
    FOREIGN KEY (ID_Cliente) REFERENCES CLIENTE(ID_Cliente) ON DELETE CASCADE,
    FOREIGN KEY (ID_Hotel) REFERENCES HOTEL(ID_Hotel) ON DELETE CASCADE,
    FOREIGN KEY (ID_Quarto) REFERENCES QUARTO(ID_Quarto) ON DELETE CASCADE
);

-- Tabela RECEITAS
CREATE TABLE RECEITAS (
    ID_Hotel INT,
    Data DATE,
    Receita_Total_Diaria DECIMAL(10, 2),
    Despesas_Operacionais_Diarias DECIMAL(10, 2),
    PRIMARY KEY (ID_Hotel, Data),
    FOREIGN KEY (ID_Hotel) REFERENCES HOTEL(ID_Hotel) ON DELETE CASCADE
);



-- insert's

-- Inserindo dados na tabela CLIENTE
INSERT INTO CLIENTE (Nome, Data_Nascimento, Endereco, Categoria_Fidelidade)
VALUES 
    ('Carlos Souza', '1985-04-15', 'Rua das Flores, 123, São Paulo', 'Ouro'),
    ('Ana Lima', '1990-07-21', 'Av. das Palmeiras, 456, Rio de Janeiro', 'Prata'),
    ('Mariana Silva', '1978-12-05', 'Rua dos Pinheiros, 789, Curitiba', 'Platina'),
    ('João Santos', '2001-01-12', 'Av. Central, 1010, Porto Alegre', 'Bronze');

-- Inserindo dados na tabela HOTEL
INSERT INTO HOTEL (Nome_Hotel, Cidade, Pais, Data_Inauguracao)
VALUES 
    ('Hotel Copacabana', 'Rio de Janeiro', 'Brasil', '1995-09-01'),
    ('Hotel Plaza', 'São Paulo', 'Brasil', '2000-03-20'),
    ('Hotel Atlântico', 'Curitiba', 'Brasil', '2010-05-18'),
    ('Hotel Oceano', 'Porto Alegre', 'Brasil', '2018-11-25');

-- Inserindo dados na tabela QUARTO
INSERT INTO QUARTO (ID_Hotel, Tipo_Quarto, Status_Manutencao, Data_Ultima_Reforma)
VALUES 
    (1, 'Standard', 'Disponível', '2023-01-15'),
    (1, 'Luxo', 'Em manutenção', '2022-12-01'),
    (2, 'Suíte', 'Disponível', '2023-05-10'),
    (3, 'Standard', 'Disponível', '2021-11-22'),
    (4, 'Luxo', 'Disponível', '2020-07-30');

-- Inserindo dados na tabela RESERVA
INSERT INTO RESERVA (ID_Cliente, ID_Hotel, ID_Quarto, Data_Checkin, Data_Checkout, Valor_Total_Reserva)
VALUES 
    (1, 1, 1, '2024-11-10', '2024-11-15', 1200.00),
    (2, 2, 3, '2024-11-20', '2024-11-25', 2500.00),
    (3, 3, 4, '2024-12-05', '2024-12-10', 1500.00),
    (4, 4, 5, '2024-12-15', '2024-12-20', 3000.00);

-- Inserindo dados na tabela RECEITAS
INSERT INTO RECEITAS (ID_Hotel, Data, Receita_Total_Diaria, Despesas_Operacionais_Diarias)
VALUES 
    (1, '2024-11-01', 5000.00, 2500.00),
    (1, '2024-11-02', 5200.00, 2600.00),
    (2, '2024-11-01', 7000.00, 3200.00),
    (3, '2024-11-01', 4500.00, 2000.00),
    (4, '2024-11-01', 6200.00, 2800.00),
    (4, '2024-11-02', 6400.00, 2900.00);
