

-- WHERE
select *
from products
where name='Buzdolabı'

-- AND
select *
from products
where stock > 15
  and unit_price > 100;
  
-- OR
select *
from products
where stock > 25
   or unit_price > 1000;
   
-- NOT
select *
from products
where not stock > 25;

-- ORDER BY
select *
from products 
order by stock desc;
 
-- INSERT INTO
    insert
into products(name, unit_price, stock,description,image_url )
values ('Sweat', 200, 50,'Sweatshirt','https/sweat.img' )

-- UPDATE SET
update products
set stock = 40
where id = 5

-- DELETE FROM
delete
from sellers
where id = 8

-- MIN(), MAX()
select MIN(stock)
from products;
select MAX(stock)
from products;

-- COUNT() 
select count(*) as "Ürün Adedi"
from products;
-- SUM()
select sum(stock) as "Toplam Ürün Stok Adedi"
from products;
-- AVG()
select avg(stock)
from products;

-- LIKE 
--ürün isiminde 'e' geçen ürünleri getirir
select *
from products
where lower(name) 
like '%e%';
-- 4. harfi a olan ürünü getir
select *
from cities
where  name  
like '___a%';

--IN
select lower(name)
from cities
where name
in ('Ankara','Bursa','yalova')

--BETWEEN
select *
from cities
where id
between 30 and 40

-- GROUP BY
select category_id, count(*)
from product_categories
group by category_id

select category_id, id
from product_categories
group by category_id, id

-- HAVING
select category_id, count(*)
from product_categories
group by category_id
having count(*) > 1

-- Kategoride 1 den fazla olacak şekilde kaç adet ürün bulunduğunu bulan sorgu
select c.name as "Kategori", count(*) as "Ürün Sayısı"
from product_categories p
         inner join categories c
                    on p.category_id = c.id
group by c.name
having count(*) > 1
-- İÇ İÇE SORGULAR
-- Stok adedi en az olan ürünün adı
select name
from products
where stock = (select min(stock) from products);
-- Stok adedi ortalamanın üstünde olan ürünlerin adı
select name
from products
where stock > (select avg(stock) from products);

-- JOIN
-- INNER JOIN 
select   c.name
from product_categories p
         inner join categories c
                    on p.category_id = c.id

-- FULL OUTER JOIN
select *
from product_categories p
         full outer join categories c
                         on p.category_id = c.id
		full outer join products pr
                         on p.product_id = pr.id



