CREATE DATABASE Restaurant3
USE Restaurant3

CREATE TABLE Customer(
	CustomerID int IDENTITY(1,1),
	CustomerName varchar(40),
	PhoneNumber int,
	Area varchar(40),
	HouseNo int,
	StreetNo int,
PRIMARY KEY (CustomerID)
);


CREATE TABLE DeliveryBoy(
	DeliveryBoyID int,
	ContactNumber int,
	DBName varchar(40),
	Area varchar(40),
PRIMARY KEY (DeliveryBoyID)
);


CREATE TABLE Discount(
	DiscountID int,
	CustomerID int,
	DiscountStartDate date,
	DiscountEndDate date,
	DiscountAmount float,
PRIMARY KEY (DiscountID)
);


CREATE TABLE MenuItems(
	ItemID int,
	ItemName varchar(40),
	Quantity int,
	Price float,
	Category varchar(40),
PRIMARY KEY (ItemID)
);


CREATE TABLE OnlineOrder(
	OnlineOrderID int,
	CustomerID int,
	DeliveryBoyID int,
PRIMARY KEY (OnlineOrderID)
);


CREATE TABLE OrderItems(
	OrderID int,
	ItemID int,
	QuantityOrdered int,
PRIMARY KEY (OrderID, ItemID)
);


CREATE TABLE Orders(
	OrderID int,
	OrderDate date,
	OrderTime time(7),
	OrderStatus varchar(40),
	OrderType varchar(1),
PRIMARY KEY (OrderID)
);


CREATE TABLE Payment(
	PaymentID int,
	OrderID int,
	TotalAmount float,
	PaidAmount float,
	DiscountID int,
	PaymentMethod varchar(40),
PRIMARY KEY (PaymentID)
);


CREATE TABLE RTable(
	TableNo int,
	TableCapacity int,
	TableStatus varchar(40),
PRIMARY KEY (TableNo)
);


CREATE TABLE TableOrder(
	TableOrderID int,
	TableNo int,
PRIMARY KEY (TableOrderID)
);


ALTER TABLE Discount  WITH CHECK ADD FOREIGN KEY(CustomerID)
REFERENCES Customer (CustomerID)
ON UPDATE CASCADE
ON DELETE CASCADE
;
ALTER TABLE OnlineOrder  WITH CHECK ADD FOREIGN KEY(CustomerID)
REFERENCES Customer (CustomerID)
ON UPDATE CASCADE
ON DELETE CASCADE
;
ALTER TABLE OnlineOrder  WITH CHECK ADD FOREIGN KEY(DeliveryBoyID)
REFERENCES DeliveryBoy (DeliveryBoyID)
ON UPDATE CASCADE
ON DELETE CASCADE
;
ALTER TABLE OnlineOrder  WITH CHECK ADD FOREIGN KEY(OnlineOrderID)
REFERENCES Orders (OrderID)
ON UPDATE CASCADE
ON DELETE CASCADE
;
ALTER TABLE OrderItems  WITH CHECK ADD FOREIGN KEY(ItemID)
REFERENCES MenuItems (ItemID)
ON UPDATE CASCADE
ON DELETE CASCADE
;
ALTER TABLE OrderItems  WITH CHECK ADD FOREIGN KEY(OrderID)
REFERENCES Orders (OrderID)
ON UPDATE CASCADE
ON DELETE CASCADE
;
ALTER TABLE Payment  WITH CHECK ADD FOREIGN KEY(OrderID)
REFERENCES Orders (OrderID)
ON UPDATE CASCADE
ON DELETE CASCADE
;
ALTER TABLE Payment  WITH CHECK ADD FOREIGN KEY(DiscountID)
REFERENCES Discount (DiscountID)
ON UPDATE CASCADE
ON DELETE CASCADE
;
ALTER TABLE TableOrder  WITH CHECK ADD FOREIGN KEY(TableOrderID)
REFERENCES Orders (OrderID)
ON UPDATE CASCADE
ON DELETE CASCADE
;
ALTER TABLE TableOrder  WITH CHECK ADD FOREIGN KEY(TableNo)
REFERENCES RTable (TableNo)
ON UPDATE CASCADE
ON DELETE CASCADE
;

INSERT [dbo].[RTable] ([TableNo], [TableCapacity], [TableStatus]) VALUES (1, 2, N'Available')
INSERT [dbo].[RTable] ([TableNo], [TableCapacity], [TableStatus]) VALUES (2, 2, N'Available')
INSERT [dbo].[RTable] ([TableNo], [TableCapacity], [TableStatus]) VALUES (3, 4, N'Available')
INSERT [dbo].[RTable] ([TableNo], [TableCapacity], [TableStatus]) VALUES (4, 4, N'Available')
INSERT [dbo].[RTable] ([TableNo], [TableCapacity], [TableStatus]) VALUES (5, 4, N'Available')
INSERT [dbo].[RTable] ([TableNo], [TableCapacity], [TableStatus]) VALUES (6, 2, N'Available')
INSERT [dbo].[RTable] ([TableNo], [TableCapacity], [TableStatus]) VALUES (7, 2, N'Available')
INSERT [dbo].[RTable] ([TableNo], [TableCapacity], [TableStatus]) VALUES (8, 6, N'Available')
INSERT [dbo].[RTable] ([TableNo], [TableCapacity], [TableStatus]) VALUES (9, 6, N'Reserved')
INSERT [dbo].[RTable] ([TableNo], [TableCapacity], [TableStatus]) VALUES (10, 6, N'Reserved')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [OrderTime], [OrderStatus], [OrderType]) VALUES (1000700, CAST(N'2021-05-03' AS Date), CAST(N'12:10:00' AS Time), N'Done', N'T')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [OrderTime], [OrderStatus], [OrderType]) VALUES (1000701, CAST(N'2021-05-04' AS Date), CAST(N'14:25:00' AS Time), N'Done', N'O')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [OrderTime], [OrderStatus], [OrderType]) VALUES (1000702, CAST(N'2021-05-04' AS Date), CAST(N'16:40:00' AS Time), N'Done', N'O')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [OrderTime], [OrderStatus], [OrderType]) VALUES (1000703, CAST(N'2021-05-06' AS Date), CAST(N'18:55:00' AS Time), N'Done', N'O')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [OrderTime], [OrderStatus], [OrderType]) VALUES (1000704, CAST(N'2021-05-07' AS Date), CAST(N'21:10:00' AS Time), N'Done', N'O')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [OrderTime], [OrderStatus], [OrderType]) VALUES (1000705, CAST(N'2021-05-07' AS Date), CAST(N'23:25:00' AS Time), N'Done', N'T')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [OrderTime], [OrderStatus], [OrderType]) VALUES (1000706, CAST(N'2021-05-07' AS Date), CAST(N'13:40:00' AS Time), N'Done', N'T')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [OrderTime], [OrderStatus], [OrderType]) VALUES (1000707, CAST(N'2021-05-10' AS Date), CAST(N'15:53:00' AS Time), N'Done', N'O')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [OrderTime], [OrderStatus], [OrderType]) VALUES (1000708, CAST(N'2021-05-11' AS Date), CAST(N'18:06:00' AS Time), N'Done', N'O')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [OrderTime], [OrderStatus], [OrderType]) VALUES (1000709, CAST(N'2021-05-12' AS Date), CAST(N'20:19:00' AS Time), N'Done', N'O')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [OrderTime], [OrderStatus], [OrderType]) VALUES (1000710, CAST(N'2021-05-13' AS Date), CAST(N'22:32:00' AS Time), N'Done', N'O')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [OrderTime], [OrderStatus], [OrderType]) VALUES (1000711, CAST(N'2021-05-14' AS Date), CAST(N'19:15:00' AS Time), N'Done', N'O')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [OrderTime], [OrderStatus], [OrderType]) VALUES (1000712, CAST(N'2021-05-15' AS Date), CAST(N'18:30:00' AS Time), N'Done', N'T')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [OrderTime], [OrderStatus], [OrderType]) VALUES (1000713, CAST(N'2021-05-16' AS Date), CAST(N'17:15:00' AS Time), N'Done', N'T')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [OrderTime], [OrderStatus], [OrderType]) VALUES (1000714, CAST(N'2021-05-18' AS Date), CAST(N'18:30:00' AS Time), N'Done', N'T')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [OrderTime], [OrderStatus], [OrderType]) VALUES (1000715, CAST(N'2021-05-19' AS Date), CAST(N'11:50:00' AS Time), N'Done', N'T')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [OrderTime], [OrderStatus], [OrderType]) VALUES (1000716, CAST(N'2021-05-20' AS Date), CAST(N'14:03:00' AS Time), N'Done', N'T')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [OrderTime], [OrderStatus], [OrderType]) VALUES (1000717, CAST(N'2021-05-22' AS Date), CAST(N'16:16:00' AS Time), N'Preparing', N'T')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [OrderTime], [OrderStatus], [OrderType]) VALUES (1000718, CAST(N'2021-05-22' AS Date), CAST(N'17:29:00' AS Time), N'Preparing', N'T')
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [OrderTime], [OrderStatus], [OrderType]) VALUES (1000719, CAST(N'2021-05-22' AS Date), CAST(N'18:39:00' AS Time), N'Preparing', N'O')
INSERT [dbo].[TableOrder] ([TableOrderID], [TableNo]) VALUES (1000700, 1)
INSERT [dbo].[TableOrder] ([TableOrderID], [TableNo]) VALUES (1000705, 2)
INSERT [dbo].[TableOrder] ([TableOrderID], [TableNo]) VALUES (1000706, 7)
INSERT [dbo].[TableOrder] ([TableOrderID], [TableNo]) VALUES (1000712, 3)
INSERT [dbo].[TableOrder] ([TableOrderID], [TableNo]) VALUES (1000713, 4)
INSERT [dbo].[TableOrder] ([TableOrderID], [TableNo]) VALUES (1000714, 1)
INSERT [dbo].[TableOrder] ([TableOrderID], [TableNo]) VALUES (1000715, 5)
INSERT [dbo].[TableOrder] ([TableOrderID], [TableNo]) VALUES (1000716, 8)
INSERT [dbo].[TableOrder] ([TableOrderID], [TableNo]) VALUES (1000717, 8)
INSERT [dbo].[TableOrder] ([TableOrderID], [TableNo]) VALUES (1000718, 5)
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [PhoneNumber], [Area], [HouseNo], [StreetNo]) VALUES (1001518, N'Sarah Ahmed', 1113182882, N'Garden City', 75, 13)
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [PhoneNumber], [Area], [HouseNo], [StreetNo]) VALUES (1001812, N'Mohamed Taleb', 1050765996, N'Ramses', 52, 50)
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [PhoneNumber], [Area], [HouseNo], [StreetNo]) VALUES (1002145, N'Abdelrahman Radi', 1047429353, N'Zamalek', 21, 19)
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [PhoneNumber], [Area], [HouseNo], [StreetNo]) VALUES (1002353, N'Nada Elmeleegi', 1033991783, N'Shubra', 42, 9)
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [PhoneNumber], [Area], [HouseNo], [StreetNo]) VALUES (1002435, N'Omar Elsebaaii', 1059065421, N'6th October', 32, 21)
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [PhoneNumber], [Area], [HouseNo], [StreetNo]) VALUES (1002547, N'Shady George', 1186456535, N'Garden City', 1, 35)
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [PhoneNumber], [Area], [HouseNo], [StreetNo]) VALUES (1003256, N'Laila Shaaban', 1104711991, N'Maadi', 5, 63)
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [PhoneNumber], [Area], [HouseNo], [StreetNo]) VALUES (1003258, N'Kamal ElDosoki', 1174122818, N'Zamalek', 69, 21)
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [PhoneNumber], [Area], [HouseNo], [StreetNo]) VALUES (1003524, N'Jasmine Lotfy', 1193012339, N'Agouza', 155, 25)
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [PhoneNumber], [Area], [HouseNo], [StreetNo]) VALUES (1004200, N'Tawfik Magdy', 1095218269, N'Ramses', 32, 10)
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [PhoneNumber], [Area], [HouseNo], [StreetNo]) VALUES (1004257, N'Shereen Ismail', 1171846574, N'5th Settlement', 20, 177)
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [PhoneNumber], [Area], [HouseNo], [StreetNo]) VALUES (1004752, N'Sandy Latif', 1058722230, N'Garden City', 15, 63)
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [PhoneNumber], [Area], [HouseNo], [StreetNo]) VALUES (1004879, N'Ramy Abdelhaleem', 1044044710, N'Maadi', 17, 95)
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [PhoneNumber], [Area], [HouseNo], [StreetNo]) VALUES (1005412, N'Mai Ahmed', 1170362951, N'5th Settlement', 96, 21)
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [PhoneNumber], [Area], [HouseNo], [StreetNo]) VALUES (1005787, N'Mohieeldin Saber', 1016198411, N'Ramses', 36, 155)
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [PhoneNumber], [Area], [HouseNo], [StreetNo]) VALUES (1005798, N'Tarek Abdullah', 1089849232, N'Nasr City', 255, 74)
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [PhoneNumber], [Area], [HouseNo], [StreetNo]) VALUES (1006969, N'Bahaa Ahmad', 1207533022, N'6th October', 147, 15)
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [PhoneNumber], [Area], [HouseNo], [StreetNo]) VALUES (1009857, N'Basma Emad', 1029432304, N'Garden City', 20, 6)
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [PhoneNumber], [Area], [HouseNo], [StreetNo]) VALUES (1009898, N'Wael Emad', 1032325800, N'Heliopolis', 32, 17)
INSERT [dbo].[Discount] ([DiscountID], [CustomerID], [DiscountStartDate], [DiscountEndDate], [DiscountAmount]) VALUES (88886, 1004200, CAST(N'2021-05-01' AS Date), CAST(N'2021-06-01' AS Date), 0.25)
INSERT [dbo].[Discount] ([DiscountID], [CustomerID], [DiscountStartDate], [DiscountEndDate], [DiscountAmount]) VALUES (88887, 1005798, CAST(N'2020-12-01' AS Date), CAST(N'2021-02-01' AS Date), 0.2)
INSERT [dbo].[Discount] ([DiscountID], [CustomerID], [DiscountStartDate], [DiscountEndDate], [DiscountAmount]) VALUES (88888, 1002145, CAST(N'2021-04-01' AS Date), CAST(N'2021-06-01' AS Date), 0.3)
INSERT [dbo].[Discount] ([DiscountID], [CustomerID], [DiscountStartDate], [DiscountEndDate], [DiscountAmount]) VALUES (88889, 1003524, CAST(N'2021-01-01' AS Date), CAST(N'2021-02-01' AS Date), 0.15)
INSERT [dbo].[Payment] ([PaymentID], [OrderID], [TotalAmount], [PaidAmount], [DiscountID], [PaymentMethod]) VALUES (9900011, 1000700, 225, 225, NULL, N'Cash')
INSERT [dbo].[Payment] ([PaymentID], [OrderID], [TotalAmount], [PaidAmount], [DiscountID], [PaymentMethod]) VALUES (9900012, 1000701, 64, 64, NULL, N'Cash')
INSERT [dbo].[Payment] ([PaymentID], [OrderID], [TotalAmount], [PaidAmount], [DiscountID], [PaymentMethod]) VALUES (9900013, 1000702, 148, 148, NULL, N'Card')
INSERT [dbo].[Payment] ([PaymentID], [OrderID], [TotalAmount], [PaidAmount], [DiscountID], [PaymentMethod]) VALUES (9900014, 1000703, 64, 44.8, 88888, N'Card')
INSERT [dbo].[Payment] ([PaymentID], [OrderID], [TotalAmount], [PaidAmount], [DiscountID], [PaymentMethod]) VALUES (9900015, 1000704, 54, 54, NULL, N'Cash')
INSERT [dbo].[Payment] ([PaymentID], [OrderID], [TotalAmount], [PaidAmount], [DiscountID], [PaymentMethod]) VALUES (9900016, 1000705, 44, 44, NULL, N'Card')
INSERT [dbo].[Payment] ([PaymentID], [OrderID], [TotalAmount], [PaidAmount], [DiscountID], [PaymentMethod]) VALUES (9900017, 1000706, 59, 59, NULL, N'Cash')
INSERT [dbo].[Payment] ([PaymentID], [OrderID], [TotalAmount], [PaidAmount], [DiscountID], [PaymentMethod]) VALUES (9900018, 1000707, 216, 216, NULL, N'Card')
INSERT [dbo].[Payment] ([PaymentID], [OrderID], [TotalAmount], [PaidAmount], [DiscountID], [PaymentMethod]) VALUES (9900019, 1000708, 74, 74, NULL, N'Cash')
INSERT [dbo].[Payment] ([PaymentID], [OrderID], [TotalAmount], [PaidAmount], [DiscountID], [PaymentMethod]) VALUES (9900020, 1000709, 158, 158, NULL, N'Card')
INSERT [dbo].[Payment] ([PaymentID], [OrderID], [TotalAmount], [PaidAmount], [DiscountID], [PaymentMethod]) VALUES (9900021, 1000710, 230.15, 230.15, NULL, N'Cash')
INSERT [dbo].[Payment] ([PaymentID], [OrderID], [TotalAmount], [PaidAmount], [DiscountID], [PaymentMethod]) VALUES (9900022, 1000711, 420, 420, NULL, N'Card')
INSERT [dbo].[Payment] ([PaymentID], [OrderID], [TotalAmount], [PaidAmount], [DiscountID], [PaymentMethod]) VALUES (9900023, 1000712, 78, 78, NULL, N'Cash')
INSERT [dbo].[Payment] ([PaymentID], [OrderID], [TotalAmount], [PaidAmount], [DiscountID], [PaymentMethod]) VALUES (9900024, 1000713, 54, 54, NULL, N'Cash')
INSERT [dbo].[Payment] ([PaymentID], [OrderID], [TotalAmount], [PaidAmount], [DiscountID], [PaymentMethod]) VALUES (9900025, 1000714, 48, 48, NULL, N'Card')
INSERT [dbo].[Payment] ([PaymentID], [OrderID], [TotalAmount], [PaidAmount], [DiscountID], [PaymentMethod]) VALUES (9900026, 1000715, 46.05, 46.05, NULL, N'Cash')
INSERT [dbo].[Payment] ([PaymentID], [OrderID], [TotalAmount], [PaidAmount], [DiscountID], [PaymentMethod]) VALUES (9900027, 1000716, 48, 48, NULL, N'Card')
INSERT [dbo].[Payment] ([PaymentID], [OrderID], [TotalAmount], [PaidAmount], [DiscountID], [PaymentMethod]) VALUES (9900028, 1000717, 35.75, 35.75, NULL, N'Card')
INSERT [dbo].[Payment] ([PaymentID], [OrderID], [TotalAmount], [PaidAmount], [DiscountID], [PaymentMethod]) VALUES (9900029, 1000718, 307, 307, NULL, N'Cash')
INSERT [dbo].[Payment] ([PaymentID], [OrderID], [TotalAmount], [PaidAmount], [DiscountID], [PaymentMethod]) VALUES (9900030, 1000719, 195.45, 195.45, NULL, N'Cash')
INSERT [dbo].[DeliveryBoy] ([DeliveryBoyID], [ContactNumber], [DBName], [Area]) VALUES (9020, 1069185713, N'Ismail Bahaaeldin', N'Garden City')
INSERT [dbo].[DeliveryBoy] ([DeliveryBoyID], [ContactNumber], [DBName], [Area]) VALUES (9102, 1033879067, N'Awad Eldsoki', N'Ramses')
INSERT [dbo].[DeliveryBoy] ([DeliveryBoyID], [ContactNumber], [DBName], [Area]) VALUES (9124, 1203671431, N'Awad Ahmed', N'Zamalek')
INSERT [dbo].[DeliveryBoy] ([DeliveryBoyID], [ContactNumber], [DBName], [Area]) VALUES (9145, 1026643850, N'Abdallah Mohamed', N'Shubra')
INSERT [dbo].[DeliveryBoy] ([DeliveryBoyID], [ContactNumber], [DBName], [Area]) VALUES (9235, 1164710205, N'Kamal Eldin', N'Maadi')
INSERT [dbo].[DeliveryBoy] ([DeliveryBoyID], [ContactNumber], [DBName], [Area]) VALUES (9258, 1141885872, N'Wessam Elnahlawy', N'Heliopolis')
INSERT [dbo].[DeliveryBoy] ([DeliveryBoyID], [ContactNumber], [DBName], [Area]) VALUES (9365, 1033115319, N'Nady Elsharkawy', N'Nasr City')
INSERT [dbo].[DeliveryBoy] ([DeliveryBoyID], [ContactNumber], [DBName], [Area]) VALUES (9410, 1018226275, N'Radi Marzouq', N'Rehab City')
INSERT [dbo].[DeliveryBoy] ([DeliveryBoyID], [ContactNumber], [DBName], [Area]) VALUES (9514, 1156589938, N'Michael Gerges', N'5th Settlement')
INSERT [dbo].[DeliveryBoy] ([DeliveryBoyID], [ContactNumber], [DBName], [Area]) VALUES (9520, 1204126990, N'Hanafy Elmenyawy', N'Haram')
INSERT [dbo].[DeliveryBoy] ([DeliveryBoyID], [ContactNumber], [DBName], [Area]) VALUES (9630, 1172925156, N'Abanoub Zaher', N'6th October')
INSERT [dbo].[DeliveryBoy] ([DeliveryBoyID], [ContactNumber], [DBName], [Area]) VALUES (9874, 1151589320, N'Fadi Bassam', N'Agouza')
INSERT [dbo].[OnlineOrder] ([OnlineOrderID], [CustomerID], [DeliveryBoyID]) VALUES (1000701, 1001518, 9124)
INSERT [dbo].[OnlineOrder] ([OnlineOrderID], [CustomerID], [DeliveryBoyID]) VALUES (1000702, 1001812, 9145)
INSERT [dbo].[OnlineOrder] ([OnlineOrderID], [CustomerID], [DeliveryBoyID]) VALUES (1000703, 1002145, 9124)
INSERT [dbo].[OnlineOrder] ([OnlineOrderID], [CustomerID], [DeliveryBoyID]) VALUES (1000704, 1002353, 9630)
INSERT [dbo].[OnlineOrder] ([OnlineOrderID], [CustomerID], [DeliveryBoyID]) VALUES (1000707, 1002435, 9124)
INSERT [dbo].[OnlineOrder] ([OnlineOrderID], [CustomerID], [DeliveryBoyID]) VALUES (1000708, 1002547, 9874)
INSERT [dbo].[OnlineOrder] ([OnlineOrderID], [CustomerID], [DeliveryBoyID]) VALUES (1000709, 1005787, 9410)
INSERT [dbo].[OnlineOrder] ([OnlineOrderID], [CustomerID], [DeliveryBoyID]) VALUES (1000710, 1003258, 9235)
INSERT [dbo].[OnlineOrder] ([OnlineOrderID], [CustomerID], [DeliveryBoyID]) VALUES (1000711, 1006969, 9102)
INSERT [dbo].[OnlineOrder] ([OnlineOrderID], [CustomerID], [DeliveryBoyID]) VALUES (1000719, 1009857, 9365)
INSERT [dbo].[MenuItems] ([ItemID], [ItemName], [Quantity], [Price], [Category]) VALUES (1, N'Sunny Side Up Eggs', 40, 35, N'Breakfast')
INSERT [dbo].[MenuItems] ([ItemID], [ItemName], [Quantity], [Price], [Category]) VALUES (2, N'Scrambled Egg', 45, 33, N'Breakfast')
INSERT [dbo].[MenuItems] ([ItemID], [ItemName], [Quantity], [Price], [Category]) VALUES (3, N'Omelette', 41, 33, N'Breakfast')
INSERT [dbo].[MenuItems] ([ItemID], [ItemName], [Quantity], [Price], [Category]) VALUES (4, N'Foul', 44, 24, N'Breakfast')
INSERT [dbo].[MenuItems] ([ItemID], [ItemName], [Quantity], [Price], [Category]) VALUES (5, N'Croissant', 49, 24, N'Breakfast')
INSERT [dbo].[MenuItems] ([ItemID], [ItemName], [Quantity], [Price], [Category]) VALUES (6, N'Pancakes', 67, 34, N'Breakfast')
INSERT [dbo].[MenuItems] ([ItemID], [ItemName], [Quantity], [Price], [Category]) VALUES (7, N'Italian Salad', 50, 54, N'Salad')
INSERT [dbo].[MenuItems] ([ItemID], [ItemName], [Quantity], [Price], [Category]) VALUES (8, N'Greek Salad', 41, 49, N'Salad')
INSERT [dbo].[MenuItems] ([ItemID], [ItemName], [Quantity], [Price], [Category]) VALUES (9, N'Chicken Cesar Salad', 42, 74, N'Salad')
INSERT [dbo].[MenuItems] ([ItemID], [ItemName], [Quantity], [Price], [Category]) VALUES (10, N'Tomato Soup', 48, 39, N'Soup')
INSERT [dbo].[MenuItems] ([ItemID], [ItemName], [Quantity], [Price], [Category]) VALUES (11, N'Soup Of The Day', 34, 54, N'Soup')
INSERT [dbo].[MenuItems] ([ItemID], [ItemName], [Quantity], [Price], [Category]) VALUES (12, N'Thai Noodles', 15, 44, N'Soup')
INSERT [dbo].[MenuItems] ([ItemID], [ItemName], [Quantity], [Price], [Category]) VALUES (13, N'Fried Calamari', 75, 64, N'Appetizers')
INSERT [dbo].[MenuItems] ([ItemID], [ItemName], [Quantity], [Price], [Category]) VALUES (14, N'Seafood Roll', 41, 74, N'Appetizers')
INSERT [dbo].[MenuItems] ([ItemID], [ItemName], [Quantity], [Price], [Category]) VALUES (15, N'Oriental Mezzeh', 2, 64, N'Appetizers')
INSERT [dbo].[MenuItems] ([ItemID], [ItemName], [Quantity], [Price], [Category]) VALUES (16, N'Turkey with Cheese', 46, 54, N'Sandwiches')
INSERT [dbo].[MenuItems] ([ItemID], [ItemName], [Quantity], [Price], [Category]) VALUES (17, N'Grilled Cheese', 8, 44, N'Sandwiches')
INSERT [dbo].[MenuItems] ([ItemID], [ItemName], [Quantity], [Price], [Category]) VALUES (18, N'Chicken Panne', 5, 59, N'Sandwiches')
INSERT [dbo].[MenuItems] ([ItemID], [ItemName], [Quantity], [Price], [Category]) VALUES (19, N'Alexandrian Liver', 14, 54, N'Sandwiches')
INSERT [dbo].[MenuItems] ([ItemID], [ItemName], [Quantity], [Price], [Category]) VALUES (20, N'Arrabiata', 32, 54, N'Pasta')
INSERT [dbo].[MenuItems] ([ItemID], [ItemName], [Quantity], [Price], [Category]) VALUES (21, N'Mushroom Penne', 19, 69, N'Pasta')
INSERT [dbo].[MenuItems] ([ItemID], [ItemName], [Quantity], [Price], [Category]) VALUES (22, N'Chicken Lasagna', 35, 84, N'Pasta')
INSERT [dbo].[MenuItems] ([ItemID], [ItemName], [Quantity], [Price], [Category]) VALUES (23, N'Chicken Negresco', 75, 79, N'Pasta')
INSERT [dbo].[MenuItems] ([ItemID], [ItemName], [Quantity], [Price], [Category]) VALUES (24, N'Seafood Spaghetti', 48, 114, N'Pasta')
INSERT [dbo].[MenuItems] ([ItemID], [ItemName], [Quantity], [Price], [Category]) VALUES (25, N'Margherita', 75, 59, N'Pizza')
INSERT [dbo].[MenuItems] ([ItemID], [ItemName], [Quantity], [Price], [Category]) VALUES (26, N'Vegetarian', 41, 69, N'Pizza')
INSERT [dbo].[MenuItems] ([ItemID], [ItemName], [Quantity], [Price], [Category]) VALUES (27, N'Mushroom', 42, 74, N'Pizza')
INSERT [dbo].[MenuItems] ([ItemID], [ItemName], [Quantity], [Price], [Category]) VALUES (28, N'Chicken', 39, 79, N'Pizza')
INSERT [dbo].[MenuItems] ([ItemID], [ItemName], [Quantity], [Price], [Category]) VALUES (29, N'Salmon', 35, 124, N'Pizza')
INSERT [dbo].[MenuItems] ([ItemID], [ItemName], [Quantity], [Price], [Category]) VALUES (30, N'Seafood', 14, 109, N'Pizza')
INSERT [dbo].[MenuItems] ([ItemID], [ItemName], [Quantity], [Price], [Category]) VALUES (31, N'Brownies', 15, 39, N'Desert')
INSERT [dbo].[MenuItems] ([ItemID], [ItemName], [Quantity], [Price], [Category]) VALUES (32, N'Tiramisu', 18, 49, N'Desert')
INSERT [dbo].[MenuItems] ([ItemID], [ItemName], [Quantity], [Price], [Category]) VALUES (33, N'Chocolate Cake', 17, 59, N'Desert')
INSERT [dbo].[MenuItems] ([ItemID], [ItemName], [Quantity], [Price], [Category]) VALUES (34, N'Cheesecake', 20, 48, N'Desert')
INSERT [dbo].[MenuItems] ([ItemID], [ItemName], [Quantity], [Price], [Category]) VALUES (35, N'Tea', 40, 15.35, N'Hot Drink')
INSERT [dbo].[MenuItems] ([ItemID], [ItemName], [Quantity], [Price], [Category]) VALUES (36, N'American Coffee S', 38, 35.75, N'Hot Drink')
INSERT [dbo].[MenuItems] ([ItemID], [ItemName], [Quantity], [Price], [Category]) VALUES (37, N'American Coffee L', 29, 55.75, N'Hot Drink')
INSERT [dbo].[MenuItems] ([ItemID], [ItemName], [Quantity], [Price], [Category]) VALUES (38, N'Espresso Single', 40, 47.45, N'Hot Drink')
INSERT [dbo].[MenuItems] ([ItemID], [ItemName], [Quantity], [Price], [Category]) VALUES (39, N'Espresso Double', 27, 68.35, N'Hot Drink')
INSERT [dbo].[MenuItems] ([ItemID], [ItemName], [Quantity], [Price], [Category]) VALUES (40, N'Green Tea', 42, 30.15, N'Hot Drink')
INSERT [dbo].[MenuItems] ([ItemID], [ItemName], [Quantity], [Price], [Category]) VALUES (41, N'Hot Chocolate', 33, 45.15, N'Hot Drink')
INSERT [dbo].[MenuItems] ([ItemID], [ItemName], [Quantity], [Price], [Category]) VALUES (42, N'Smoothie', 44, 50.75, N'Cold Drink')
INSERT [dbo].[MenuItems] ([ItemID], [ItemName], [Quantity], [Price], [Category]) VALUES (43, N'Milkshake', 41, 59.95, N'Cold Drink')
INSERT [dbo].[MenuItems] ([ItemID], [ItemName], [Quantity], [Price], [Category]) VALUES (44, N'Orange Juice', 12, 29.85, N'Cold Drink')
INSERT [dbo].[MenuItems] ([ItemID], [ItemName], [Quantity], [Price], [Category]) VALUES (45, N'Lemonade', 9, 25.65, N'Cold Drink')
INSERT [dbo].[MenuItems] ([ItemID], [ItemName], [Quantity], [Price], [Category]) VALUES (46, N'Fruit Juice', 33, 37.15, N'Cold Drink')
INSERT [dbo].[MenuItems] ([ItemID], [ItemName], [Quantity], [Price], [Category]) VALUES (47, N'Pepsi', 37, 18.15, N'Soft Drink')
INSERT [dbo].[MenuItems] ([ItemID], [ItemName], [Quantity], [Price], [Category]) VALUES (48, N'Sprite', 12, 18.15, N'Soft Drink')
INSERT [dbo].[MenuItems] ([ItemID], [ItemName], [Quantity], [Price], [Category]) VALUES (49, N'7up', 37, 18.15, N'Soft Drink')
INSERT [dbo].[MenuItems] ([ItemID], [ItemName], [Quantity], [Price], [Category]) VALUES (50, N'Redbull', 27, 45.5, N'Soft Drink')
INSERT [dbo].[MenuItems] ([ItemID], [ItemName], [Quantity], [Price], [Category]) VALUES (51, N'Water S', 75, 15, N'Water')
INSERT [dbo].[MenuItems] ([ItemID], [ItemName], [Quantity], [Price], [Category]) VALUES (52, N'Water L', 66, 30, N'Water')
INSERT [dbo].[OrderItems] ([OrderID], [ItemID], [QuantityOrdered]) VALUES (1000700, 10, 1)
INSERT [dbo].[OrderItems] ([OrderID], [ItemID], [QuantityOrdered]) VALUES (1000700, 11, 1)
INSERT [dbo].[OrderItems] ([OrderID], [ItemID], [QuantityOrdered]) VALUES (1000700, 12, 3)
INSERT [dbo].[OrderItems] ([OrderID], [ItemID], [QuantityOrdered]) VALUES (1000701, 13, 1)
INSERT [dbo].[OrderItems] ([OrderID], [ItemID], [QuantityOrdered]) VALUES (1000702, 14, 2)
INSERT [dbo].[OrderItems] ([OrderID], [ItemID], [QuantityOrdered]) VALUES (1000703, 15, 1)
INSERT [dbo].[OrderItems] ([OrderID], [ItemID], [QuantityOrdered]) VALUES (1000704, 16, 1)
INSERT [dbo].[OrderItems] ([OrderID], [ItemID], [QuantityOrdered]) VALUES (1000705, 17, 1)
INSERT [dbo].[OrderItems] ([OrderID], [ItemID], [QuantityOrdered]) VALUES (1000706, 18, 1)
INSERT [dbo].[OrderItems] ([OrderID], [ItemID], [QuantityOrdered]) VALUES (1000707, 19, 4)
INSERT [dbo].[OrderItems] ([OrderID], [ItemID], [QuantityOrdered]) VALUES (1000708, 27, 1)
INSERT [dbo].[OrderItems] ([OrderID], [ItemID], [QuantityOrdered]) VALUES (1000709, 28, 2)
INSERT [dbo].[OrderItems] ([OrderID], [ItemID], [QuantityOrdered]) VALUES (1000710, 12, 2)
INSERT [dbo].[OrderItems] ([OrderID], [ItemID], [QuantityOrdered]) VALUES (1000710, 29, 1)
INSERT [dbo].[OrderItems] ([OrderID], [ItemID], [QuantityOrdered]) VALUES (1000710, 47, 1)
INSERT [dbo].[OrderItems] ([OrderID], [ItemID], [QuantityOrdered]) VALUES (1000711, 10, 1)
INSERT [dbo].[OrderItems] ([OrderID], [ItemID], [QuantityOrdered]) VALUES (1000711, 20, 1)
INSERT [dbo].[OrderItems] ([OrderID], [ItemID], [QuantityOrdered]) VALUES (1000711, 30, 3)
INSERT [dbo].[OrderItems] ([OrderID], [ItemID], [QuantityOrdered]) VALUES (1000712, 31, 2)
INSERT [dbo].[OrderItems] ([OrderID], [ItemID], [QuantityOrdered]) VALUES (1000713, 11, 1)
INSERT [dbo].[OrderItems] ([OrderID], [ItemID], [QuantityOrdered]) VALUES (1000714, 34, 1)
INSERT [dbo].[OrderItems] ([OrderID], [ItemID], [QuantityOrdered]) VALUES (1000715, 35, 3)
INSERT [dbo].[OrderItems] ([OrderID], [ItemID], [QuantityOrdered]) VALUES (1000716, 34, 1)
INSERT [dbo].[OrderItems] ([OrderID], [ItemID], [QuantityOrdered]) VALUES (1000717, 36, 1)
INSERT [dbo].[OrderItems] ([OrderID], [ItemID], [QuantityOrdered]) VALUES (1000718, 22, 1)
INSERT [dbo].[OrderItems] ([OrderID], [ItemID], [QuantityOrdered]) VALUES (1000718, 37, 4)
INSERT [dbo].[OrderItems] ([OrderID], [ItemID], [QuantityOrdered]) VALUES (1000719, 33, 2)
INSERT [dbo].[OrderItems] ([OrderID], [ItemID], [QuantityOrdered]) VALUES (1000719, 38, 1)
INSERT [dbo].[OrderItems] ([OrderID], [ItemID], [QuantityOrdered]) VALUES (1000719, 52, 1)