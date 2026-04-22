-- Final Fact Table Build (Star Schema)

SELECT 
    f.ParticipantID,
    p.ProvinceID,
    c.ComponentID,
    cm.CommodityID,
    g.GenderID,
    y.YearKey,
    f.Age,
    f.HouseholdSize,
    f.YouthHouseholdCount,
    f.HasEnterprise,
    f.HasBusinessPlan,
    f.HasLoan,
    f.IDPStatus,
    f.JobsCreated
INTO FactParticipant_Final
FROM FactParticipant f
LEFT JOIN DimProvince p
    ON f.ProvinceCode = p.ProvinceCode
LEFT JOIN DimComponent c
    ON f.ComponentCode = c.ComponentCode
LEFT JOIN DimCommodity cm
    ON f.Commodity = cm.Commodity
LEFT JOIN DimGender g
    ON f.Gender = g.GenderName
LEFT JOIN DimYear y
    ON f.YearNum = y.YearKey;