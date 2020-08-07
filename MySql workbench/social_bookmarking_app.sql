show databases;
use social_bookmarking_app;

-- sql-select-queries

Select b.id, title, p.name, a.name, amazon_rating
from Book b, Publisher p, Author a, Book_Author ba
where b.publisher_id = p.id and b.id = ba.book_id
and ba.author_id = a.id;

-- GROUP BY

Select b.id, title, p.name, a.name, amazon_rating
from Book b, Publisher p, Author a, Book_Author ba
where b.publisher_id = p.id and b.id = ba.book_id
and ba.author_id = a.id
group by b.id;

Select b.id, title, p.name, GROUP_CONCAT(a.name
SEPARATOR ','), amazon_rating
from Book b, Publisher p, Author a, Book_Author ba
where b.publisher_id = p.id and b.id = ba.book_id
and ba.author_id = a.id
group by b.id;

-- Other queries:

-- HAVING CLAUSE (additional qualification in each group) & Aggregator Operator COUNT

Select b.id, title, p.name, GROUP_CONCAT(a.name
SEPARATOR ','), amazon_rating
from Book b, Publisher p, Author a, Book_Author ba
where b.publisher_id = p.id and b.id = ba.book_id
and ba.author_id = a.id
group by b.id
HAVING count(b.id) > 1;

-- ORDER BY:

Select b.id, title, p.name, GROUP_CONCAT(a.name
SEPARATOR ','), amazon_rating
from Book b, Publisher p, Author a, Book_Author ba
where b.publisher_id = p.id and b.id = ba.book_id
and ba.author_id = a.id
group by b.id
ORDER BY amazon_rating DESC;

Select b.id, title, p.name, GROUP_CONCAT(a.name
SEPARATOR ',') AS authors, amazon_rating
from Book b, Publisher p, Author a, Book_Author ba
where b.publisher_id = p.id and b.id = ba.book_id
and ba.author_id = a.id and amazon_rating >= 4.5
group by b.id
ORDER BY amazon_rating DESC;

Select b.id, title, p.name, GROUP_CONCAT(a.name
SEPARATOR ',') AS authors, amazon_rating
from Book b, Publisher p, Author a, Book_Author ba
where b.publisher_id = p.id and b.id = ba.book_id
and ba.author_id = a.id and amazon_rating >= 4.5 and
a.name like '%bloch'
group by b.id
ORDER BY amazon_rating DESC;