
-- 1. Qual é a receita média por cliente em cada categoria de fidelidade?

SELECT 
    c.Categoria_Fidelidade,
    AVG(fr.Valor_Total_Reserva) AS Receita_Media_por_Cliente
FROM 
    FATO_RESERVA fr
JOIN 
    DIM_CLIENTE c ON fr.ID_Cliente_Surrogate = c.ID_Cliente_Surrogate
GROUP BY 
    c.Categoria_Fidelidade;

    -- 2. Quais hotéis possuem as taxas de ocupação mais altas em um período específico?
    SELECT 
    c.Categoria_Fidelidade,
    fr.ID_Hotel,
    AVG((fr.Data_Checkout - fr.Data_Checkin)) AS Media_Tempo_Estadia
FROM 
    FATO_RESERVA fr
JOIN 
    DIM_CLIENTE c ON fr.ID_Cliente_Surrogate = c.ID_Cliente_Surrogate
GROUP BY 
    c.Categoria_Fidelidade,
    fr.ID_Hotel
ORDER BY 
    Media_Tempo_Estadia DESC;



    -- 3. Qual a média de tempo que os clientes de uma determinada categoria de fidelidade permanecem nos hotéis?
    SELECT 
    c.Categoria_Fidelidade,
    AVG((fr.Data_Checkout - fr.Data_Checkin)) AS Media_Tempo_Estadia
FROM 
    FATO_RESERVA fr
JOIN 
    DIM_CLIENTE c ON fr.ID_Cliente_Surrogate = c.ID_Cliente_Surrogate
GROUP BY 
    c.Categoria_Fidelidade
ORDER BY 
    Media_Tempo_Estadia DESC;

    -- 4. Quais quartos são mais frequentemente reformados, e com que frequência?
       SELECT 
    q.Tipo_Quarto,
    COUNT(*) AS Numero_Reformas,
    MAX(q.Data_Inicio) AS Ultima_Reforma
FROM 
    DIM_QUARTO q
WHERE 
    q.Status_Manutencao = 'Em manutenção'
GROUP BY 
    q.Tipo_Quarto
ORDER BY 
    Numero_Reformas DESC;
    -- 5. Qual o perfil dos clientes com maior gasto em reservas por país e categoria de fidelidade?

    SELECT 
    c.Categoria_Fidelidade,
    h.Pais,
    c.Nome,
    SUM(fr.Valor_Total_Reserva) AS Total_Gasto
FROM 
    FATO_RESERVA fr
JOIN 
    DIM_CLIENTE c ON fr.ID_Cliente_Surrogate = c.ID_Cliente_Surrogate
JOIN 
    DIM_HOTEL h ON fr.ID_Hotel = h.ID_Hotel
GROUP BY 
    c.Categoria_Fidelidade, h.Pais, c.Nome
ORDER BY 
    Total_Gasto DESC;

