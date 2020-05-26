-- Insert rows into table 'ACCOUNTUSER'
INSERT INTO ACCOUNTUSER
( -- columns to insert data into
 ACCOUNTUSERID,
 FNAME,
 LNAME,
 EMAIL,
 PASSWD
)
VALUES
( -- first row: values for the columns in the list above
 1, "A", "Bob", "A@mail.com", "qwertyA"
),
( -- second row: values for the columns in the list above
 2, "B", "Cob", "B@mail.com", "qwertyB"
),
( -- third row:
 3, "C", "Dob", "C@mail.com", "qwertyC"
)

-- Insert rows into table 'PROFILE'
INSERT INTO PROFILE
( -- columns to insert data into
 PROFILEID,
 PROFILENAME,
 ACCOUNTUSER
)
VALUES
-- first row: values for the columns in the list above
( 11, "A1", 1),
-- second row: values for the columns in the list above
( 12, "A2", 1),
( 13, "A3", 1),
( 14, "A4", 1),
( 15, "A5", 1),
( 21, "B1", 2),
( 22, "B2", 2),
( 23, "B3", 2),
( 24, "B4", 2),
( 25, "B5", 2),
( 31, "C1", 3),
( 32, "C3", 3),
( 33, "C3", 3),
( 34, "C4", 3),
( 35, "C5", 3)
-- Created 5 profiles for each of the 3 users

INSERT INTO MEDIA
(
 MEDIAID,
 MEDIATITLE,
 MEDIATYPE,
 RELEASEYEAR,
 RATING
)
VALUES
(1, "INCREDIBLES 2", "MOVIE", 2018, 4.2),
(2, "EXTRACTION", "MOVIE", 2006, 3.4),
(3, "THE GRINCH", "MOVIE", 2018, 3.0),
(4, "LOCKOUT", "MOVIE", 2012, 1.9),
(5, "MADAGASCAR", "MOVIE", 2005, 2.7),
(6, "DESPICABLE ME", "MOVIE", 2010, 4.0),
(7, "BACK TO THE FUTURE", "MOVIE", 1985, 4.8),
(8, "ZODIAC", "MOVIE", 2007, 4.5),
(9, "THE IRISHMAN", "MOVIE", 2019, 4.8),
(10, "EL CAMINO", "MOVIE", 2019, 4.5),
(11, "STRANGER THINGS", "SHOW", , 4.6),
(12, "MONEY HEIST", "SHOW", 2017, 4.5),
(13, "YOU", "SHOW", 2018, 4.5),
(14, "THE WITCHER", "SHOW", 2019, 3.8),
(15, "PEAKY BLINDERS", "SHOW", 2013, 4.6),
(16, "NARCOS", "SHOW", 2015, 4.5),
(17, "ALTERED CARBON", "SHOW", 2018, 3.8),
(18, "IRON FIST", "SHOW", 2017, 1.8),
(19, "BREAKING BAD", "SHOW", 2008, 4.8),
(20, "RICK AND MORTY", "SHOW", 2013, 4.7)

INSERT INTO CREATOR
(
 CREATORID,
 CREATORNAME,
 CREATORTYPE
)
-- ADD STUFF HERE
VALUES
(1, "BRAD BIRD"), -- INCREDIBLES 2
(2, "TIM CARLSON"), -- EXTRACTION
(3, "DR SEUSS"), -- THE GRINCH
(4, "STEPHEN SAINT"), -- LOCKOUT
(5, "TOM MCGRATH"), -- MADAGASCAR
(6, "SERGIO PABLOS"), -- DESPICABLE ME
(7, "BOB GALE"), -- BACK TO THE FUTURE
(8, "DAVID FINCHER"), -- ZODIAC
(9, "MARTIN SCORSESE"), -- THE IRISHMAN
(10, "VINCE GILLIGAN"), -- EL CAMINO
(11, "ROSS DUFFER"), -- STRANGER THINGS
(12, "ALEX PINA"), -- MONEY HEIST
(13, "SERA GAMBLE"), -- YOU
(14, "ANDRZEJ SAPKOWSKI"), -- THE WITCHER
(15, "STEVEN KNIGHT"), -- PEAKY BLINDERS
(16, "CHRIS BRANCATO"), -- NARCOS
(17, "LAETA KALOGRIDIS"), -- ALTERED CARBON
(18, "ROY THOMAS"), -- IRON FIST
(19, "VINCE GILLIGAN"), -- BREAKING BAD
(20, "JUSTIN ROILAND") -- RICK AND MORTY


INSERT INTO GENRE
(
 GENREID,
 GENRENAME
)
VALUES
(1, "DRAMA"),
(2, "ACTION"),
(3, "COMEDY"),
(4, "FAMILY"),
(5, "FICTION")