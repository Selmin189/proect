/*Database table*/
CREATE TABLE cr_booking (
booking_id int identity NOT NULL,
booking_pickup_location varchar(11) NOT NULL,
booking_date datetime NOT NULL, 
booking_from_date datetime NOT NULL,
booking_to_date datetime NOT NULL, 
car_no varchar(11) NOT NULL,
user_id int NOT NULL,
booking_status text NOT NULL 
);

INSERT INTO cr_booking (booking_id, booking_pickup_location, booking_date, booking_from_date, booking_to_date, car_no, user_id, booking_status)
    VALUES  (1, 'Dallas', '2004-05-23T14:25:10', '2004-05-23T14:25:10', '2004-05-23T14:25:10', 'CA 13 DEF', 7, 'Successful'),
			(2, 'Irving', '2004-05-23T14:25:10', '2004-05-23T14:25:10', '2004-05-23T14:25:10', 'TX 15 RTY', 2, 'Successful'), 
			(3, 'Irving', '2004-05-23T14:25:10', '2004-05-23T14:25:10', '2004-05-23T14:25:10', 'TX 10 TR4', 2, 'Inprogress');


CREATE TABLE cr_car ( 
car_no varchar(255) NOT NULL,
mfg_id int NOT NULL, 
color_id int NOT NULL, 
year int NOT NULL, 
car_availableFl varchar(1) NOT NULL DEFAULT 'Y' );

INSERT INTO cr_car (car_no, mfg_id, color_id, year, car_availableFl) 
VALUES  ('Ap 10 AN 9608', 1, 1, 2011, 'N'), 
		('CA 10 AP 6789', 1, 1, 2016, 'Y'),
		('CA 13 DEF', 3, 2, 2015, 'Y'), 
		('DA 12 ABC', 2, 1, 2013, 'Y'), 
		('FL 88 DNO', 2, 3, 2016, 'Y'),
		('TX 02 THG', 2, 2, 2013, 'N'), 
		('TX 567 ED', 6, 2, 2015, 'Y'), 
		('TX 678 GH', 5, 4, 2012, 'N'), 
		('ww 12ww1234', 18, 1, 2016, 'Y'), 
		('XYZ123123', 2, 1, 2016, 'Y');

CREATE TABLE cr_car_location ( 
location_zip int NOT NULL, 
car_no varchar(255) NOT NULL 
);

INSERT INTO cr_car_location (location_zip, car_no) 
VALUES (75248, 'Ap 10 AN 9608'), 
(75248, 'CA 10 AP 6789'), 
(75248, 'CA 13 DEF'), 
(77032, 'ww 12ww1234'), 
(75248, 'XYZ123123');

CREATE TABLE cr_color ( 
color_id int NOT NULL,
color_name text NOT NULL 
);
INSERT INTO cr_color (color_id, color_name) VALUES (1, 'Red'), (2, 'Blue'), (3, 'Black'), (4, 'White');

CREATE TABLE cr_locations ( location_zip int NOT NULL,
location_city text NOT NULL, 
location_address text NOT NULL 
);
INSERT INTO cr_locations (location_zip, location_city, location_address) 
VALUES 
(75038, 'Irving', ' 4002 N Belt Line Rd, Irving, TX 75038'),
(75248, 'Austin', 'Austin, TX 78712'),
(75251, 'McCallum', 'McCallum Blvd'), 
(75252, 'Dallas', '800 W Campbell Rd, Richardson, TX 75080'),
(77032, 'Mouston', '2800 N Terminal Rd, Houston, TX 77032');

CREATE TABLE cr_mfg ( 
mfg_id int NOT NULL,
mfg_brand text NOT NULL,
mfg_model varchar(255) NOT NULL, 
mfg_rate int NOT NULL, 
size_id int NOT NULL 
);
INSERT INTO cr_mfg (mfg_id, mfg_brand, mfg_model, mfg_rate, size_id) 
VALUES 
(1, 'Toyota', 'Corolla', 15, 2), 
(2, 'Toyota', 'Camry', 16, 2), 
(3, 'Ford', 'Focus', 8, 1), 
(4, 'Honda', 'Fit', 8, 1), 
(5, 'BMW', 'X6', 15, 2); 

CREATE TABLE cr_payment ( 
payment_id int NOT NULL,
booking_id int NOT NULL,
payment_start_time datetime NOT NULL,
payment_end_time datetime NOT NULL, 
price decimal NOT NULL, 
payment_status text NOT NULL 
);
INSERT INTO cr_payment (payment_id, booking_id, payment_start_time, payment_end_time, price, payment_status) 
	VALUES (16, 1, '2016-12-05T08:11:03', '2016-12-05T08:11:03', 16, 'Successful'),
 		(17, 2, '2016-12-05 08:30:27', '2016-12-05T08:30:27', 0, 'Successful'),
		 (18, 4, '2016-12-05 09:14:55', '2016-12-05T09:14:55', 30, 'Successful');
CREATE TABLE cr_size ( 
size_id int NOT NULL,
size_detail varchar(255) NOT NULL 
);
INSERT INTO cr_size (size_id, size_detail) 
	VALUES (1, 'Hatchback'), (2, 'Sedan'), (3, 'SUV');

CREATE TABLE cr_user ( 
user_id int NOT NULL, 
user_firstname varchar(25) NOT NULL,
user_lastname varchar(25) NOT NULL, 
user_password varchar(250) NOT NULL, 
user_email varchar(200) NOT NULL, 
user_phone int NOT NULL, 
user_type text NOT NULL, 
user_license varchar(200) NOT NULL, 
user_available_fl tinyint NOT NULL 
);
INSERT INTO cr_user (user_id, user_firstname, user_lastname, user_password, user_email, user_phone, user_type, user_license, user_available_fl) 
	VALUES  (1, 'Shruti', 'Bidada', '$2y$10$MaRIPoW2fM5hbKP4FPQ2S.726tEWWRY5PGrAAKEQSN1sqEu/ByX52', 'shrutz19@gmail.com', 2147483647, 'customer', 'fdgfghrthth', 0),
			(2, 'Ashish', 'Mohapatra', '$2y$10$2zCN.RtWmp7d8v3W5IXFF.6TyT6b4FLNBnh1rYFWee69DD7nDnaNi', 'admin@digiashish.com', 2147483647, 'admin', 'sdfghj45678fgh', 0),
			(4, 'Vidya', 'Mani', '$2y$10$2zCN.RtWmp7d8v3W5IXFF.6TyT6b4FLNBnh1rYFWee69DD7nDnaNi', 'sm.vidya@gmail.com', 2147483647, 'admin', 'qwert12345', 0), 
			(5, 'Vidya', 'Mani1', '$2y$10$167PK3G/0GOcm1WypP.IXuJcYqL5lWYFl1zVp8MN7TaJI2CMjU73O', 'vidya@gmail.com', 2147483647, 'customer', 'qwert123451', 0), 
			(6, 'root', 'root','$2y$10$hQJKgNajVBqM3RS3Ovd2n.On7.enAMS1SVO3663sOYLGs1tzOionO', 'root@root.com', 2147483647, 'customer', '123abc123', 0), 
			(7, 'test1', 'test1', '$2y$10$yfe.NrrlWphEg2u2kc9PrO9Zk7caVV.J7kgbjYKJpYqJMeVLtDNzu', 'test1@gmail.com', 2147483647, 'customer', '1231233xyz', 0), 
			(8, 'test2', 'test2', '$2y$10$gZ23vfL2g3xwxNucHENUhOrsxJHj6gajXlNOto.Vof5GzeLN.3Wom', 'test2@gmail.com', 2147483647, 'customer', '123412345667789', 0);



INSERT INTO cr_payment (payment_id, booking_id, payment_start_time, payment_end_time, price, payment_status)
	VALUES (16, 1, '2016-12-05T08:11:03', '2016-12-05T08:11:03', 16, 'Successful'), (17, 2, '2016-12-05T08:30:27', '2016-12-05T08:30:27', 0, 'Successful'), (18, 4, '2016-12-05T09:14:55', '2016-12-05T09:14:55', 30, 'Successful');

		/*Primary key and FK*/

		 ALTER TABLE cr_booking ADD PRIMARY KEY (booking_id);

		ALTER TABLE cr_booking ADD CONSTRAINT FK_cr_booking_cr_user_user_id FOREIGN KEY (user_id) REFERENCES cr_user(user_id) ON DELETE CASCADE ON UPDATE CASCADE;



		ALTER TABLE cr_car ADD PRIMARY KEY (car_no);

		ALTER TABLE cr_color ADD PRIMARY KEY (color_id);

		ALTER TABLE cr_mfg ADD PRIMARY KEY (mfg_id);

		ALTER TABLE cr_mfg ADD CONSTRAINT FK_cr_mfg_cr_size_size_id foreign key (size_id) references cr_size(size_id);

		ALTER TABLE cr_car ADD CONSTRAINT FK_cr_car_color_color_id foreign key (color_id) references cr_color(color_id),
							constraint FK_cr_car_cr_mfg_mfg_id foreign key (mfg_id) references cr_mfg(mfg_id);

		ALTER TABLE cr_car_location ADD PRIMARY KEY (location_zip,car_no);

		ALTER TABLE cr_car_location ADD CONSTRAINT FK_cr_car_location_cr_car_car_no foreign key (car_no) references cr_car(car_no);

		ALTER TABLE cr_locations ADD PRIMARY KEY (location_zip);

		ALTER TABLE cr_size ADD PRIMARY KEY (size_id);

		ALTER TABLE cr_payment ADD PRIMARY KEY (payment_id);

		ALTER TABLE cr_user ADD PRIMARY KEY (user_id);
		
		ALTER TABLE cr_payment ADD CONSTRAINT FK_payment_booking FOREIGN KEY (booking_id) REFERENCES cr_booking (booking_id) ON DELETE CASCADE ON UPDATE CASCADE;

/*Procedure*/		
CREATE PROCEDURE GetCars
AS
BEGIN
	SELECT
		car_no,
		year,
		car_availableFl
	FROM
		cr_car
	ORDER BY year desc
END;

execute GetCars

CREATE PROCEDURE GetLocation
AS
BEGIN
	SELECT
		location_zip,
		location_city,
		location_address
	FROM
		cr_locations
	where location_zip = 75038;
END;

execute GetLocation

/*Trigger*/
drop table cr_carAudits

CREATE TABLE Cr_carAudits (
	ChangeID INT IDENTITY(1,1) PRIMARY KEY,
	car_no int not null,
	mfg_id INT NOT NULL,
	color_id INT NOT NULL,
	year INT NOT NULL,
	car_availableFl VARCHAR(1) NOT NULL,
	updated_at DATETIME NOT NULL,
	operation CHAR(3) NOT NULL,
	CHECK(operation = 'INS' or operation = 'DEL')
);
drop trigger trg_cr_car_audit;

CREATE TRIGGER trg_cr_car_audit
ON cr_car
AFTER INSERT, DELETE
AS
BEGIN
	SET NOCOUNT ON;
	INSERT INTO Cr_carAudits(
		car_no,
		mfg_id,
		color_id,
		year,
		car_availableFl,
		updated_at,
		operation
	)
	SELECT
		i.car_no,
		i.mfg_id,
		i.color_id,
		i.year,
		i.car_availableFl,
		GETDATE(),
		'INS'
	FROM
		inserted i
	UNION ALL
	SELECT
		d.car_no,
		d.mfg_id,
		d.color_id,
		d.year,
		d.car_availableFl,
		GETDATE(),
		'DEL'
	FROM
		deleted d;
END

select * from Cr_carAudits

insert into cr_car(
car_no,
mfg_id,
color_id,
year,
car_availableFl
)
values
(
1,
1,
1,
2000,
'N'
);
/*Functions*/
SELECT * FROM cr_payment;

select 
	AVG(price) AVERAGE_PRICE
FROM
	cr_payment;

select * from cr_booking

SELECT  
	COUNT(*) AS TOTAL_RESERVATION
FROM
	cr_booking;

select * from cr_car

SELECT year,	
		count(*) As total_car_by_year
from	
		cr_car
group by year
order by year;

SELECT  
	COUNT(*) AS TOTAL_Vehicles
FROM
	cr_car;

select * from cr_payment

select 
	max(price) max_amount
from
	cr_payment;


