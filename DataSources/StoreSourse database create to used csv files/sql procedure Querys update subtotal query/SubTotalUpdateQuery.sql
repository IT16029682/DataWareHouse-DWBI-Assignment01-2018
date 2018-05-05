
declare @orderid varchar(50)
declare @Total float
declare @count int
SET @count=1
while @count <9995
begin
	select @orderid=Order_ID from OrderDetail where OrderDetail_ID = @count ;
    select  @Total=SUM(o.LineTotal) from OrderDetail o where Order_ID = @orderid group by Order_ID
    select @count+=COUNT(*) from OrderDetail o where Order_ID = @orderid group by Order_ID
	 
	 
	 UPDATE OrderDetailHeader
	  SET SubTotal= @Total
	 WHERE Order_ID=@orderid
	
 end