SELECT S.name,"per_pupil_expenditure","graduated" FROM "schools" S
JOIN "expenditures" ON "expenditures"."district_id"=S."district_id"
JOIN "graduation_rates" ON "graduation_rates"."school_id"=S."id"
GROUP BY S.name ORDER BY "per_pupil_expenditure" DESC,S.name;
