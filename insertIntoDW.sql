-- inserindo dim_cliente

INSERT INTO DIM_CLIENTE (Nome, Categoria_Fidelidade, Data_Inicio, Data_Fim, Indicador_Ativo)
SELECT 
    nome,
    categoria_fidelidade,
    data_ultima_alteracao,
    NULL,
    TRUE
FROM 
    CLIENTE;

    -- inserindo dim_hotel

    INSERT INTO DIM_HOTEL (Nome_Hotel, Cidade, Pais, Data_Inauguracao)
SELECT 
    nome_hotel,
    cidade,
    pais,
    data_inauguracao
FROM 
    HOTEL;

-- inserindo dim_quarto

   INSERT INTO DIM_QUARTO (Tipo_Quarto, Status_Manutencao, Data_Inicio, Data_Fim, Indicador_Ativo)
SELECT 
    tipo_quarto,
    status_manutencao,
    data_ultima_reforma,
    NULL,
    TRUE
FROM 
    QUARTO;
   
-- inserindo dim_receita
      
INSERT INTO DIM_RECEITA (ID_Hotel, Data, Receita_Total_Diaria, Despesas_Operacionais_Diarias)
SELECT 
    id_hotel,
    data,
    receita_total_diaria,
    despesas_operacionais_diarias
FROM 
    RECEITAS;

    -- inserindo fato_reserva
   
   INSERT INTO FATO_RESERVA (ID_Cliente_Surrogate, ID_Hotel, ID_Quarto_Surrogate, Data_Checkin, Data_Checkout, Valor_Total_Reserva)
SELECT 
    id_cliente,
   	id_hotel,
    id_quarto,
    data_checkin,
    data_checkout,
    valor_total_reserva
FROM 
    RESERVA;




