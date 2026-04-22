-- Deduplication using ROW_NUMBER
-- Grain: ParticipantID + ComponentID + YearKey

WITH dups AS (
    SELECT *,
        ROW_NUMBER() OVER (
            PARTITION BY ParticipantID, ComponentID, YearKey
            ORDER BY (SELECT NULL)
        ) AS rn
    FROM dbo.FactParticipant
)
DELETE FROM dups
WHERE rn > 1;