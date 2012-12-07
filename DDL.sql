--IS610--JBVB TBA Team--Jing Bai, Vikas Bansal--Project part4
--Create tables

create table Store
	(StoreID	number(10)		not null,
    Street		varchar2(50) 	not null,
    City      	varchar2(15) 	not null,
    State     	varchar2(10)  	not null,
    ZipCode    	number(5)      	not null,
    constraint ST_PK primary key (StoreID));	
	
create table ProductCategory
	(ProductCategoryID    number(10)    not null,
    ProductCategoryName   varchar2(50)  not null,
	constraint PC_PK primary key (ProductCategoryID));
	
create table User1
	(UserID   			number(10)  	not null,
    MemberCardID  		number(10)  	not null UNIQUE,
    UserName  			varchar2(20) 	not null UNIQUE,   
	Password  			varchar2(20) 	not null,  
    LastName  			varchar2(20) 	not null,
	Middleinitial   	varchar2(5),
    FirstName      		varchar2(20) 	not null,
    Street         		varchar2(50) 	not null,
    City           		varchar2(15) 	not null,
    State          		varchar2(10) 	not null,  
    ZipCode        		number(5)      	not null,
	Email          		varchar2(50) 	not null UNIQUE,   
	Phone          		number(10)     	not null UNIQUE,
    DateOfBirth    		date         	not null,
    CouponAmountLimited number(2) 		not null,
    AnnualSpent     	number(6,2)		not null,
    constraint U_PK primary key (UserID));
	
create table Product
	(ProductID  	  	number(10)  	not null,
    ProductName			varchar2(50) 	not null,	 
	Brand     			varchar2(50)  	not null,
	SizeP       		number(4,2)    	not null,
	ProductCategoryID  	number(10)     	not null,
	UnitOfMeasurement 	varchar2(10)  	not null,
    Price     			number(6,2)     not null,
	constraint P_PK primary key(ProductID),
	constraint P_FK foreign key(ProductCategoryID) references ProductCategory(ProductCategoryID));

create table Offer
	(ProductID     number(10) not null,
    StoreID        number(10) not null,
    FromDate       date       not null,
    constraint Of_PK primary key (ProductID,StoreID),
    constraint Of_FK1 foreign key (ProductID) references Product(ProductID),
    constraint Of_FK2 foreign key (StoreID) references Store(StoreID));
	
create table Coupon 
	(CouponID   		number(10) not null,
	ProductCategoryID   number(10) not null,
	CouponType  		number(10)  not null,
	StartDate   		date       not null,
	ExpireDate  		date       not null,
	constraint Co_PK primary key (CouponID),
	constraint Co_FK foreign key (ProductCategoryID) references ProductCategory(ProductCategoryID),
	constraint Co_CK CHECK (CouponType IN (1,2)));
	
create table PercentDiscountCoupon
	(CouponID      number(10)   not null,
    PercentageOff  number(2,1)	not null,
    constraint PDC_PK primary key (CouponID),
    constraint PDC_FK foreign key (CouponID) references Coupon(CouponID),
	constraint PDC_CK CHECK (PercentageOff>0 AND PercentageOff<1));	
	
create table DollarDiscountCoupon
	(CouponID  number(10)  not null,
    DollarOff  number(4,2) not null, 
    constraint DC_PK primary key (CouponID),
    constraint DC_FK foreign key (CouponID) references Coupon(CouponID),  
	constraint DC_CK CHECK (DollarOff>0 AND DollarOff<99.99));  
	
create table Validate1
	(ValidationID  	number(10)	not null,
	CouponID       	number(10)  not null,
    StoreID      	number(10)  not null,
	ValidationDate	date		not null,
    constraint V_PK primary key (ValidationID),
    constraint V_FK1 foreign key (CouponID) references Coupon(CouponID),
    constraint V_FK2 foreign key (StoreID) references Store(StoreID));    	
	
create table Load
	(LoadID   number(10) not null,
    CouponID  number(10) not null,
    UserID    number(10) not null,
    LoadDate  date       not null,
    constraint Lo_PK primary key (LoadID),
    constraint Lo_FK1 foreign key (CouponID) references Coupon(CouponID),
	constraint Lo_FK2 foreign key (UserID) references User1(UserID));	
	
create table GoldenUser
	(UserID       number(10)  not null,
    DiscountRate  number(2,1) not null,  
	constraint G_PK primary key (UserID),
    constraint G_FK foreign key (UserID) references User1(UserID),
	constraint G_CK CHECK (DiscountRate = 0.8));
	
	
	
	