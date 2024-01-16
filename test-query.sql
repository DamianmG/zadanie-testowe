-- Create schema
CREATE DATABASE IF NOT EXISTS books;
USE books;

-- Create tables
CREATE TABLE authors (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);

CREATE TABLE books (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100),
    publication_year INT,
    ISBN_number VARCHAR(20),
    author_id INT,
    FOREIGN KEY (author_id) REFERENCES authors(id)
);

CREATE TABLE reviews (
    id INT PRIMARY KEY AUTO_INCREMENT,
    rating INT CHECK (rating >= 1 AND rating <= 10),
    content TEXT,
    book_id INT,
    FOREIGN KEY (book_id) REFERENCES Books(id)
);

-- Insert dummy content
INSERT INTO authors (first_name, last_name) VALUES
('John', 'Doe'),
('Jane', 'Smith'),
('Robert', 'Johnson'),
('Alice', 'Brown'),
('David', 'Miller'),
('Emily', 'Davis'),
('Michael', 'Taylor'),
('Olivia', 'Clark'),
('Daniel', 'White'),
('Sophia', 'Hall');

INSERT INTO books (title, publication_year, ISBN_number, author_id) VALUES
('The Great Gatsby', 1925, '9780142437419', 1),
('To Kill a Mockingbird', 1960, '0061120081', 1),
('1984', 1949, '9780451524935', 1),
('Brave New World', 1932, '0060850523', 2),
('The Catcher in the Rye', 1951, '9780241950425', 2),
('Lord of the Flies', 1954, '9780571273577', 2),
('The Hobbit', 1937, '9780547928227', 2),
('The Lord of the Rings', 1954, '9780544003415', 3),
('Pride and Prejudice', 1813, '9780141199078', 3),
('Sense and Sensibility', 1811, '9780141199672', 4),
('The Da Vinci Code', 2003, '1400079179', 4),
('Angels & Demons', 2000, '074349346X', 4),
('The Shining', 1977, '9780307743657', 4),
('The Girl with the Dragon Tattoo', 2005, '0307949486', 5),
('The Girl Who Played with Fire', 2006, '0307269981', 5),
('The Hunger Games', 2008, '9780439023528', 5),
('Divergent', 2011, '9780062024039', 6),
('Insurgent', 2012, '9780062024053', 6),
('The Fault in Our Stars', 2012, '9780525478812', 6),
('Gone Girl', 2012, '9780307588364', 7),
('Sharp Objects', 2006, '9780307351487', 7),
('Dark Places', 2009, '9780307341570', 7),
('The Maze Runner', 2009, '9780385737951', 7),
('The Scorch Trials', 2010, '9780385738750', 7),
('The Death Cure', 2011, '9780385738781', 8),
('The Alchemist', 1988, '9780061122415', 9),
('Brida', 1990, '9780061122095', 9),
('Veronika Decides to Die', 1998, '9780061124266', 9),
('The Road', 2006, '9780307387899', 10),
('No Country for Old Men', 2005, '9780375706677', 10),
('Blood Meridian', 1985, '9780679728757', 10);


INSERT INTO reviews (rating, content, book_id) VALUES
(8, 'Great book!', 1),
(6, 'Interesting read.', 1),
(9, 'Highly recommended!', 2),
(7, 'Enjoyed it.', 2),
(5, 'Average content.', 3),
(8, 'Captivating storyline.', 3),
(7, 'Good mystery novel.', 4),
(9, 'Kept me guessing until the end.', 4),
(6, 'Useful for beginners.', 5),
(10, 'Must-read for coding enthusiasts.', 5),
(8, 'Artistic and informative.', 6),
(9, 'A masterpiece.', 6),
(5, 'Challenging concepts.', 7),
(10, 'Mind-blowing!', 7),
(7, 'Inspiring innovations.', 8),
(8, 'Thought-provoking.', 8),
(6, 'Insightful journey into history.', 9),
(9, 'Well-researched and engaging.', 9),
(7, 'Beautifully illustrated.', 10),
(8, 'Exploring the wonders of nature.', 10);
	
    