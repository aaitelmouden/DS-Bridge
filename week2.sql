-- Assignment SQL One to Many Relationships | SQL Workshop | Week2 Assignment
-- Question 1 : Videos table. Create one table to keep track of the videos.  This table should include a unique ID, the title of the video, the length in minutes, and the URL.  Populate the table with at least three related videos from YouTube or other publicly available resources.

DROP TABLE IF EXISTS videotrack;

CREATE TABLE `videos`.`videotrack` (
	  `ID` INT NOT NULL,
	  `vtitle` VARCHAR(100) NOT NULL,
	  `vlength` INT NOT NULL,
	  `vurl` VARCHAR(200) NOT NULL,
	  PRIMARY KEY (`ID`));


INSERT INTO videotrack(ID, vtitle,vlength,vurl)
VALUES (1, 'Can You Spot a Fake Rolex?', 6 ,'https://youtu.be/P_ZTqC2Yxxs');

INSERT INTO videotrack(ID, vtitle,vlength,vurl)
VALUES (2, 'How to tell if sunglasses are polarized in 3 SECONDS!',6, 'https://youtu.be/7KSWQAceo6g');

INSERT INTO videotrack(ID, vtitle,vlength,vurl)
VALUES (3, 'How To Spot A Fake iPhone',4,'https://youtu.be/HqCq8SvMWC4');

INSERT INTO videotrack(ID, vtitle,vlength,vurl)
VALUES (4, 'How to Find if Amazon Product has Fake Reviews',3,'https://youtu.be/UBe44VO6U5w');

SELECT * FROM videotrack;

-- Question 2: Create and populate Reviewers table.  Create a second table that provides at least two user reviews for each of at least two of the videos.  These should be imaginary reviews that include columns for the user’s name (“Asher ”, “ Cyd ”, etc.), the rating (which could be NULL, or a number between 0 and 5), and a short text review (“Loved it!”).  There should be a column that links back to the ID column in the table of videos.

DROP TABLE IF EXISTS vreviews;

CREATE TABLE `videos`.`vreviews` (
	  `username` VARCHAR(45) NOT NULL,
	  `rating` INT NOT NULL,
	  `reviews` VARCHAR(200) NULL,
	  `ID` INT NOT NULL,
	  PRIMARY KEY (`username`, `ID`));

INSERT INTO vreviews (ID, username, rating, reviews)
VALUES (1,'Edmundas Degys', '5', 'The Chinese : Thank you for the review ! We will try to improve !');

INSERT INTO vreviews (ID, username, rating, reviews)
VALUES (1, 'AWF Avila', 4, "I don't know why i am watching this, i can't even afford to buy fake rolex.");

INSERT INTO vreviews (ID, username, rating, reviews)
VALUES (3, 'Logan', 5, "It's an iPhone running android. I'm sold!");

INSERT INTO vreviews (ID, username, rating, reviews)
VALUES (2, 'Black stone', 4, "Those were a long 3 seconds.");

INSERT INTO vreviews (ID, username, rating, reviews)
VALUES (4, 'Ashton', 2, 'I found a pair of wireless earbuds that had 970 Five-Star reviews that were all posted the same day');

INSERT INTO vreviews (ID, username, rating, reviews)
VALUES (4, 'D81ful', 5, 'Amazon should start charging people $10 to post a review on a product.'); 

SELECT * FROM vreviews;

-- Question 3: eport on Video Reviews. Write a JOIN statement that shows information from both tables.
-- A left Join will be used to create a Join 

SELECT * FROM videotrack LEFT JOIN vreviews 
	ON videotrack.id = vreviews.id
ORDER BY videotrack.id;
