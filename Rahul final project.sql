use sakila;
select* from actor;
/* task 1*/
select  concat(first_name,last_name) /* By using concat funtion we can combine first name and last name */
as  actors_full_name from actor ;  /* and using aliasing (as)  we can name the column */
-- Interpretation :- List of  actors with their  full names  

/* task 2(a) */
select  distinct(first_name) as firstname, -- by using distinct funtion we can find the unique first_names and asliasing the column 
count(first_name) as total_occurance  from actor  -- here we are going to count the total values from the values returned from group by  clause 
group by   first_name -- firstname we are going to group by on the  first_names  
order by total_occurance desc;   -- and we are going to  use orderby claues to order form biggest  to smallest (count) of total occurance 
-- Interpretation :-  list of actor's first  name and thier count of repeated  first  names 

/* task 2(b) */

select  distinct(first_name) as firstname, -- by using distinct funtion we can find the unique first_names and asliasing the column 
count(first_name) as total_occurance  from actor  -- here we are going to count the total values from the values returned from group by  clause 
group by  first_name -- firstname we are going to group by on the  first_names  
having total_occurance = 1 ;  -- these gives the first names where they have apperead only ones in our data set
-- Interpretation :-  list of actor's  first  name which are unique 

/* task 3(a) */
select  distinct(last_name) as lastname, -- by using distinct funtion we can find the unique last_names and asliasing the column 
count(last_name) as total_occurance  from actor  -- here we are going to count the total values from the values returned from group by  clause 
group by   last_name -- lastname we are going to group by on the  first_names  
order by total_occurance desc;   -- and we are going to  use orderby claues to order form biggest  to smallest (count) of total occurance 
-- Interpretation :-  list of actor's last name and thier count of repeated last names 

/* task 3(b) */
select distinct(last_name) from actor;  -- these shows the all uniques last_name from the actor table 
-- Interpretation :-  list of actors who's uniques last_name from the actor table 
/* task 4(a) */

select * from  film 
where  rating ='R' ;-- where we can filter the film which have 'R' ratings 
-- Interpretation :-  list  of films which are 'R' rated 

/* task 4(b) */
select * from  film 
where  rating !='R'; -- where we can filter the film which  doesnot have  'R' ratings 
-- Interpretation :-  list  of films which are not 'R' rated 

/* task 4 (c)*/
select * from  film 
where  rating ='PG-13';--  PG-13 rating is best suitable for the  audiance like children 
-- Interpretation :- films which are for the age group which is below 13 

-- task 5 (A) 
 select * from film 
where replacement_cost <=11;  -- filtering the columns where replacement cost is less than 11 
-- Interpretation :-   filtering the films  where the replacement cost is less than 11  

-- Task 5 (b)
 select * from film 
where replacement_cost  between 11 and 20 ; -- filtering the columns where replacemnt cost is between 11  and 20 
 -- Interpretation :-   filtering the films  where the replacement cost is between 11 to  20  
 
 -- Task 5 (c)
  select  * from film 
  order by replacement_cost desc; -- dsiplaying the records in decending order of the replacement_cost 
 -- Interpretation :-  sorting the Films with the highest replacement cost to lowest  replacement cost 
 
 -- Task 6 
 select  title,description,count(actor_id) actors  from film f -- choosing the  requried coloumns   and counting the  no of actors  in the film 
 join film_actor fc on f.film_id=fc.film_id-- joining film and film_actor 
 group by title,description -- grouping the  films title 
 order by actors  desc -- ordering the films from largest to smallest 
 limit 3 ;   -- this   clause help us to only take  top 3 rows form  the returned  data 
 -- Intrepretation :-  list of films which have highest no of actors 
 
 -- task 7 
 select  title from film 
 where  title like 'Q%' or title like 'K%'; -- By using like orperator we can filter out the title wherethey start with Q and K
-- Interpretation :- list of movies where they are staring with a Q or K 

-- Task 8 

Select concat(First_name, last_name) as Names_of_actors   from  actor a -- Displaying  names of actors 
join film_actor fc on a.actor_id=fc.actor_id -- joining the two tables by inner join 
 join film f on fc.film_id= f.film_id -- again joining the  two tables by inner oin 
 where title ='AGENT TRUMAN'; --  filtering the result by using where clause 
 -- Interpretation :- list of actors who worked in the AGENT TRUMAN movie 
 
 -- Task 9 
   select  f.title,f.description,c.name from film f -- displaying the title of the films 
   join film_category fc on fc.film_id =f.film_id -- Joining the two tables 
   join category c on  c.category_id=fc.category_id-- joning the two tables 
   where c.name='Family';-- filtering the result by using where clause 
   -- Interpretation :- list of movies which are  recomended for the family 
   
   -- Task 10 (a)
   
   select rating ,max(amount)as max_rent  , min(amount) as min_rent ,avg(amount )as avg_rent from film f -- selecting the required coloumns 
   join inventory i on i.film_id=f.film_id-- joining the tables by inner  
   join  rental r on r.inventory_id= i.inventory_id-- joining the tables by inner 
   join payment p on p.rental_id= r.rental_id-- joining the tables by inner 
   group by rating -- grouping  the result by ratings 
   order by avg_rent desc;-- sorting the tables from largest to smallest by avg rent 
   -- Interpretation :-  Rating wise thier maxmimum rent , minimum rent, avergae rent  PG-13 has the highest average _rent 
   
   -- Task 10(b)
   select f.title,count(r.rental_id)as rental_frequencies 
   from film f join inventory i on i.film_id=f.film_id-- joining the tables by inner  
   join  rental r on r.inventory_id= i.inventory_id-- joining the tables by inner 
   group by f.title -- grouping the result by title 
   order by rental_frequencies desc; -- sorting the table  by rental_frequencies 
   -- Interpretation :-   List of movies where they count  of them rented BUCKET BROTHERHOOD has the highest rental frequencies 
   
-- task 11
select  name ,avg(replacement_cost),avg(rental_rate),avg(replacement_cost)-avg(rental_rate) as total_cost from film f -- selecting  required columns and taking diffrence of average replacement cost and average rental cost 
join film_category fc on fc.film_id=f.film_id -- joining 2 tables 
join category c on fc.category_id=c.category_id-- joining 2 tables 
group by name -- grouping by the name category 
having total_cost > 15 --  filtering rows on the given condition 
order by total_cost  desc ; -- sorting the values form largest to lowest by using total _ cost column 
-- Interpretation :-    list of Category which have Total_ cost greater than 15 

-- task 12
select name, count(title) as total_count_movies  from film f 
join film_category fc on fc.film_id=f.film_id -- joining 2 tables 
join category c on fc.category_id=c.category_id-- joining 2 tables 
group by name -- grouping by the name category 
having total_count_movies  > 70 --  filtering rows on the given condition 
order by total_count_movies desc; -- sorting the values form largest to lowest by using total_count_movies column 
 -- Interpretation :-  sports and foreign  category have the  count of films greater than 70 


 

   



   