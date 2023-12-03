# hw7-ddl.sql

## DO NOT RENAME OR OTHERWISE CHANGE THE SECTION TITLES OR ORDER.
## The autograder will look for specific code sections. If it can't find them, you'll get a "0"

# Code specifications.
# 0. Where there a conflict between the problem statement in the google doc and this file, this file wins.
# 1. Complete all sections below.
# 2. Table names must MATCH EXACTLY to schemas provided.
# 3. Define primary keys in each table as appropriate.
# 4. Define foreign keys connecting tables as appropriate.
# 5. Assign ID to skills, people, roles manually (you must pick the ID number!)
# 6. Assign ID in the peopleskills and peopleroles automatically (use auto_increment)
# 7. Data types: ONLY use "int", "varchar(255)", "varchar(4096)" or "date" as appropriate.

# Section 1
# Drops all tables.  This section should be amended as new tables are added.

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS skills;
DROP TABLE IF EXISTS people;
DROP TABLE IF EXISTS roles;
DROP TABLE IF EXISTS peopleskills;
DROP TABLE IF EXISTS peopleroles;
# ... 

SET FOREIGN_KEY_CHECKS=1;

# Section 2
# Create skills( id,name, description, tag, url, time_commitment)
# ID, name, description and tag cannot be NULL. Other fields can default to NULL.
# tag is a skill category grouping.  You can assign it based on your skill descriptions.
# time committment offers some sense of how much time was required (or will be required) to gain the skill.
# You can assign the skill descriptions.  Please be creative!


CREATE TABLE skills(
    skills_id int not null,
    skills_name varchar(255) not null,
    skills_description varchar(4096) not null,
    skills_tag varchar(255) not null,
    skills_url varchar(4096) not null,
    skills_time_commitment  int,
    primary key (skills_id)
);


# Section 3
# Populate skills
# Populates the skills table with eight skills, their tag fields must exactly contain “Skill 1”, “Skill 2”, etc.
# You can assign skill names.  Please be creative!


INSERT INTO skills (skills_id, skills_name, skills_description, skills_tag, skills_url, skills_time_commitment)
VALUES
    (1, 'Programming Wizardry', 'Master the art of coding spells', 'Skill 1', 'https://example.com/skill1', 20),
    (2, 'Data Alchemist', 'Transform data into gold', 'Skill 2', 'https://example.com/skill2', 15),
    (3, 'Cybernetic Sorcery', 'Defend against dark digital forces', 'Skill 3', 'https://example.com/skill3', 25),
    (4, 'Robotic Maestro', 'Conduct an orchestra of robots', 'Skill 4', 'https://example.com/skill4', 30),
    (5, 'Quantum Enchanter', 'Bend reality with quantum magic', 'Skill 5', 'https://example.com/skill5', 25),
    (6, 'Augmented Reality Artisan', 'Craft illusions in the real world', 'Skill 6', 'https://example.com/skill6', 15),
    (7, 'Blockchain Sorcerer', 'Harness the power of decentralized magic', 'Skill 7', 'https://example.com/skill7', 20),
    (8, 'Machine Learning Maestro', 'Teach machines the language of magic', 'Skill 8', 'https://example.com/skill8', 30);


# Section 4
# Create people( id,first_name, last_name, email, linkedin_url, headshot_url, discord_handle, brief_bio, date_joined)
# ID cannot be null, Last name cannot be null, date joined cannot be NULL.
# All other fields can default to NULL.

CREATE TABLE people (
    people_id int not null,
    people_first_name varchar(255),
    people_last_name varchar(255) NOT NULL,
    people_email varchar(255),
    people_linkedin_url varchar(4096),
    people_headshot_url varchar(4096),
    people_discord_handle varchar(255),
    people_brief_bio varchar(4096),
    people_date_joined date not null,
    PRIMARY KEY (people_id)
);

# Section 5
# Populate people with six people.
# Their last names must exactly be “Person 1”, “Person 2”, etc.
# Other fields are for you to assign.

INSERT INTO people (people_id, people_first_name, people_last_name, people_email, people_linkedin_url, people_headshot_url, people_discord_handle, people_brief_bio, people_date_joined)
VALUES
    (1, 'John', 'Person 1', 'john.person1@example.com', 'https://linkedin.com/in/person1', 'https://example.com/person1.jpg', 'person1#1234', 'I am Person 1, a creative individual with a passion for technology.', 20231201),
    (2, 'Jane', 'Person 2', 'jane.person2@example.com', 'https://linkedin.com/in/person2', 'https://example.com/person2.jpg', 'person2#5678', 'I am Person 2, exploring the intersection of art and technology.', 20231202),
    (3, 'Bob', 'Person 3', 'bob.person3@example.com', 'https://linkedin.com/in/person3', 'https://example.com/person3.jpg', 'person3#9012', 'I am Person 3, a coding enthusiast building a better future.', 20231203),
    (4, 'Alice', 'Person 4', 'alice.person4@example.com', 'https://linkedin.com/in/person4', 'https://example.com/person4.jpg', 'person4#3456', 'I am Person 4, passionate about data and analytics.', 20231204),
    (5, 'Charlie', 'Person 5', 'charlie.person5@example.com', 'https://linkedin.com/in/person5', 'https://example.com/person5.jpg', 'person5#7890', 'I am Person 5, on a journey to explore the world of cybersecurity.', 20231205),
    (6, 'Eva', 'Person 6', 'eva.person6@example.com', 'https://linkedin.com/in/person6', 'https://example.com/person6.jpg', 'person6#1234', 'I am Person 6, dedicated to creating innovative solutions.', 20231206);


# Section 6
# Create peopleskills( id, skills_id, people_id, date_acquired )
# None of the fields can ba NULL. ID can be auto_increment.

drop table if EXISTS peopleskills;
CREATE TABLE peopleskills (
    peopleskills_id int not null auto_increment,
    peopleskills_skills_id int not null,
    peopleskills_people_id int not null,
    peopleskills_date_acquired date not null,
    PRIMARY KEY (peopleskills_id),
    FOREIGN KEY (peopleskills_skills_id) REFERENCES skills(skills_id) on delete cascade,
    FOREIGN KEY (peopleskills_people_id) REFERENCES people(people_id),
    unique (peopleskills_skills_id, peopleskills_people_id)
);

# Section 7
# Populate peopleskills such that:
# Person 1 has skills 1,3,6;
# Person 2 has skills 3,4,5;
# Person 3 has skills 1,5;
# Person 4 has no skills;
# Person 5 has skills 3,6;
# Person 6 has skills 2,3,4;
# Person 7 has skills 3,5,6;
# Person 8 has skills 1,3,5,6;
# Person 9 has skills 2,5,6;
# Person 10 has skills 1,4,5;
# Note that no one has yet acquired skills 7 and 8.

INSERT INTO peopleskills (peopleskills_skills_id, peopleskills_people_id, peopleskills_date_acquired)
VALUES

    (1, 1, 20231201),
    (3, 1, 20231201),
    (6, 1, 20231201),
    

    (3, 2, 20231202),
    (4, 2, 20231202),
    (5, 2, 20231202),

    (1, 3, 20231203),
    (5, 3, 20231203),
    

    (3, 5, 20231205),
    (6, 5, 20231205),
    
    (2, 6, 20231206),
    (3, 6, 20231206),
    (4, 6, 20231206),
    

    (3, 7, 20231207),
    (5, 7, 20231207),
    (6, 7, 20231207),

    (1, 8, 20231208),
    (3, 8, 20231208),
    (5, 8, 20231208),
    (6, 8, 20231208),

    (2, 9, 20231209),
    (5, 9, 20231209),
    (6, 9, 20231209),
    
    (1, 10, 20231210),
    (4, 10, 20231210),
    (5, 10, 20231210);


# Section 8
# Create roles( id, name, sort_priority )
# sort_priority is an integer and is used to provide an order for sorting roles

CREATE TABLE roles (
    roles_id int not null auto_increment,
    roles_name varchar(255),
    roles_sort_priority int NOT NULL,
    PRIMARY KEY (roles_id)
);

# Section 9
# Populate roles
# Designer, Developer, Recruit, Team Lead, Boss, Mentor
# Sort priority is assigned numerically in the order listed above (Designer=10, Developer=20, Recruit=30, etc.)

INSERT INTO roles (roles_id, roles_name, roles_sort_priority)
VALUES
    (10, 'Designer', 10),
    (20, 'Developer', 20),
    (30, 'Recruit', 30),
    (40, 'Team Lead', 40),
    (50, 'Boss', 50),
    (60, 'Mentor', 60);


# Section 10
# Create peopleroles( id, people_id, role_id, date_assigned )
# None of the fields can be null.  ID can be auto_increment

CREATE TABLE peopleroles (
    peopleroles_id int not null auto_increment,
    peopleroles_people_id int not null,
    peopleroles_role_id int not null,
    peopleroles_date_assigned date not null,
    PRIMARY KEY (peopleroles_id),
    FOREIGN KEY (peopleroles_people_id) REFERENCES people(people_id),
    FOREIGN KEY (peopleroles_role_id) REFERENCES roles(roles_id)
);



# Section 11
# Populate peopleroles
# Person 1 is Developer 
# Person 2 is Boss, Mentor
# Person 3 is Developer and Team Lead
# Person 4 is Recruit
# person 5 is Recruit
# Person 6 is Developer and Designer
# Person 7 is Designer
# Person 8 is Designer and Team Lead
# Person 9 is Developer
# Person 10 is Developer and Designer


INSERT INTO peopleroles (peopleroles_people_id, peopleroles_role_id, peopleroles_date_assigned)
VALUES
    (1, 20, 20231201),   -- Person 1 is Developer
    (2, 50, 20231202),   -- Person 2 is Boss
    (2, 60, 20231202),   -- Person 2 is Mentor
    (3, 20, 20231203),   -- Person 3 is Developer
    (3, 40, 20231203),   -- Person 3 is Team Lead
    (4, 30, 20231204),   -- Person 4 is Recruit
    (5, 30, 20231205),   -- Person 5 is Recruit
    (6, 20, 20231206),   -- Person 6 is Developer
    (6, 10, 20231206),   -- Person 6 is Designer
    (7, 10, 20231207),   -- Person 7 is Designer
    (8, 10, 20231208),   -- Person 8 is Designer
    (8, 40, 20231208),   -- Person 8 is Team Lead
    (9, 20, 20231209),   -- Person 9 is Developer
    (10, 20, 20231210),  -- Person 10 is Developer
    (10, 10, 20231210);  -- Person 10 is Designer
