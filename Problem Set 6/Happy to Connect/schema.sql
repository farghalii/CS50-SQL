CREATE TABLE users(
    id int AUTO_INCREMENT,
    first_name varchar(20),
    last_name varchar(20),
    user_name varchar(20),
    password varchar(30),
    PRIMARY KEY (id)
 );
 CREATE TABLE schools(
   id int AUTO_INCREMENT,
    name varchar(20),
    type ENUM('Primary' , 'Secondary' , 'Higher Education'),
    location varchar(20),
    founded_year year,
    PRIMARY KEY (id)
 );
 CREATE TABLE companies(
     id int AUTO_INCREMENT,
    name varchar(20),
    industry varchar(20) NOT NULL,
    location varchar(20) NOT NULL,
    PRIMARY KEY (id)
 );
CREATE TABLE user_Connections(
    userA_id int,
    userB_id int,
    PRIMARY KEY (userA_id,userB_id),
    FOREIGN KEY (userA_id) REFERENCES users(id),
    FOREIGN KEY (userB_id) REFERENCES users(id)
);
CREATE TABLE school_Connections(
    user_id INT,
    school_id INT,
    start_date DATE NOT NULL,
     end_date DATE NOT NULL,
    degree_type VARCHAR(15),
    PRIMARY KEY (user_id,school_id),
    FOREIGN KEY (user_id) REFERENCES users(id),
     FOREIGN KEY (school_id) REFERENCES schools(id)
);
CREATE TABLE companies_Connections(
    user_id INT,
    company_id INT,
    start_date DATE NOT NULL,
    end_date  DATE NOT NULL,
    title VARCHAR(20),
    PRIMARY KEY (user_id,company_id),
     FOREIGN KEY (user_id) REFERENCES users(id),
     FOREIGN KEY (company_id) REFERENCES companies(id)
);
