SELECT "city",COUNT("id") AS "schools_number" FROM "schools" WHERE "type"='Public School'
GROUP BY "city"  ORDER BY "schools_number"DESC,"city" LIMIT 10;
