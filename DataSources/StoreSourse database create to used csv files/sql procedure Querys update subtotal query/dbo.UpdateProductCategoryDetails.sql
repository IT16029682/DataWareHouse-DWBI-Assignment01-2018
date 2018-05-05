Create Procedure dbo.UpdateProductCategoryDetails
@ProductCategoryID int,
@ProductCategoryName nvarchar(50)

as
Begin
if not exists (select ProductCategoryID
from dbo.DimCategory
where AlternateProductCategoryID = @ProductCategoryID
and Name = @ProductCategoryName )
begin
insert into dbo.DimCategory
(AlternateProductCategoryID, Name)
values
(@ProductCategoryID, @ProductCategoryName)
end;
End;