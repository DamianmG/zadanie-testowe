-- Zapisz zapytanie zwracające imiona i nazwiska autorów, wraz z liczbą napisanych przez nich książek.
SELECT 
    CONCAT(first_name, ' ', last_name) AS author_name,
    COUNT(books.id) AS number_of_books
FROM 
    authors
JOIN 
    books ON authors.id = books.author_id
GROUP BY 
    authors.id;


-- Zapisz zapytanie tworzące perspektywę (widok) zawierający 5ciu autorów, których średnia ocen wszystkich książek jest najwyższa.
CREATE VIEW top_authors_view AS
SELECT
    a.id AS author_id,
    CONCAT(a.first_name, ' ', a.last_name) AS author_name,
    AVG(r.rating) AS average_rating
FROM
    authors a
JOIN
    books b ON a.id = b.author_id
JOIN
    reviews r ON b.id = r.book_id
GROUP BY
    a.id, a.first_name, a.last_name
ORDER BY
    AVG(r.rating) DESC
LIMIT 5;
