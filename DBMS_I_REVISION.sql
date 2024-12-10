--LAB - 1

CREATE TABLE ARTISTS(ARTIST_ID INT,ARTIST_NAME VARCHAR(20))

INSERT INTO ARTISTS(ARTIST_ID,ARTIST_NAME) VALUES 
(1,'APARSHAKTI KHURANA'),
(2,'ED SHEERAN'),
(3,'SHREYA GHOSAL'),
(4,'ARIJIT SINGH'),
(5,'TANISHK BAGCHI')

SELECT * FROM ARTISTS

CREATE TABLE ALBUMS(ALBUM_ID INT,ALBUM_TITLE VARCHAR(20),ARTIST_ID INT,RELEASE_YEAR DATETIME)

INSERT INTO ALBUMS(ALBUM_ID,ALBUM_TITLE,ARTIST_ID,RELEASE_YEAR) VALUES
(1001,'ALBUM1',1,2019),
(1002,'ALBUM2',2,2015),
(1003,'ALBUM3',3,2018),
(1004,'ALBUM4',4,2020),
(1005,'ALBUM5',2,2020),
(1006,'ALBUM6',1,2009)

CREATE TABLE SONGS(SONG_ID INT,SONG_TITLE VARCHAR(20),DURATION DECIMAL(8,2),GENRE VARCHAR(20),ALBUM_ID INT)

INSERT INTO SONGS(SONG_ID,SONG_TITLE,DURATION,GENRE,ALBUM_ID) VALUES
(101,'ZAROOR',2.55,'FEEL GOOD',1001),
(102,'ESPRESSO',4.10,'RHYTHMIC',1002),
(103,'SHAYAD',3.20,'SAD',1003),
(104,'ROAR',4.05,'POP',1002),
(105,'EVERYBODY TALKS',3.35,'RHYTHMIC',1003),
(106,'DWAPRA',3.54,'DANCE',1002),
(107,'SA RE GA MA',4.20,'RHYTHMIC',1004),
(108,'TAUBA',4.05,'RHYTHMIC',1005),
(109,'PERFECT',4.23,'POP',1002),
(110,'GOOD LUCK',3.55,'RHYTHMIC',1004)


--Part – A

--1. Retrieve a unique genre of songs.
SELECT DISTINCT GENRE FROM SONGS

--2. Find top 2 albums released before 2010.
SELECT TOP 2 * FROM ALBUMS WHERE RELEASE_YEAR < 01-01-2019

--3. Insert Data into the Songs Table. (1245, ‘Zaroor’, 2.55, ‘Feel good’, 1005)
INSERT INTO SONGS VALUES (1245,'ZAROOR',2.55,'FEEL GOOD',1005)

SELECT * FROM SONGS

--4. Change the Genre of the song ‘Zaroor’ to ‘Happy’
UPDATE SONGS
SET SONG_TITLE='HAPPY'
WHERE SONG_TITLE='ZAROOR'

SELECT * FROM SONGS

--5. Delete an Artist ‘Ed Sheeran’
DELETE FROM ARTISTS WHERE ARTIST_NAME='ED SHEERAN'

SELECT * FROM SONGS

--6. Add a New Column for Rating in Songs Table. [Ratings decimal(3,2)]
ALTER TABLE SONGS ADD RATING DECIMAL(3,2)

SELECT * FROM SONGS

--7. Retrieve songs whose title starts with 'S'.
SELECT * FROM SONGS WHERE SONG_TITLE LIKE 'S%'

--8. Retrieve all songs whose title contains 'Everybody'.
SELECT * FROM SONGS WHERE SONG_TITLE LIKE '%EVERYBODY%'

--9. Display Artist Name in Uppercase.
SELECT UPPER(ARTIST_NAME) FROM ARTISTS

--10. Find the Square Root of the Duration of a Song ‘Good Luck’
SELECT SQRT(DURATION) FROM SONGS WHERE SONG_TITLE='GOOD LUCK'

--11. Find Current Date.
--SELECT DATE(DATETIME)

--12. Find the number of albums for each artist.
SELECT ARTIST_NAME,COUNT(ALBUM_TITLE) FROM ALBUMS AB LEFT JOIN ARTISTS AR ON AB.ARTIST_ID=AR.ARTIST_ID GROUP BY ARTIST_NAME

--13. Retrieve the Album_id which has more than 5 songs in it.
SELECT ALBUM_ID FROM SONGS GROUP BY ALBUM_ID HAVING COUNT(*)> 5

--14. Retrieve all songs from the album 'Album1'. (using Subquery)
SELECT * FROM SONGS WHERE ALBUM_ID = (SELECT ALBUM_ID FROM ALBUMS WHERE ALBUM_TITLE='ALBUM1')

--15. Retrieve all albums name from the artist ‘Aparshakti Khurana’ (using Subquery)
SELECT ALBUM_TITLE FROM ALBUMS WHERE ARTIST_ID IN (SELECT ARTIST_ID FROM ARTISTS WHERE ARTIST_NAME='APARSHAKTI KHURANA')

--16. Retrieve all the song titles with its album title.
SELECT ALBUM_TITLE,SONG_TITLE FROM SONGS INNER JOIN ALBUMS ON SONGS.ALBUM_ID=ALBUMS.ALBUM_ID

--17. Find all the songs which are released in 2020.
SELECT * FROM SONGS S INNER JOIN ALBUMS AB ON S.ALBUM_ID=AB.ALBUM_ID WHERE RELEASE_YEAR=2020

--18. Create a view called ‘Fav_Songs’ from the songs table having songs with song_id 101-105.
CREATE VIEW FAV_SONGS AS SELECT * FROM SONGS WHERE SONG_ID BETWEEN 101 AND 105

SELECT * FROM FAV_SONGS

--19. Update a song name to ‘Jannat’ of song having song_id 101 in Fav_Songs view.
UPDATE FAV_SONGS
SET SONG_TITLE='JANNAT'
WHERE SONG_ID=101

SELECT * FROM FAV_SONGS

--20. Find all artists who have released an album in 2020.
SELECT ARTIST_NAME FROM ARTISTS INNER JOIN ALBUMS ON ARTISTS.ARTIST_ID=ALBUMS.ARTIST_ID WHERE RELEASE_YEAR=2020

--21. Retrieve all songs by Shreya Ghoshal and order them by duration.
SELECT SONG_TITLE FROM SONGS S 
INNER JOIN ALBUMS AB ON S.ALBUM_ID=AB.ALBUM_ID 
INNER JOIN ARTISTS AR ON AB.ARTIST_ID=AR.ARTIST_ID 
WHERE ARTIST_NAME='SHREYA GHOSHAL' ORDER BY DURATION ASC


--Part – B

--22. Retrieve all song titles by artists who have more than one album.


--23. Retrieve all albums along with the total number of songs.


--24. Retrieve all songs and release year and sort them by release year.


--25. Retrieve the total number of songs for each genre, showing genres that have more than 2 songs.


--26. List all artists who have albums that contain more than 3 songs.


--Part – C

--27. Retrieve albums that have been released in the same year as 'Album4'


--28. Find the longest song in each genre


--29. Retrieve the titles of songs released in albums that contain the word 'Album' in the title.
--30. Retrieve the total duration of songs by each artist where total duration exceeds 15 minutes.