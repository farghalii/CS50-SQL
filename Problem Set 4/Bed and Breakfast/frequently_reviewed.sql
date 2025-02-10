CREATE VIEW frequently_reviewed AS
SELECT "L"."id","property_type","host_name",COUNT("reviews.id") AS "reviews numbers" FROM "listings" AS "L"
JOIN "reviews" ON  "L"."id"="reviews"."listing_id"
GROUP BY "L"."id"
ORDER BY "reviews numbers" DESC ,"property_type","host_name"
 LIMIT 100;
