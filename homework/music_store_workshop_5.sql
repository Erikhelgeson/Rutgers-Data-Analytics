--Task 1: Songs released in 2022 sorted by newest to oldest
SELECT title, release_date
FROM songs
WHERE SUBSTR(release_date, -2)='22'
ORDER BY release_date ASC;

--Task 2: Songs under 4 minutes with a popularity score over 80
SELECT title, duration_seconds, popularity_score
FROM songs
WHERE duration_seconds < 240 AND popularity_score > 80;

--Task 3: Which artist names start with "The?"
SELECT artist_name FROM artists
WHERE artist_name LIKE "The%";

--Task4: Premium Customers who joined in 2022
SELECT join_date, first_name, last_name, premium_member FROM customers
WHERE premium_member = 'TRUE' AND SUBSTR(join_date, -2) = '22';

--Task 5: Total Minutes of Music
SELECT (SUM(duration_seconds)/ 60.0) || ' Minutes' AS "Total Duration of All Songs"
FROM songs;

--Task 6: Top 5 Most Expensive Songs
SELECT songs.title, purchases.song_id, price FROM purchases
JOIN songs ON purchases.song_id = songs.song_id
ORDER BY price DESC
LIMIT 5;

--Task 7 [Step1]: Songs with popularity score > 90
SELECT song_id FROM songs
WHERE popularity_score > 90;

--Task7 [Step2]: Bringing in the purchases for most popular songs - NOTE: I pulled any info I thought might be helpful.
SELECT purchase_id,purchases.song_id,songs.title,songs.album,purchases.customer_id,purchases.purchase_date,price,songs.popularity_score
FROM purchases
JOIN songs ON purchases.song_id = songs.song_id
WHERE purchases.song_id IN (SELECT song_id from SONGS
WHERE popularity_score > 90)
ORDER BY SUBSTR(purchases.purchase_date,-2) ASC,
CAST(purchases.purchase_date AS INTEGER) ASC;

--TASK8: All purchases between January 1, 2023 and March 31, 2023
SELECT purchase_id,song_id,purchase_date
FROM purchases
WHERE SUBSTR(purchase_date,-2) = '23'
AND CAST(purchase_date AS INTEGER) BETWEEN 1 AND 3
ORDER BY purchase_date ASC, CAST(SUBSTR(purchase_date,INSTR(purchase_date, '/')+1) AS INTEGER) ASC;

--TASK9: Songs with the highest popularity over 90
SELECT song_id,title,popularity_score
FROM songs
WHERE popularity_score > 90
ORDER BY popularity_score DESC;