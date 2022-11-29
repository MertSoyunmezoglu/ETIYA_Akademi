-- 1-) İstanbul ve Ankarada yaşayan müşterileri listeleyin

select ci.name as "Şehir", us.email, ind.first_name, ind.last_name  
from customers c
inner join individual_customers ind
on ind.id=c.id
inner join users us
on c.id=us.id
inner join addresses ad
on ad.user_id=us.id
inner join streets st
on ad.street_id=st.id
inner join districts di
on st.district_id=di.id
inner join towns t
on di.town_id = t.id
inner join cities ci
on t.city_id = ci.id
Where ci.name in('Ankara','İstanbul')

-- 2-) 100 TL ve 200 TL arasında bulunan ürünlerin isimleri ve fiyatlarını listeleyen sorgu
Select name, unit_price from products
where unit_price between 100 and 200


-- 3-) Şehirlerdeki müşteri sayısını getiren sorgu
select ci.name as "Şehir",count(*) "Müşteri Sayısı"   from customers c
inner join individual_customers ind
on ind.id=c.id
inner join users us
on c.id=us.id
inner join addresses ad
on ad.user_id=us.id
inner join streets st
on ad.street_id=st.id
inner join districts di
on st.district_id=di.id
inner join towns t
on di.town_id = t.id
inner join cities ci
on t.city_id = ci.id
group by ci.name  

-- 4-) Son üç siparişin ortalama fiyitanı getiren sorgu
 
select avg(total_price) from orders  
limit 3

-- 5-) Insert ile veri ekleme sorgusu
insert into 
addresses (user_id, street_id,title,address)
values ('1','1','İş Adresi','Ytü teknopark')

-- 6-) Hangi ürünün hangi kategoride olduğunu gösteren sorgu

select c.name as "Kategori",pr.name as "Ürün" from product_categories pc
inner join products pr
on pc.id=pr.id
inner join categories c
on c.id= pr.id
group by c.name,pr.name

-- 7-) ürünün fiyatını güncelleyen sorgu
update products set unit_price=175, image_url='https/product'
where unit_price=150


-- 8-) Seçilen içeriği silen sorgu
delete from delivery_options
where id=2

-- 9-) Baş harflerine göre sehir listesini getiren sorgu
select name from cities
where name
between 'A' and 'E'
order by name asc

-- 10-) Baş harflerine göre sehir listesini getiren sorgu
select sum(shipping_price) from baskets