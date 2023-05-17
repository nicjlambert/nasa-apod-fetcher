// This script retrieves the Astronomy Picture of the Day (APOD) from the NASA API.
// API Key and Date are used as parameters for the request.

let

    // Defining API key
    api_key = "xn3EK1sh7Pg5SWz9RDWIb4KnInS75tsDucgGe5OL",
    
    // Getting today's date in "YYYY-MM-DD" format
    date = Date.ToText(DateTime.Date(DateTime.LocalNow()), "YYYY-MM-DD"),

    // Defining base URL for the API
    BaseUrl = "https://api.nasa.gov/",
    
    // Defining RelativePath and Query parameters for the API
    Options = [
        RelativePath = "planetary/apod?",
        Query = [
            api_key = api_key, 
            date = date
        ]
    ],

    // Making a GET request to the API and storing the JSON response
    JsonResponse = Web.Contents(BaseUrl, Options),

    // Error handling for failed API call
    Source = try Json.Document(JsonResponse) otherwise error "Failed to retrieve data from the API.",

    // Converting the returned record into a table
    TableFromSource = Record.ToTable(Source)

in
    // Returning the final table
    TableFromSource