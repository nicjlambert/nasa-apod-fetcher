# api-service-power-bi
 
This MWE shows how `RelativePath` and `Query` and `Web.Contents()` 
can be used to reconstruct API URL paths for the purposes of enabling
dataset refreshes or scheduled refreshes of datasets published to the Power BI Service. 

This MWE avoids failures on the Power BI Service, resulting in error 
messages "This dataset includes a dynamic data source...this 
dataset won't be refreshed", which occurs when the Power BI Service analyses the code (this 
doesn't happen on Power BI Desktop which is why it works). The analysis fails when it 
detects definitions of data sources that depend on parameters from custom M functions and 
the dataset does not refresh. 