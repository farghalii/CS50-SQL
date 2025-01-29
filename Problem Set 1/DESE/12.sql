SELECT D.name,"per_pupil_expenditure","exemplary" FROM "districts" D
JOIN "expenditures" ON D."id"="expenditures"."district_id"
JOIN  "staff_evaluations" ON "staff_evaluations"."district_id"=D."id"
GROUP BY D.name HAVING ("type"='Public School District' AND "per_pupil_expenditure" IN(SELECT "per_pupil_expenditure"
FROM"expenditures" WHERE"per_pupil_expenditure">(
        SELECT AVG("per_pupil_expenditure") FROM "expenditures"
)  )
    AND
      "exemplary" IN  ( SELECT "exemplary" FROM "staff_evaluations" WHERE "exemplary" >(
        SELECT AVG("exemplary")FROM "staff_evaluations" ) )
 ) ORDER BY"exemplary"DESC,"per_pupil_expenditure"DESC ;

