create tablespace TegarMa06910
datafile 'E:\Kuliah\Basis Data 2\TegarMa06910.dbf'
size 30M;

create user tegarma_06910
identified by tegar
default tablespace TegarMa06910
quota 30M on tegarma06910;


create table supplier
(
id_supplier    integer       not null,
nama_supplier    varchar2(25),
nama_sales varchar2(25),
no_telp       varchar2(13),
alamat        varchar2(100),
constraint PK_supplier primary key(id_supplier)
);

create table pembelian
(
id_pembelian 	integer 	not null,
id_supplier 	integer,
id_detail_pembelian 	integer,
username 	varchar2(10),
jumlah_pembelian 	number(3),
tgl_pembelian 	date,
constraint PK_pembelian primary key(id_pembelian)
);

create table us_er
(
username 	varchar2(10) 	not null,
id_pembelian 	integer,
id_penjualan 	integer,
password 	varchar2(10),
nama 	varchar2(25),
alamat 	varchar2(100),
no_tlp 	varchar(13),
constraint PK_us_er primary key(username)
);

create table penjualan
(
id_penjualan 	integer not null,
username 	varchar2(10),
jumlah_penjualan numeric(3),
tgl_penjualan 	date,
constraint PK_penjualan primary key(id_penjualan)
);

create table detail_penjualan
(
id_detail_penjualan 	integer not null,
id_barang integer,
id_penjualan integer,
jumlah numeric(3),
constraint PK_detail_penjualan primary key(id_detail_penjualan)
);

create table detail_pembelian
(
id_detail_pembelian integer not null,
id_pembelian integer,
total_pembelian numeric(3),
constraint PK_detail_pembelian primary key(id_detail_pembelian)
);

create table barang
(
id_barang integer not null,
id_kategori integer,
id_detail_pembelian integer,
nama_barang varchar2(25),
stok number(3),
harga number(7),
constraint PK_barang primary key(id_barang)
);

create table kategori_barang
(
id_kategori integer not null,
nama_kategori varchar2(25),
deskripsi varchar2(25),
constraint PK_kategori_barang primary key(id_kategori)
);


alter table pembelian
add constraint FK_id_supplier foreign key (id_supplier)
references supplier(id_supplier)
add constraint FK_id_detail_pembelian foreign key (id_detail_pembelian)
references detail_pembelian(id_detail_pembelian)
add constraint FK_username foreign key (username)
references us_er(username);

alter table us_er
add constraint FK_id_pembelian foreign key (id_pembelian)
references pembelian(id_pembelian)
add constraint FK_id_penjualan foreign key (id_penjualan)
references penjualan(id_penjualan);

alter table penjualan
add constraint FK_usernam foreign key (username)
references us_er(username);


alter table detail_penjualan
add constraint FK_barang foreign key (id_barang)
references barang(id_barang)
add constraint FK_id_penjuala foreign key (id_penjualan)
references penjualan(id_penjualan);


alter table barang
add constraint FK_kategori foreign key (id_kategori)
references kategori_barang(id_kategori)
add constraint FK_id_detail_pembelia foreign key (id_detail_pembelian)
references detail_pembelian(id_detail_pembelian);

create sequence id_supplier
minvalue 1
maxvalue 999
start with 1
increment by 1
cache 20;

alter table kategori_barang
rename column kategori to 06910_kategori;

alter table barang
add constraint UQ_barang UNIQUE (nama_barang);


alter table us_er
modify(no_tlp number(13));

insert into supplier (id_supplier, nama_supplier, nama_sales, no_telp, alamat) values(id_supplier.nextval,'INDOFOOD', 'Sujan', '123456789', 'Madura');
insert into supplier (id_supplier, nama_supplier, nama_sales, no_telp, alamat) values(id_supplier.nextval,'UNILIVEFR', 'Bejo', '123456789', 'Surabaya');
insert into supplier (id_supplier, nama_supplier, nama_sales, no_telp, alamat) values(id_supplier.nextval,'ORANG TUA', 'Dian', '123456789', 'Sidoarjo');
insert into supplier (id_supplier, nama_supplier, nama_sales, no_telp, alamat) values(id_supplier.nextval,'FABER CASTLE', 'Alim', '123456789', 'Malang');
insert into supplier (id_supplier, nama_supplier, nama_sales, no_telp, alamat) values(id_supplier.nextval,'STANDART', 'Fajar', '123456789', 'Pasuruan');


insert all
into kategori_barang(id_kategori, nama_kategori, deskripsi) values(1, 'Makanan', 'Makan')
into kategori_barang(id_kategori, nama_kategori, deskripsi) values(2, 'Pensil', 'Alat Tulis')
into kategori_barang(id_kategori, nama_kategori, deskripsi) values(3, 'Tipe-X', 'Alat Tulis')
into kategori_barang(id_kategori, nama_kategori, deskripsi) values(4, 'Buku', 'Buku')
into kategori_barang(id_kategori, nama_kategori, deskripsi) values(5, 'Bolpoin', 'Alat Tulis')
select 1 from dual;

insert all
into pembelian(id_pembelian, id_supplier, username, tgl_pembelian) values(1,1, 'Andi', to_date('01/01/2017','dd/mm/yyyy'))
into pembelian(id_pembelian, id_supplier, username, tgl_pembelian) values(2,2, 'Dwi', to_date('02/02/2017','dd/mm/yyyy'))
into pembelian(id_pembelian, id_supplier, username, tgl_pembelian) values(3,3, 'Tri', to_date('03/03/2017','dd/mm/yyyy'))
into pembelian(id_pembelian, id_supplier, username, tgl_pembelian) values(4,4, 'Budi', to_date('04/04/2017','dd/mm/yyyy'))
into pembelian(id_pembelian, id_supplier, username, tgl_pembelian) values(5,5, 'Hudi', to_date('05/05/2017','dd/mm/yyyy'))
select 1 from dual;

insert all 
into detail_pembelian(id_detail_pembelian, id_pembelian, total_pembelian) values(1,1,20)
into detail_pembelian(id_detail_pembelian, id_pembelian, total_pembelian) values(2,2,30)
into detail_pembelian(id_detail_pembelian, id_pembelian, total_pembelian) values(3,3,40)
into detail_pembelian(id_detail_pembelian, id_pembelian, total_pembelian) values(4,4,50)
into detail_pembelian(id_detail_pembelian, id_pembelian, total_pembelian) values(5,5,60)
select 1 from dual;

insert all 
into penjualan(id_penjualan, username, tgl_penjualan) values(1,'Andi', to_date('01/02/2017','dd/mm/yyyy'))
into penjualan(id_penjualan, username, tgl_penjualan) values(2,'Dwi', to_date('02/03/2017','dd/mm/yyyy'))
into penjualan(id_penjualan, username, tgl_penjualan) values(3,'Tri', to_date('03/04/2017','dd/mm/yyyy'))
into penjualan(id_penjualan, username, tgl_penjualan) values(4,'Budi', to_date('04/05/2017','dd/mm/yyyy'))
into penjualan(id_penjualan, username, tgl_penjualan) values(5,'Hudi', to_date('05/06/2017','dd/mm/yyyy'))
select 1 from dual;

insert all
into detail_penjualan(id_detail_penjualan, id_barang, id_penjualan, jumlah) values(1,1,1,3)
into detail_penjualan(id_detail_penjualan, id_barang, id_penjualan, jumlah) values(2,2,2,3)
into detail_penjualan(id_detail_penjualan, id_barang, id_penjualan, jumlah) values(3,3,3,5)
into detail_penjualan(id_detail_penjualan, id_barang, id_penjualan, jumlah) values(4,4,4,2)
into detail_penjualan(id_detail_penjualan, id_barang, id_penjualan, jumlah) values(5,5,5,8)
select 1 from dual;

insert all
into barang(id_barang, id_kategori, id_detail_pembelian, nama_barang, stok, harga) values(1,1,1,'Nasi Goreng', 20, 5000)
into barang(id_barang, id_kategori, id_detail_pembelian, nama_barang, stok, harga) values(2,2,2,'Faber Castle 2B', 30, 2000)
into barang(id_barang, id_kategori, id_detail_pembelian, nama_barang, stok, harga) values(3,3,3,'Kenko', 40, 3000)
into barang(id_barang, id_kategori, id_detail_pembelian, nama_barang, stok, harga) values(4,4,4,'Sinar Dunia', 50, 1500)
into barang(id_barang, id_kategori, id_detail_pembelian, nama_barang, stok, harga) values(5,5,5,'PILOT', 60, 2500)
select 1 from dual;

insert all
into pengguna(username, password, nama, alamat , no_tlp) values('Andi','andi', 'andi', 'Sidoarjo','123456789')
into pengguna(username, password, nama, alamat , no_tlp) values('Dwi', 'dwi', 'dwi', 'Jombang','123456789')
into pengguna(username, password, nama, alamat , no_tlp) values('Tri', 'tri', 'tri', 'Mojokert','123456789')
into pengguna(username, password, nama, alamat , no_tlp) values('Budi', 'budi', 'budi', 'Surabaya','123456789')
into pengguna(username, password, nama, alamat , no_tlp) values('Hudi', 'hudi', 'hudi', 'Madiun','123456789')
select 1 from dual;

update supplier set alamat = 'Suramadu'
where no_telp = '123456789';

update supplier set nama_sales = 'Hudi'
where nama_sales ='Budi' AND alamat = 'Suramadu' or id_supplier = 1;

update pengguna set alamat = 'Madura'
where nama like'h%';

Delete from detail_penjualan Where id_detail_penjualan < 3 OR jumlah = ‘5’; 

savepoint sp1;
update supplier set nama_sales = 'Hudi'
where nama_sales ='Budi' AND alamat = 'Suramadu' or id_supplier = 1;
rollback to sp1;
commit

select * from supplier
order by nama_sales asc;

select nama_sales
from supplier
group by nama_sales;


insert into supplier (id_supplier, nama_supplier, nama_sales, no_telp, alamat) values(6,'Kraft Foods.', 'Aditya', '123456789', 'Bogor');
insert into supplier (id_supplier, nama_supplier, nama_sales, no_telp, alamat) values(7,'Nestlé S.A', 'Andy', '123456789', 'Depok');
insert into supplier (id_supplier, nama_supplier, nama_sales, no_telp, alamat) values(8,'Procter', 'Pratama', '123456789', 'Sukabumi');
insert into supplier (id_supplier, nama_supplier, nama_sales, no_telp, alamat) values(9,'Johnson', 'Nur', '123456789', 'Tasikmalaya');
insert into supplier (id_supplier, nama_supplier, nama_sales, no_telp, alamat) values(10,'SIDU', 'Malik', '123456789', 'Cirebon');

insert all
into pengguna(username, password, nama, alamat , no_tlp) values('Bayu','bayu', 'bayu', 'Batu','123456789')
into pengguna(username, password, nama, alamat , no_tlp) values('Bambang', 'bambang', 'bambang', 'Tegal','123456789')
into pengguna(username, password, nama, alamat , no_tlp) values('Hafidz', 'hafidz', 'hafidz', 'Mojokerto','123456789')
into pengguna(username, password, nama, alamat , no_tlp) values('Anwar', 'anwar', 'anwar', 'Surabaya','123456789')
into pengguna(username, password, nama, alamat , no_tlp) values('Putra', 'putra', 'putra', 'Madiun','123456789')
select 1 from dual;

insert all
into kategori_barang(id_kategori, nama_kategori, deskripsi) values(6, 'Jangka', 'Alat Tulis')
into kategori_barang(id_kategori, nama_kategori, deskripsi) values(7, 'Gunting', 'Alat Tulis')
into kategori_barang(id_kategori, nama_kategori, deskripsi) values(8, 'Kertas', 'Alat Tulis')
into kategori_barang(id_kategori, nama_kategori, deskripsi) values(9, 'Penggaris', 'Alat Tulis')
into kategori_barang(id_kategori, nama_kategori, deskripsi) values(10, 'Pakaian Sekolah', 'Keperluan Sekolah')
select 1 from dual;

insert all
into pembelian(id_pembelian, id_supplier, username, tgl_pembelian) values(6,6, 'Bayu', to_date('06/06/2017','dd/mm/yyyy'))
into pembelian(id_pembelian, id_supplier, username, tgl_pembelian) values(7,7, 'Bambang', to_date('07/07/2017','dd/mm/yyyy'))
into pembelian(id_pembelian, id_supplier, username, tgl_pembelian) values(8,8, 'Hafidz', to_date('08/08/2017','dd/mm/yyyy'))
into pembelian(id_pembelian, id_supplier, username, tgl_pembelian) values(9,9, 'Anwar', to_date('09/09/2017','dd/mm/yyyy'))
into pembelian(id_pembelian, id_supplier, username, tgl_pembelian) values(10,10, 'Putra', to_date('10/10/2017','dd/mm/yyyy'))
select 1 from dual;

insert all 
into detail_pembelian(id_detail_pembelian, id_pembelian, total_pembelian) values(6,6,60)
into detail_pembelian(id_detail_pembelian, id_pembelian, total_pembelian) values(7,7,50)
into detail_pembelian(id_detail_pembelian, id_pembelian, total_pembelian) values(8,8,40)
into detail_pembelian(id_detail_pembelian, id_pembelian, total_pembelian) values(9,9,30)
into detail_pembelian(id_detail_pembelian, id_pembelian, total_pembelian) values(10,10,20)
select 1 from dual;

insert all
into barang(id_barang, id_kategori, id_detail_pembelian, nama_barang, stok, harga) values(6,6,6,'Joyko', 60, 5000)
into barang(id_barang, id_kategori, id_detail_pembelian, nama_barang, stok, harga) values(7,7,7,'IKEA', 50, 7000)
into barang(id_barang, id_kategori, id_detail_pembelian, nama_barang, stok, harga) values(8,8,8,'SIDU', 40, 1000)
into barang(id_barang, id_kategori, id_detail_pembelian, nama_barang, stok, harga) values(9,9,9,'Butterfly', 30, 2500)
into barang(id_barang, id_kategori, id_detail_pembelian, nama_barang, stok, harga) values(10,10,10,'Purnama', 20, 10000)
select 1 from dual;

insert all 
into penjualan(id_penjualan, username, tgl_penjualan) values(6,'Bayu', to_date('01/02/2017','dd/mm/yyyy'))
into penjualan(id_penjualan, username, tgl_penjualan) values(7,'Dwi', to_date('02/03/2017','dd/mm/yyyy'))
into penjualan(id_penjualan, username, tgl_penjualan) values(8,'Anwar', to_date('03/04/2017','dd/mm/yyyy'))
into penjualan(id_penjualan, username, tgl_penjualan) values(9,'Putra', to_date('04/05/2017','dd/mm/yyyy'))
into penjualan(id_penjualan, username, tgl_penjualan) values(10,'Hudi', to_date('05/06/2017','dd/mm/yyyy'))
select 1 from dual;

insert all
into detail_penjualan(id_detail_penjualan, id_barang, id_penjualan, jumlah) values(6,6,6,8)
into detail_penjualan(id_detail_penjualan, id_barang, id_penjualan, jumlah) values(7,7,7,5)
into detail_penjualan(id_detail_penjualan, id_barang, id_penjualan, jumlah) values(8,8,8,2)
into detail_penjualan(id_detail_penjualan, id_barang, id_penjualan, jumlah) values(9,9,9,10)
into detail_penjualan(id_detail_penjualan, id_barang, id_penjualan, jumlah) values(10,10,10,8)
select 1 from dual;


select max(total_pembelian) as BARANG_MASUK_TERBANYAK, min(total_pembelian) as BARANG_MASUK_TERKECIL
from detail_pembelian;

select id_detail_pembelian, count(id_detail_pembelian) as BANYAK_TRANSAKSI
from detail_pembelian where id_detail_pembelian = 5 AND total_pembelian = 60
group by id_detail_pembelian;

select sum(jumlah) as total_item
from detail_penjualan;


select avg(jumlah) as rata_rata_pembelian, sum(jumlah) as total_item
from detail_penjualan;


insert all
into supplier (id_supplier, nama_supplier, nama_sales, no_telp, alamat) values(11,'Foods', 'Raft', '123456789', 'Depok')
into supplier (id_supplier, nama_supplier, nama_sales, no_telp, alamat) values(12,'Nescafe', 'Budi', '123456789', 'Surabaya')
into supplier (id_supplier, nama_supplier, nama_sales, no_telp, alamat) values(13,'Proud', 'Tom', '123456789', 'Jakarta')
into supplier (id_supplier, nama_supplier, nama_sales, no_telp, alamat) values(14,'Short', 'Deri', '123456789', 'Tasngerang')
into supplier (id_supplier, nama_supplier, nama_sales, no_telp, alamat) values(15,'Drop', 'Lucy', '123456789', 'Bekasi')
select 1 from dual;

insert all
into pengguna(username, password, nama, alamat , no_tlp) values('Jon','jon', 'jon', 'Surabaya','123456789')
into pengguna(username, password, nama, alamat , no_tlp) values('Asep', 'asep', 'asep', 'Mojokerto','123456789')
into pengguna(username, password, nama, alamat , no_tlp) values('Bobby', 'bobby', 'bobby', 'Mojokerto','123456789')
into pengguna(username, password, nama, alamat , no_tlp) values('Ve', 've', 've', 'Surabaya','123456789')
into pengguna(username, password, nama, alamat , no_tlp) values('Bonar', 'bonar', 'bonar', 'Madiun','123456789')
select 1 from dual;

insert all
into kategori_barang(id_kategori, nama_kategori, deskripsi) values(11, 'Topi', 'Keperluan Sekolah')
into kategori_barang(id_kategori, nama_kategori, deskripsi) values(12, 'Minuman', 'Minum')
into kategori_barang(id_kategori, nama_kategori, deskripsi) values(13, 'Jilbab', 'Keperluan Sekolah')
into kategori_barang(id_kategori, nama_kategori, deskripsi) values(14, 'Dasi', 'Keperluan Sekolah')
into kategori_barang(id_kategori, nama_kategori, deskripsi) values(15, 'Penghapus', 'Alat Tulis')
select 1 from dual;

insert all
into pembelian(id_pembelian, id_supplier, username, tgl_pembelian) values(11,1, 'Bayu', to_date('07/06/2017','dd/mm/yyyy'))
into pembelian(id_pembelian, id_supplier, username, tgl_pembelian) values(12,2, 'Bambang', to_date('08/07/2017','dd/mm/yyyy'))
into pembelian(id_pembelian, id_supplier, username, tgl_pembelian) values(13,3, 'Hafidz', to_date('09/08/2017','dd/mm/yyyy'))
into pembelian(id_pembelian, id_supplier, username, tgl_pembelian) values(14,4, 'Anwar', to_date('10/09/2017','dd/mm/yyyy'))
into pembelian(id_pembelian, id_supplier, username, tgl_pembelian) values(15,5, 'Putra', to_date('11/10/2017','dd/mm/yyyy'))
select 1 from dual;

insert all 
into detail_pembelian(id_detail_pembelian, id_pembelian, total_pembelian) values(11,1,10)
into detail_pembelian(id_detail_pembelian, id_pembelian, total_pembelian) values(12,2,10)
into detail_pembelian(id_detail_pembelian, id_pembelian, total_pembelian) values(13,3,10)
into detail_pembelian(id_detail_pembelian, id_pembelian, total_pembelian) values(14,4,10)
into detail_pembelian(id_detail_pembelian, id_pembelian, total_pembelian) values(15,5,10)
select 1 from dual;

insert all
into barang(id_barang, id_kategori, id_detail_pembelian, nama_barang, stok, harga) values(11,1,1,'Lumpia', 60, 5000)
into barang(id_barang, id_kategori, id_detail_pembelian, nama_barang, stok, harga) values(12,2,2,'Kenko', 50, 7000)
into barang(id_barang, id_kategori, id_detail_pembelian, nama_barang, stok, harga) values(13,3,3,'Kenko', 40, 1000)
into barang(id_barang, id_kategori, id_detail_pembelian, nama_barang, stok, harga) values(14,4,4,'Sinar', 30, 2500)
into barang(id_barang, id_kategori, id_detail_pembelian, nama_barang, stok, harga) values(15,5,5,'Pilot', 20, 1500)
select 1 from dual;

insert all 
into penjualan(id_penjualan, username, tgl_penjualan) values(11,'Bayu', to_date('01/02/2017','dd/mm/yyyy'))
into penjualan(id_penjualan, username, tgl_penjualan) values(12,'Dwi', to_date('02/03/2017','dd/mm/yyyy'))
into penjualan(id_penjualan, username, tgl_penjualan) values(13,'Anwar', to_date('03/04/2017','dd/mm/yyyy'))
into penjualan(id_penjualan, username, tgl_penjualan) values(14,'Putra', to_date('04/05/2017','dd/mm/yyyy'))
into penjualan(id_penjualan, username, tgl_penjualan) values(15,'Hudi', to_date('05/06/2017','dd/mm/yyyy'))
select 1 from dual;

insert all
into detail_penjualan(id_detail_penjualan, id_barang, id_penjualan, jumlah) values(11,1,1,2)
into detail_penjualan(id_detail_penjualan, id_barang, id_penjualan, jumlah) values(12,2,2,3)
into detail_penjualan(id_detail_penjualan, id_barang, id_penjualan, jumlah) values(13,3,3,4)
into detail_penjualan(id_detail_penjualan, id_barang, id_penjualan, jumlah) values(14,4,4,5)
into detail_penjualan(id_detail_penjualan, id_barang, id_penjualan, jumlah) values(15,5,5,6)
select 1 from dual;


select supplier.nama_supplier,supplier.nama_sales,(pembelian.tgl_pembelian) as tgl_pemasukan
from supplier JOIN 
pembelian
on supplier.id_supplier = pembelian.id_pembelian
where supplier.id_supplier <= 5;

select pembelian.username, detail_pembelian.total_pembelian, barang.nama_barang
from pembelian 
left join detail_pembelian
on pembelian.id_pembelian = detail_pembelian.id_detail_pembelian
left join barang 
on detail_pembelian.id_detail_pembelian = barang.id_barang
where rownum <= (select min(total_pembelian) from detail_pembelian);

select pembelian.username, detail_pembelian.total_pembelian, barang.nama_barang
from pembelian 
right join detail_pembelian
on pembelian.id_pembelian = detail_pembelian.id_detail_pembelian
right join barang 
on detail_pembelian.id_detail_pembelian = barang.id_barang
where rownum <= (select min(total_pembelian) from detail_pembelian)
or 
rownum >= (select max(total_pembelian) from detail_pembelian);

create view list_view1 as
select id_supplier, nama_sales, nama_supplier
from supplier
where id_supplier = 1;

update list_view1
set nama_sales = 'Fadd'
where nama_sales = 'Sujan';

create or replace view list_view2a as
select supplier.nama_supplier,supplier.nama_sales,pembelian.tgl_pembelian
from supplier JOIN 
pembelian
on supplier.id_supplier = pembelian.id_pembelian
where supplier.id_supplier <= 5;

create view list_view2b as
select pembelian.username, detail_pembelian.total_pembelian, barang.nama_barang
from pembelian 
left join detail_pembelian
on pembelian.id_pembelian = detail_pembelian.id_detail_pembelian
left join barang 
on detail_pembelian.id_detail_pembelian = barang.id_barang
where rownum <= (select min(total_pembelian) from detail_pembelian);

create or replace view list_view2c as
select pembelian.username, detail_pembelian.total_pembelian, barang.nama_barang
from pembelian 
right join detail_pembelian
on pembelian.id_pembelian = detail_pembelian.id_detail_pembelian
right join barang 
on detail_pembelian.id_detail_pembelian = barang.id_barang
where rownum <= (select min(total_pembelian) from detail_pembelian)
or rownum >= (select max(total_pembelian) from detail_pembelian);

update list_view2a
set tgl_pembelian = to_date('03/02/2017','dd/mm/yyyy')
where nama_sales = 'Fajar';