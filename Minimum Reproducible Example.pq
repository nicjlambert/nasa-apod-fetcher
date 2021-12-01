// Minimum Reproducible Example
// Reconstruct API URL paths with Relative Paths and/or Query
// 
// Problem: 
// when a dataset published to Power BI service is refreshed it 
// does analysis on the code: determining data sources and
// whether the any supplied credentials are correct. When the 
// definition of a data source depends on the parameters from a 
// custom M function, analysis on the code fails and the dataset 
// does not refresh.
// 
// Solution: 
// When the data source is a call to Web.Contents() then Power BI 
// service will only check first parameter url "https://api.nasa.gov/" 
// and it passes. By using the RelativePath and Query options with Web.Contents() 
// you can leave the value passed to the first parameter as a static string
// 
// Query Parameters
// api_key: api.nasa.gov key for expanded usage
// date: The date of the APOD image to retrieve (only included for testing stringing together multiple query parameters)
//
// Further Reading: 
// https://blog.crossjoin.co.uk/2016/08/23/web-contents-m-functions-and-dataset-refresh-errors-in-power-bi/
// https://blog.crossjoin.co.uk/2016/08/16/using-the-relativepath-and-query-options-with-web-contents-in-power-query-and-power-bi-m-code/
//
//
// Power Query will ask you to specify how to connect to this file. Click Edit Credentials.
// Web Content dialog, choose to connect anonymously. Click Connect.
// Uncheck 'Test Connection'.

let

api_key = "xn3EK1sh7Pg5SWz9RDWIb4KnInS75tsDucgGe5OL",
date = Date.ToText(DateTime.Date(DateTime.LocalNow()), "YYYY-MM-DD"),

Source = 
  Json.Document(
    Web.Contents(
        // Base url
    "https://api.nasa.gov/",
    [ 
        // RelativePath is just the string "planetary/apod?" and is added to the base url.
      RelativePath="planetary/apod?",
        // There are two query parameter “q”, the search query, 
        // and the search term is “cows”, so Query takes a record with two field: [api_key=, date=]
      Query=[api_key = api_key, date = date]]
  )
),

#"Converted to Table" = Record.ToTable(Source)

in

#"Converted to Table"