CREATE VIEW "available" AS
SELECT "L"."id","property_type","host_name","date" FROM "listings" AS "L"
JOIN "availabilities" ON "L"."id"="availabilities"."listing_id"
WHERE "availabilities"."available"='TRUE';
