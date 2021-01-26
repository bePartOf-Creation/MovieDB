CREATE DATABASE MOVIE_DB;
USE MOVIE_DB;

CREATE TABLE actor(
	act_id   INTEGER NOT NULL AUTO_INCREMENT,
    act_fname  VARCHAR(20) NOT NULL,
    act_lname  VARCHAR(20) NOT NULL,
    act_gender VARCHAR(1) NOT NULL,
    CONSTRAINT ACTOR_pk PRIMARY KEY (act_id)
);
CREATE TABLE director(
	dir_id INTEGER NOT NULL AUTO_INCREMENT,
	dir_fname  VARCHAR(20) NULL,
    dir_lname  VARCHAR(20) NULL,
    CONSTRAINT DIRECTOR_pk PRIMARY KEY (dir_id)
);
CREATE TABLE movie(
	mov_id INTEGER NOT NULL AUTO_INCREMENT,
    mov_title VARCHAR(50) NULL,
    mov_year  INTEGER NOT NULL,
    mov_time  INTEGER NOT NULL,
    mov_lang  VARCHAR(50) NOT NULL,
    mov_dt_rel DATE NULL,
    mov_rel_country VARCHAR(5) NOT  NULL,
    CONSTRAINT MOVIE_pk PRIMARY KEY (mov_id)
);
CREATE TABLE reviewer(
	rev_id INTEGER NOT NULL AUTO_INCREMENT,
    rev_name VARCHAR(30) NULL,
    CONSTRAINT REVIEWER_pk PRIMARY KEY (rev_id)
);
CREATE TABLE genre(
	gen_id INTEGER NOT NULL AUTO_INCREMENT,
    gen_title VARCHAR(20) NOT NULL,
    CONSTRAINT GENRES_pk PRIMARY KEY (gen_id)
);
CREATE TABLE movie_genres(
	mov_id INTEGER NOT NULL AUTO_INCREMENT,
	gen_id INTEGER NOT NULL, 
    CONSTRAINT PRIMARY KEY (mov_id,gen_id),
    CONSTRAINT movie_fk FOREIGN KEY(mov_id)
						REFERENCES movie(mov_id),
    CONSTRAINT genres_fk FOREIGN KEY(gen_id)
						  REFERENCES genres(gen_id)                         
);

CREATE TABLE movie_direction(
	dir_id INTEGER NULL,
    mov_id INTEGER NULL,
    CONSTRAINT PRIMARY KEY (dir_id,mov_id),
    CONSTRAINT FK_DIRECTOR_MOVIE FOREIGN KEY (dir_id)
								REFERENCES director(dir_id),
     CONSTRAINT FK_MOVIE FOREIGN KEY (mov_id)
						 REFERENCES movie(mov_id)
    );
CREATE TABLE movie_cast(
	act_id   INTEGER NOT NULL AUTO_INCREMENT,
    mov_id   INTEGER NOT NULL,
    role     VARCHAR(30) NOT NULL,
    CONSTRAINT PRIMARY KEY (act_id,mov_id),
    CONSTRAINT FK_MOVIE_ACTOR FOREIGN KEY (act_id)
							  REFERENCES actor(act_id),
	CONSTRAINT FK_MOVIES FOREIGN KEY (mov_id)
						 REFERENCES movie(mov_id)
);

CREATE TABLE rating(
	mov_id INTEGER NOT NULL AUTO_INCREMENT,
    rev_id    INTEGER NOT NULL,
    rev_stars DOUBLE(2,1) NULL,
    num_o_ratings INTEGER NULL,
    CONSTRAINT PRIMARY KEY (mov_id,rev_id),
    CONSTRAINT fk_movie FOREIGN KEY(mov_id)
								REFERENCES movie(mov_id),
	CONSTRAINT FK_REVIEWER FOREIGN KEY (rev_id)
							REFERENCES reviewer(rev_id)
);

select * from director;
select * from movie;
select* from rating;

SELECT reviewer.rev_name,rev_stars
from reviewer join rating
on reviewer.rev_id = rating.rev_id 
where num_o_ratings IS NULL;

select * from movie_direction;
Select movie.mov_title,dir_fname,dir_lname
from (movie join movie_direction on movie.mov_id = movie_direction.mov_id)
join 
director on  movie_direction.dir_id = director.dir_id
and mov_title = 'Eyes Wide Shut';



select * from movie_direction;

select * from director;
select * from reviewer;
select* from movie;
-- SELECT  reviewer.rev_name from reviewer
-- UNION
-- (SELECT movie.mov_title from movie);


