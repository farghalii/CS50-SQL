SELECT "city",COUNT("id") AS "schools_number" FROM "schools" WHERE "type"='Public School'
GROUP BY "city"  HAVING "Schools_number"<=3 ORDER BY "schools_number"DESC ,"city";
