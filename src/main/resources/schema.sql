-- BASE TABLES --

-- Countries --
CREATE TABLE IF NOT EXISTS countries (
    id SERIAL PRIMARY KEY,
    country_name VARCHAR(100) UNIQUE NOT NULL,
    country_flag VARCHAR(100) UNIQUE NOT NULL
);

-- Companies/Institutions --
CREATE TABLE IF NOT EXISTS companies_institutions (
    id SERIAL PRIMARY KEY,
    ci_name VARCHAR(100) UNIQUE NOT NULL,
    web_url VARCHAR(200) UNIQUE NOT NULL,
    logo VARCHAR(100) UNIQUE NOT NULL
);

-- Table: experience
CREATE TABLE IF NOT EXISTS experience (
    id SERIAL PRIMARY KEY,
    job_title VARCHAR(100) NOT NULL,
    company_id INT NOT NULL,
    country_id INT NOT NULL,
    start_d DATE NOT NULL,
    end_d DATE,
    content_description TEXT,
    CONSTRAINT fk_country_experience FOREIGN KEY (country_id)
        REFERENCES countries(id),
    CONSTRAINT fk_company FOREIGN KEY (company_id)
        REFERENCES companies_institutions(id)
);


-- Table: education
CREATE TABLE IF NOT EXISTS education (
    id SERIAL PRIMARY KEY,
    course_title VARCHAR(100) NOT NULL,
    institution_id INT NOT NULL,
    country_id INT NOT NULL,
    start_d INT NOT NULL,
    end_d INT, 
    content_description TEXT,
    CONSTRAINT fk_country_education FOREIGN KEY (country_id)
        REFERENCES countries(id),
    CONSTRAINT fk_institution FOREIGN KEY (institution_id)
        REFERENCES companies_institutions(id)
);

-- Table: skills
CREATE TABLE IF NOT EXISTS skills (
    id SERIAL PRIMARY KEY,
    skill_name VARCHAR(100) NOT NULL,
    skill_level VARCHAR(50)
);

-- RELATIONSHIP TABLES --

-- Table: Skills acquired from experience
CREATE TABLE IF NOT EXISTS experience_skills (
    skill_id INT NOT NULL,
    experience_id INT NOT NULL,
    PRIMARY KEY (experience_id, skill_id),
        CONSTRAINT fk_experience
        FOREIGN KEY (experience_id)
        REFERENCES experience (id)
        ON DELETE CASCADE,
    CONSTRAINT fk_skill
        FOREIGN KEY (skill_id)
        REFERENCES skills (id)
        ON DELETE CASCADE
);

-- Table: Skills acquired from education
CREATE TABLE IF NOT EXISTS education_skills (
    skill_id INT NOT NULL,
    education_id INT NOT NULL,
    PRIMARY KEY (education_id, skill_id),
        CONSTRAINT fk_education
        FOREIGN KEY (education_id)
        REFERENCES education (id)
        ON DELETE CASCADE,
    CONSTRAINT fk_skill
        FOREIGN KEY (skill_id)
        REFERENCES skills (id)
        ON DELETE CASCADE
);

-- ================
-- INSERT BASE DATA --
-- ================


-- Countries --
INSERT INTO countries(country_name, country_flag) VALUES
('NLD', 'nld'), -- 1
('FRA', 'fra'), -- 2
('POR', 'por'), -- 3
('DNK', 'dnk'), -- 4
('CAD', 'cad'); -- 5


-- Companies/Institutions --
INSERT INTO companies_institutions(ci_name, web_url, logo) VALUES
('UQAC - Université du Québec à Chicoutimi', 'https://www.uqac.ca/', 'uqac'),                                       -- 1
('Polytech Paris-Saclay', 'https://www.polytech.universite-paris-saclay.fr/', 'polytech'),                          -- 2
('Sorbonne Université - Faculté des sciences', 'https://sciences.sorbonne-universite.fr/faculte', 'sorbonne'),      -- 3
('ASML', 'https://www.asml.com/en', 'asml'),                                                                        -- 4
('CMBIO', 'https://cmbio.io/', 'cmbio'),                                                                            -- 5
('Grupo Visabeira', 'https://grupovisabeira.com/en/home', 'visa'),                                                  -- 6
('Les Ateliers Kikicode', 'https://www.kikicode.ca/', 'kiki');                                                      -- 7


-- Experience --
INSERT INTO experience(job_title, company_id, country_id, start_d, end_d, content_description) VALUES
('INTERN', 4, 1, '2024-09-02', '2025-03-02', 'Design of a quality control and process optimization dashboard for the NPI (New Product Introduction) process of a TWINSCAN factory team in Veldhoven#Analysis and understanding of a complex manufacturing system#Definition of KPIs (Key Performance Indicators) enabling a clear, structured, and comprehensive visualization of the team’s work quality#Prototyping of a subset of these tools and indicators using Excel VBA and Python scripts'),
('ON DEMAND', 7, 5, '2023-11-01', '2024-05-01', 'Delivering online Python lessons to teenagers eager to learn about computer science'),
('INTERN', 5, 4, '2023-05-02', '2023-08-02', ' Design of a SaaS tool allowing company clients to access the genetic sequencing and analysis pipeline through a web portal#Exploration of various AWS technologies (Lambda, DynamoDB, S3, Amplify, etc.) and development of a project plan#Development of a prototype web interface for the tool'),
('INTERN', 6, 3, '2022-07-04', '2022-07-29', ' Design of a web-based business intelligence dashboard# Learning the fundamentals of business intelligence and the ETL (Extract, Transform, Load) process#Prototyping of an interactive web interface for the dashboard');


-- Education --
INSERT INTO education(course_title, institution_id, country_id, start_d, end_d, content_description) VALUES 
('Master''s degree in Professional Computer Science (dual degree)', 1, 5, '2023', '2025', 'Advanced software development - Testing and verification - Machine Learning - Management and communication'),
('Engineering program - specialization in Computer Science and Mathematical Engineering', 2, 2, '2021', '2025', ' Software development - Algorithmics - UI/UX - UML - Data Management - Economics'),
('PEIP program (Preparatory Program for Polytech Engineering Schools)', 3, 2, '2019', '2021', ' ');