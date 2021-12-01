
// Minimum Working Example
// Using NASA Astronomy Picture of the Day (APOD) API service
// https://apod.nasa.gov/apod/astropix.html

// 
// Query Parameters
// api_key: api.nasa.gov key for expanded usage
// date: The date of the APOD image to retrieve (only included for testing 
// stringing together multiple query parameters)
//
//
// Power Query will ask you to specify how to connect to this file. Click Edit Credentials.
// Web Content dialog, choose to connect anonymously. Check the 'Skip Test Connection' option. 
// Click Connect.

// Further Reading: 
// https://blog.crossjoin.co.uk/2016/08/23/web-contents-m-functions-and-dataset-refresh-errors-in-power-bi/
// https://blog.crossjoin.co.uk/2016/08/16/using-the-relativepath-and-query-options-with-web-contents-in-power-query-and-power-bi-m-code/
// https://aka.ms/dynamic-data-sources 


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
        // There are two query parameter 'api_key', the api_key query, 
        // and the date query is 'date'. so Query takes a record with two field: [api_key=, date=]
      Query=[api_key = api_key, date = date]]
  )
),

#"Table" = Record.ToTable(Source)

in

#"Table"