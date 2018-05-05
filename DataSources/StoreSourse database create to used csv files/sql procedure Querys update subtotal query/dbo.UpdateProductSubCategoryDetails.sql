Create Procedure  dbo.UpdateProductSubCategoryDetails
@ProductSubCategoryID int,
@ProductCategoryID int,
@ProductSubCategoryName nvarchar(50)
as
Begin
if not exists (select ProductSubcategoryID
from dbo.DimSubCategory
where AlternateProductSubCategoryID = @ProductSubCategoryID
and name = @ProductSubCategoryName
and ProductCategoryID = @ProductCategoryID )
begin
insert into dbo.DimSubCategory
(AlternateProductSubCategoryID, name, ProductCategoryID)
values
(@ProductSubCategoryID, @ProductSubCategoryName, @ProductCategoryID)
end;
End