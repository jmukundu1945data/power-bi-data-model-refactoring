-- Standardizing Commodity Values

SELECT 
    ParticipantID,
    CASE 
        WHEN Commodity IN ('Poulry', 'POULTRY') THEN 'Poultry'
        WHEN Commodity IN ('HORTCULTURE', 'Horticulture') THEN 'Horticulture & Crop Production'
        WHEN Commodity IN ('Soybeans', 'SOYBEAN') THEN 'Soybean'
        WHEN Commodity IN ('MAIZE') THEN 'Maize'
        WHEN Commodity IN ('RICE') THEN 'Rice'
        WHEN Commodity IN ('Aqualculture') THEN 'Aquaculture'
        ELSE Commodity
    END AS Commodity_Clean
FROM dbo.FactParticipant;