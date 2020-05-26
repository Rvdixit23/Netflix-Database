-- Create a new database called 'NETFLIX'
-- Connect to the 'master' database to run this snippet

DROP DATABASE IF EXISTS NETFLIX;
CREATE DATABASE NETFLIX;






\C NETFLIX

-- 1. Creation of the entities

-- Create a new table called 'ACCOUNTUSER'
-- Drop the table if it already exists
DROP TABLE IF EXISTS ACCOUNTUSER CASCADE;
-- Create the table in the specified schema
CREATE TABLE ACCOUNTUSER
(
    ACCOUNTUSERID INT NOT NULL PRIMARY KEY, -- primary key column
    FNAME VARCHAR(50) NOT NULL,
    LNAME VARCHAR(50), 
    EMAIL VARCHAR(50) NOT NULL UNIQUE,
    PASSWD VARCHAR(50) NOT NULL
);


-- Create a new table called 'PROFILE' in schema '
-- Drop the table if it already exists
DROP TABLE IF EXISTS PROFILE CASCADE;
-- Create the table in the specified schema
CREATE TABLE PROFILE
(
    PROFILEID INT NOT NULL PRIMARY KEY, -- primary key column
    PROFILENAME VARCHAR(20) NOT NULL,
    ACCOUNTUSERID INT NOT NULL,
    FOREIGN KEY (ACCOUNTUSERID) REFERENCES ACCOUNTUSER(ACCOUNTUSERID)
);


-- Create a new table called 'MEDIA' in schema '
-- Drop the table if it already exists
DROP TABLE IF EXISTS MEDIA CASCADE;
-- Create the table in the specified schema
CREATE TABLE MEDIA
(
    MEDIAID INT NOT NULL PRIMARY KEY, -- primary key column
    MEDIATITLE VARCHAR(50) NOT NULL,
    MEDIATYPE VARCHAR(50) NOT NULL,
    RELEASEYEAR INT,
    RATING INT,
    CONSTRAINT YEAR_RATING_VALUES CHECK (RELEASEYEAR>=1000 AND RATING>=0 AND RATING<=5),
    CONSTRAINT VERIFY_MEDIA_TYPE CHECK (MEDIATYPE='MOVIE' OR MEDIATYPE='SHOW')
);


-- Create a new table called 'CREATOR' in schema '
-- Drop the table if it already exists
DROP TABLE IF EXISTS CREATOR CASCADE;
-- Create the table in the specified schema
CREATE TABLE CREATOR
(
    CREATORID INT NOT NULL PRIMARY KEY, -- primary key column
    CREATORNAME VARCHAR(50) NOT NULL
);


-- Create a new table called 'GENRE' in schema '
-- Drop the table if it already exists
DROP TABLE IF EXISTS GENRE CASCADE;

-- Create the table in the specified schema
CREATE TABLE GENRE
(
    GENREID INT NOT NULL PRIMARY KEY, -- primary key column
    GENRENAME VARCHAR(50) NOT NULL UNIQUE
);


-- 2. Creation of the relationships

-- Create a new table called 'USERHISTORY' in schema '
-- Drop the table if it already exists
DROP TABLE IF EXISTS PROFILEHISTORY;
-- Create the table in the specified schema
CREATE TABLE PROFILEHISTORY
(
    PROFILEID INT,
    MEDIAID INT,
    PRIMARY KEY (PROFILEID, MEDIAID), -- Creation of a composite primary key
    FOREIGN KEY (PROFILEID) REFERENCES PROFILE(PROFILEID),
    FOREIGN KEY (MEDIAID) REFERENCES MEDIA(MEDIAID)
);


-- Create a new table called 'MEDIAGENRE' in schema '
-- Drop the table if it already exists
DROP TABLE IF EXISTS MEDIAGENRE;
-- Create the table in the specified schema
CREATE TABLE MEDIAGENRE
(
    MEDIAID INT, 
    GENREID INT,
    PRIMARY KEY (MEDIAID, GENREID), -- Creation of a composite primary key
    FOREIGN KEY (MEDIAID) REFERENCES MEDIA(MEDIAID),
    FOREIGN KEY (GENREID) REFERENCES GENRE(GENREID)
);


-- Create a new table called 'MEDIACREATOR' in schema '
-- Drop the table if it already exists
DROP TABLE IF EXISTS MEDIACREATOR;
-- Create the table in the specified schema
CREATE TABLE MEDIACREATOR
(
    MEDIAID INT, 
    CREATORID INT, 
    PRIMARY KEY (MEDIAID, CREATORID),
    FOREIGN KEY (MEDIAID) REFERENCES MEDIA(MEDIAID),
    FOREIGN KEY (CREATORID) REFERENCES CREATOR(CREATORID)
);

DROP TABLE IF EXISTS MEDIAVIEWS;
CREATE TABLE MEDIAVIEWS
(
    MEDIAID INT NOT NULL PRIMARY KEY,
    VIEWS INT NOT NULL,
    FOREIGN KEY (MEDIAID) REFERENCES MEDIA(MEDIAID),
    CONSTRAINT POSVIEWS CHECK (VIEWS >= 0)
);

CREATE OR REPLACE FUNCTION log_new_media_watch() RETURNS trigger AS
$BODY$
BEGIN
    IF EXISTS (SELECT 1 FROM MEDIAVIEWS WHERE MEDIAID=NEW.MEDIAID) THEN
        UPDATE MEDIAVIEWS SET VIEWS=VIEWS+1 WHERE MEDIAID=NEW.MEDIAID;
    END IF;
    IF NOT EXISTS (SELECT 1 FROM MEDIAVIEWS WHERE MEDIAID=NEW.MEDIAID) THEN
        INSERT INTO MEDIAVIEWS (MEDIAID, VIEWS)
        VALUES(NEW.MEDIAID, 1);
    END IF;
    RETURN NEW;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER log_new_media_watch
    AFTER INSERT
    ON PROFILEHISTORY
    FOR EACH ROW
    EXECUTE PROCEDURE log_new_media_watch();
-- 3. Insertion of values

-- 4. Simple query

-- -- List all the movies which have been seen by all profiles in one user
-- -- List all the actors who have starred in movies from two different genres


-- 5. Complex query

-- -- Find all the users who have seen a movie after some year from x genre directed by y 
-- -- Find all the users where at least one user in the profile has seen a movie by some actor



