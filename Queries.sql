--IS610--JBVB TBA Team--Jing Bai, Vikas Bansal--Project part4
--Queries

/*Query 1 -- List stores closest to JIM TAYLOR*/
select store.street,store.city from user1,store where firstname = 'JIM' and lastname = 'TAYLOR' and user1.city = store.city;

/*Query 2 -- List total users with their AnnualSpent*/
select firstname,lastname,annualspent from user1;

/*Query 3 --View for List total users with their AnnualSpent--*/
create view name_spent as select firstname,lastname,annualspent from user1;

/*Query 4 -- Products having price less than 3 */
select * from product where price < 3

/*Query 5 --View--Products having price less than 3 */
create view cheap_products as select * from product where price < 3

/*Query 6 --Group by-- How many different categories of products we have right now?*/
select count(count(productcategoryid)) from product group by productcategoryid;
  
/*Query 7 --UNION-- Give name of users who are from laurel or have loaded more than one coupon*/
(select userid from user1 where city = 'Laurel')union(select userid from load l group by userid having count(userid)>1);

/*Query 8 --INTERSECT-- Give name of users who are from laurel and have AnnualSpent > 1000*/
(select username from user1 where city = 'Laurel')intersect (select username from user1 where AnnualSpent > 1000);

/*Query 9 --MINUS/View--  find number of coupons which are not yet validated*/
create view invalid_coupon as (select couponid from coupon) minus (select couponid from validate1);
select count(*) from invalid_coupon;

/*Query 10 --Aggregator Operator-- Total annual spent by all users*/
select sum(annualspent) from user1;

/*Query 11 --UNION-- List name of current users having loaded at least one coupon*/
select distinct lastname,firstname from user1 inner join load on load.userid = user1.userid order by firstname;





