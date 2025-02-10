CREATE VIEW june_vacancies AS
SELECT "L"."id","property_type","host_name",COUNT("availabilities.id") AS "days_vacant" FROM "listings" AS "L"
JOIN "availabilities" ON  "L"."id"="availabilities"."listing_id"
WHERE ("availabilities"."date" BETWEEN'2023-06-01' AND '2023-06-31') AND "availabilities"."available"='TRUE'
GROUP BY "L"."id";




