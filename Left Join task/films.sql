CREATE TABLE users(
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(255) DEFAULT  NULL,
    email VARCHAR(255) DEFAULT  NULL,
    password  VARCHAR(255) DEFAULT  NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE categories (
    id int PRIMARY KEY AUTO_INCREMENT,
    name varchar(50) DEFAULT null,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE films(
    id int PRIMARY KEY AUTO_INCREMENT,
    title varchar(200) DEFAULT null,
    description varchar(250) DEFAULT null,
    relase_date date,
   created_at timestamp DEFAULT CURRENT_TIMESTAMP,
    category_id int,
    FOREIGN KEY(category_id) REFERENCES categories(id)
);


CREATE table comments(
id int PRIMARY KEY AUTO_INCREMENT,
    film_id int ,
    user_id int,
    comment varchar(250) DEFAULT null,
    created_at timestamp DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY(film_id) REFERENCES films(id),
    FOREIGN KEY(user_id) REFERENCES users(id)
);

CREATE TABLE wishlist (
    id int PRIMARY KEY AUTO_INCREMENT,
    film_id int,
    user_id int,
    created_at timestamp DEFAULT CURRENT_TIMESTAMP,
    FOREIGN key(film_id) REFERENCES films(id),
    FOREIGN KEY(user_id) REFERENCES users(id)
);


INSERT INTO users(username ,email,password)
VALUES
('Rahide','rahideisgenderova67@gmail.com', 'rahide123'),
('Ramal','eisgenderov67@gmail.com', 'ra123'),
('Rahid','rahid56.com', 'rahid23');


INSERT INTO categories(name)
VALUES
('Fantasy'),
('Dram'),
('Comedy');



INSERT INTO films (title ,description,relase_date,category_id)
VALUES
("Harry Potter and the Philosopher's Stone ", "Summaries. An orphaned boy enrolls in a school of wizardry, where he learns the truth about himself, his family and the terrible evil that haunts the magical world. On his eleventh birthday, Harry Potter (Daniel Radcliffe) discovers that he is no ordinary boy.",'2001-11-16',1),
("The Lord of the Rings: The Fellowship of the Ring","Rings, a prologue titled Concerning Hobbits, and other matters, and the main narrative in Book I and Book II. This book helps the readers to understand the world of Hobbits.",'2001-11-19',1),
("Interstellar" ,"Interstellar is about Earth's last chance to find a habitable planet before a lack of resources causes the human race to go extinct. The film's protagonist is Cooper (Matthew McConaughey), a former NASA pilot who is tasked with leading a mission through a wormhole to find a habitable planet in another galaxy.",'2014-11-07', 2)



INSERT INTO comments(film_id , user_id,comment)
VALUES
(2,1,'So cool '),
(1,3,'Not bad'),
(3,2,'Fantastic');

INSERT INTO wishlist(film_id,user_id)
VALUES
(2,3),
(3,3),
(2,1),
(1,1);




SELECT films.title AS film_title, categories.name AS category_name
FROM films
LEFT JOIN categories ON films.category_id = categories.id;




SELECT comments.*, users.username FROM 
comments LEFT JOIN users ON comments.user_id = users.id 
WHERE comments.film_id = 3;


SELECT films.title AS film_title, films.relase_date, categories.name AS category_name 
FROM wishlist LEFT JOIN films ON wishlist.film_id = films.id 
LEFT JOIN categories ON films.category_id = categories.id;


SELECT comments.comment, users.username
FROM comments
LEFT JOIN users ON comments.user_id = users.id;

