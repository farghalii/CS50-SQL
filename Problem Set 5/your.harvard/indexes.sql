CREATE INDEX "enrollments_index_students" ON "enrollments"("student_id");
CREATE INDEX "enrollments_index_courses" ON "enrollments"("course_id");
CREATE INDEX "index_course" ON "courses" ("department","title","semester");
CREATE INDEX  "index_satisfies" ON "satisfies"("course_id","requirement_id");


