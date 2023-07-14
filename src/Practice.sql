--1 Суроо: Бардык продукталарды аларга тиешелүү дүкөн маалыматы менен бирге алыңыз.
select * from products p join stores s on p.store_id=s.id;

--2 Суроо: Белгилүү бир продукт боюнча комментарий берген кардарларды алыңыз.
select  product_id,full_name, client_id, description  from feedbacks f join clients c on f.client_id=c.id where product_id=1;

--3 Суроо: Бардык дүкөндөрдүн аталыштарын жана алардын Instagram туткаларын чыгарып алыңыз.
select name, instagram from stores ;

--4 Суроо: Белгилүү бир кардардын жалпы балансын толук аты менен бирге алыңыз.
select full_name, balance from clients;

--5 Суроо: Белгилүү бир категорияга тиешелүү бардык продукталарды алуу.
select c.id,p.name,c.name from products p join categories c on p.category_id=c.id where c.id=2;

--6 Суроо: Белгилүү бир суммадан ашык балансы бар кардарларды алыңыз.
select clients.id,full_name, balance from clients where balance>500;

--7 Суроо: Бардык пикирлер үчүн продукттун сүрөттөлүшүн жана кардардын толук атын чыгарып алыңыз.
select f.product_id, p.name,f.description, c.full_name from feedbacks f join products p on f.product_id=p.id join clients c on f.client_id=c.id;

--8 Суроо: Белгилүү бир продукт үчүн дүкөндөрдун дарегин алыңыз.
select p.name,s.name,s.address from products p join stores s on p.store_id=s.id where p.id=2 ;

--9 Суроо: Сатып алган кардарлардын электрондук почталарын чыгарып алыңыз.
select distinct c.full_name,c.email from feedbacks f join clients c on f.client_id=c.id join products p on f.product_id=p.id;

--10 Суроо: Белгилүү бир дүкөндө бардык продукталардын орточо баасын алыңыз.
select avg(p.price) as total_price  from products p join stores s on p.store_id=s.id  where s.id=7;

--11 Суроо: Бардык дүкөндөрдүн аталышын жана алардагы товарлардын санын алыңыз
select s.name, count(*) from products p full join stores s on p.store_id=s.id group by s.name;

--12 Суроо: Продукт аталыштарын жана алардын тиешелүү категорияларын алыңыз.
select c.name,p.name from products p full join categories c on p.category_id=c.id;

--13 Суроо: Белгилүү бир продуктуну сатып алган кардарларды алыңыз.
select c.full_name from product_client p join clients c on p.client_id=c.id join products pr on p.product_id=pr.id;

--14 Cуроо: Ар бир продукт үчүн сын-пикирлердин санын алыңыз.
select  p.name, count(*) from feedbacks f full join products p on f.product_id=p.id group by  f.product_id,p.name;

--15 Суроо: Дүкөн жана алардан сатып алган кардарлар тууралуу маалымат алыңыз.
select s.name as store_names,s.address as store_address,s.phone_number as store_contact,c.full_name as clients_name,c.phone_number as client_contact, c.balance as client_balance, c.email as client_email   from product_client pc join clients c on pc.client_id=c.id join products p on pc.product_id=p.id join stores s on p.store_id=s.id;

--16 Суроо: Белгилүү бир дүкөн үчүн товардын аталыштарын жана тиешелүү бааларды алыңыз.
select s.name, p.price, p.name as product_name from products p join stores s on p.store_id=s.id where s.id=2;

--17 Суроо: Тиешелүү кардар электрондук почта дареги менен бирге пикир алуу.
select c.full_name,c.email, f.description from feedbacks f join clients c on f.client_id=c.id where c.id=1;

--18 Суроо: Продукциялардын аталыштарын жана алар жөнүндө сын-пикирлердин санын билип алыңыз.
select p.name, f.description from feedbacks f join products p on f.product_id=p.id;

--19 Суроо: Дүкөндүн атын жана бул дүкөндөн сатып алган кардарлардын жалпы балансын алыңыз.
select s.name,c.full_name, avg(c.balance) as avg_balance, sum(c.balance) as sum_balance from product_client pc join clients c on pc.client_id=c.id join products p on pc.product_id=p.id join stores s on p.store_id=s.id group by s.name,c.full_name;

--20 Суроо: Продукт аталыштары менен бирге сын-пикирлерди берген кардарларды алыңыз.
select c.full_name, p.name, f.description from feedbacks f join products p on f.product_id=p.id join clients c on f.client_id=c.id;

--21 Суроо: Белгилүү бир категориядагы бардык продукталарды сатып алган кардарларды чыгарыңыз.
select c,p2 from clients c join feedbacks f on c.id = f.client_id join products p2 on f.product_id = p2.id join categories c2 on p2.category_id = c2.id where c2.name = 'car' ;

--22 Суроо: Дүкөндөрдүн аталыштарын жана ар бир дүкөндөн сатып алган кардарлардын орточо балансын алыңыз.
select s.name, avg(p.price) from product_client pc full join clients c on pc.client_id=c.id full join products p on pc.product_id=p.id join stores s on p.store_id=s.id group by p.store_id, s.name;

--23 Суроо: Белгилүү бир баадагы продукталарды сатып алган кардарларды чыгарыңыз.
select p.name,p.price, c.full_name  from product_client pc  join clients c on pc.client_id=c.id  join products p on pc.product_id=p.id join stores s on p.store_id=s.id where p.id=6 ;

--24 Суроо: Продукцияларды жана аларга тиешелүү комментарийлердин сүрөттөрүн алыңыз.
select p.name, f.image, f.description from feedbacks f join products p on f.product_id=p.id;

--25 Суроо: Бир нече продуктыларды сатып алган кардарларды чыгарыңыз.
select  c.full_name,c.id as client_id,count(pc.client_id) as sum_product from product_client pc join products p on pc.product_id=p.id join clients c on pc.client_id=c.id group by c.full_name, c.id having count(pc.client_id)>1 ;

--26 Суроо: Продукт аталыштарын жана алардын орточо комментарийлерин рейтингдерин алыңыз.
select p.name, count(f.product_id) from feedbacks f full join products p on f.product_id=p.id group by p.name;

--27 Суроо: Эң кымбат товарды сатып алган кардарларды чыгарыңыз.
select  c.full_name,p.price from product_client pc join products p on pc.product_id=p.id join clients c on pc.client_id=c.id  order by p.price desc limit 2;

--28 Суроо: Ар бир продукт үчүн продукт аталыштарын жана комментарийлердин жалпы санын алыңыз.
select p.name,count(product_id) as count_feedbacks from feedbacks f join products p on f.product_id=p.id group by p.name;

--29 Суроо: Белгилүү бир дүкөндөн продуктыларды сатып алган кардарларды чыгарып алыңыз.
select c.full_name,s.name from product_client pc join products p on pc.product_id=p.id join clients c on pc.client_id=c.id join stores s on p.store_id=s.id where s.id=7;

--30 Суроо: Комментарийлери жок продукталарды алыңыз.
select p.name from products p left join feedbacks f on p.id = f.product_id where f.id is null;
