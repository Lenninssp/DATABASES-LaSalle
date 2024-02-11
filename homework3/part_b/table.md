# Table 2 for homework 3 by Lennin

#### FACULTY(<u>FID</u>, FName, Salary)

#### COURSE_SECTION(CourseNo, CourseName,<u>Section-ID</u>, FID, FName, (Student-ID, StudentName,GRADE))

#### FACULTY
| FID | FName | Salary |
| --| ----   | ----  |
| 1 | lennin | $1000 |
| 2 | steven | $1500 |
| 3 | sabogal| $2000 |
| 4 | prieto | $2500 |

#### COURSE_SECTION
|Section-ID| CourseName | CourseNo   | FID | FName    | Student-ID | StudentName | GRADE |
|----------|------------|------------|-----|----------|------------|-------------|-------|
| 1        | Math       | 10         | 101 | Professor| 1001       | Alice       | A     |
|          |            | 15         | 102 | Professor| 1002       | Bob         | B     |
| 2        | Science    | 20         | 201 | Teacher  | 2001       | Carol       | B+    |
|          |            | 25         | 202 | Teacher  | 2002       | David       | A-    |


## 1 / 1NF
FACULTY is in 1NF because there is no partial dependency

COURSE_SELECTION is not in 1NF because there is partial dependency (StudentName depends on Student-ID only), 

change to --> COURSE_SECTION1(<u>CourseNo</u>, CourseName,Section-ID, FID, FName,Student-ID, StudentName,GRADE)

#### COURSE_SECTION1
|Section-ID| CourseName |  CourseNo  | FID | FName    | Student-ID | StudentName | GRADE |
|----------|------------|------------|-----|----------|------------|-------------|-------|
| 1        | Math       | 10         | 101 | Professor| 1001       | Alice       | A     |
| 1        | Math       | 10         | 102 | Professor| 1002       | Bob         | B     |
| 2        | Science    | 20         | 201 | Teacher  | 2001       | Carol       | B+    |
| 2        | Science    | 20         | 202 | Teacher  | 2002       | David       | A-    |


## 2 / 2NF

Faculty is in 2NF because there is no repetition.

COURSE_SELECTION is not in 2NF because there is repetition

divide in 3 --> 


COURSE_SECTION2(<u>Section-ID</u>, CourseName,CourseNo, FID, FName)

STUDENT2(<u>Student-ID</u>, StudentName)

GRADE2(<u>Student-ID</u>, <u>CourseNo</u>,GRADE)

#### COURSE_SECTION2
|Section-ID| CourseName |  CourseNo  | FID | FName    |
|----------|------------|------------|-----|----------|
| 1        | Math       | 10         | 101 | Professor|
| 1        | Math       | 10         | 102 | Professor|
| 2        | Science    | 20         | 201 | Teacher  |
| 2        | Science    | 20         | 202 | Teacher  |

#### STUDENT2
| Student-ID | StudentName |
|------------|-------------|
| 1001       | Alice       |
| 1002       | Bob         |
| 2001       | Carol       |
| 2002       | David       |

#### GRADE2
| Student-ID |CourseNo| GRADE |
|------------|----------|-------|
| 1001       | 1        | A     |
| 1002       | 1        | B     |
| 2001       | 2        | B+    |
| 2002       | 2        | A-    |

## 3 / 3NF

STUDENT2 and GRADE2 are in 3NF because there is no partial dependency

COURSE_SECTION2 is not in 2NF because there is partial dependency (FName depends on FID only)

change to -->

COURSE_SECTION3(<u>Section-ID</u>, CourseName,CourseNo, FID)

FACULTY3(<u>FID</u>, FName) X Redundant

---

COURSE_SECTION3 is not in 2NF because there is partial dependency (FName depends on FID only)

change to -->

COURSE_SECTION4(<u>Section-ID</u>, CourseNo, FID)

COURSE4(<u>CourseNo</u>,CourseName)



---

FACULTY PK =  FID

STUDENT2 PK = Student-ID 

GRADE2 PK = CourseNo, Student-ID (Composite)

COURSE_SECTION4 PK = Section-ID (FK = FID, CourseNo)

COURSE4 PK = CourseNo


`FACULTY ` --< `COURSE_SECTION4` --< `COURSE4`--< `GRADE2` >-- `STUDENT2`






