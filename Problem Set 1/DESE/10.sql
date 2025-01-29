SELECT "name","per_pupil_expenditure" FROM "districts"
JOIN "expenditures" ON "expenditures"."district_id"="districts"."id"
GROUP BY "name" HAVING "type"='Public School District'  ORDER BY "per_pupil_expenditure"DESC LIMIT 10;
