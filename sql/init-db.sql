CREATE DATABASE IF NOT EXISTS EmployeeManagement;
USE EmployeeManagement;

CREATE TABLE IF NOT EXISTS employees (
    empid INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    gender ENUM('Male', 'Female', 'Other') NOT NULL,
    identified_race VARCHAR(50),
    dob DATE NOT NULL,
    phone VARCHAR(20),
    ssn VARCHAR(11) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS division (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS employee_division (
    empid INT,
    div_id INT,
    PRIMARY KEY (empid, div_id),
    FOREIGN KEY (empid) REFERENCES employees(empid) ON DELETE CASCADE,
    FOREIGN KEY (div_id) REFERENCES division(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS job_titles (
    job_title_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS employee_job_titles (
    empid INT,
    job_title_id INT,
    PRIMARY KEY (empid, job_title_id),
    FOREIGN KEY (empid) REFERENCES employees(empid) ON DELETE CASCADE,
    FOREIGN KEY (job_title_id) REFERENCES job_titles(job_title_id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS payroll (
    payroll_id INT PRIMARY KEY AUTO_INCREMENT,
    empid INT,
    salary DECIMAL(10,2) NOT NULL,
    pay_date DATE NOT NULL,
    FOREIGN KEY (empid) REFERENCES employees(empid) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS state (
    state_id INT PRIMARY KEY AUTO_INCREMENT,
    state_name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS city (
    city_id INT PRIMARY KEY AUTO_INCREMENT,
    city_name VARCHAR(100) NOT NULL UNIQUE,
    state_id INT,
    FOREIGN KEY (state_id) REFERENCES state(state_id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS address (
    address_id INT PRIMARY KEY AUTO_INCREMENT,
    empid INT,
    street VARCHAR(255) NOT NULL,
    city_id INT,
    zip VARCHAR(10) NOT NULL,
    FOREIGN KEY (empid) REFERENCES employees(empid) ON DELETE CASCADE,
    FOREIGN KEY (city_id) REFERENCES city(city_id) ON DELETE CASCADE
);

