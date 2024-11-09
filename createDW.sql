CREATE TABLE DIM_CLIENTE (
    ID_Cliente_Surrogate SERIAL PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Categoria_Fidelidade VARCHAR(10) CHECK (Categoria_Fidelidade IN ('Bronze', 'Prata', 'Ouro', 'Platina')),
    Data_Inicio DATE,
    Data_Fim DATE,
    Indicador_Ativo BOOLEAN DEFAULT TRUE
);


CREATE TABLE DIM_HOTEL (
    ID_Hotel SERIAL PRIMARY KEY,
    Nome_Hotel VARCHAR(100) NOT NULL,
    Cidade VARCHAR(100),
    Pais VARCHAR(50),
    Data_Inauguracao DATE
);

CREATE TABLE DIM_QUARTO (
    ID_Quarto_Surrogate SERIAL PRIMARY KEY,
    Tipo_Quarto VARCHAR(10) CHECK (Tipo_Quarto IN ('Standard', 'Luxo', 'Suíte')),
    Status_Manutencao VARCHAR(15) CHECK (Status_Manutencao IN ('Disponível', 'Em manutenção')),
    Data_Inicio DATE,
    Data_Fim DATE,
    Indicador_Ativo BOOLEAN DEFAULT TRUE
);

CREATE TABLE DIM_RECEITA (
    ID_Hotel INT REFERENCES DIM_HOTEL(ID_Hotel),
    Data DATE,
    Receita_Total_Diaria NUMERIC(10, 2),
    Despesas_Operacionais_Diarias NUMERIC(10, 2),
    PRIMARY KEY (ID_Hotel, Data)
);

CREATE TABLE FATO_RESERVA (
    ID_Reserva SERIAL PRIMARY KEY,
    ID_Cliente_Surrogate INT REFERENCES DIM_CLIENTE(ID_Cliente_Surrogate),
    ID_Hotel INT REFERENCES DIM_HOTEL(ID_Hotel),
    ID_Quarto_Surrogate INT REFERENCES DIM_QUARTO(ID_Quarto_Surrogate),
    Data_Checkin DATE,
    Data_Checkout DATE,
    Valor_Total_Reserva NUMERIC(10, 2)
);


