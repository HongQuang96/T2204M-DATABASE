create table Brand(
	Id varchar(20) primary key,
	BrandName varchar(100) not null,
	Address varchar(100) not null,
	PhoneNumber varchar(20) not null
);

create table Productss(
	IdProduct varchar(20) primary key,
	ProductName nvarchar(100) not null,
	DeScriptions nvarchar(255) not null,
	Unit nvarchar(50) not null,
	Price decimal(6,0) not null check(Price >= 0) default 0,
	Quantity int not null check(Quantity >= 0) default 0,
	IdBrand varchar(20) not null foreign key references Brand(Id)
);


--drop table Productss;
--drop table Brand;

--CREATE DATA
insert into Brand
values
('123', 'Asus', 'USA', '96543332'),
('124', 'Nokia', 'USA', '3983932987'),
('125', 'Samsung', 'Korea', '38273238');

insert into Productss
values
('PD001', N'Máy tính T450', N'Máy nhập cũ', N'Chiếc', 900, 10, '123'),
('PD002', N'Điện thoại Nokia5670', N'Điện thoại dang hot', N'Chiếc', 200, 200, '124'),
('PD003', N'Máy in Samsung450', N'Máy nhập cũ', N'Chiếc', 100, 10,'125');

--UPDATE
update Productss set Price = 1000 where IdProduct = 'PD001';

--READ
select * from Brand;
select ProductName, DeScriptions, Quantity, Unit, Price from Productss;

--CAC CAU LENH TRUY VAN
--4.a Hiển thị tất cả các hãng sản xuất.
select BrandName from Brand;

--4.b Hiển thị tất cả các sản phẩm.
select ProductName from Productss;
--5.a Liệt kê danh sách hãng theo thứ thự ngược với alphabet của tên.
select BrandName from Brand order by BrandName desc;

--5.b Liệt kê danh sách sản phẩm của cửa hàng theo thứ thự giá giảm dần.
select ProductName from Productss order by Price desc;

--5.c  Hiển thị thông tin của hãng Asus.
select * from Brand where Id = '123';

--5.d Liệt kê danh sách sản phẩm còn ít hơn 11 chiếc trong kho
select ProductName from Productss where Quantity > 11;

--5.e Liệt kê danh sách sản phẩm của hãng Asus
select ProductName from Productss where IdBrand = '123';

--6.a Số hãng sản phẩm mà cửa hàng có.
select count(*) as SoBrandMaCuaHangCo from Brand;

--6.b Số mặt hàng mà cửa hàng bán.
select count(*) as SoMatHangMaCuaHangBan from Productss;

--6.c Tổng số loại sản phẩm của mỗi hãng có trong cửa hàng.
select count(*) as Number, IdBrand
from Productss
group  by IdBrand;

--6.d  Tổng số đầu sản phẩm của toàn cửa hàng

select sum(Quantity) as TongSoSanPhamCuaHangCo from Productss;