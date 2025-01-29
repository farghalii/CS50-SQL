SELECT "name" FROM "districts"
JOIN "expenditures" ON "expenditures"."district_id"="districts"."id"
GROUP BY "name"  ORDER BY "pupils" LIMIT 1;
