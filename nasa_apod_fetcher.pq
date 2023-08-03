// Get the API key securely
let api_key = key,

// Define a function to get APOD for a given date
GetAPOD = (date as date) as table =>
let
    // API base URL
    BaseUrl = "https://api.nasa.gov/",
    
    // Define API path and parameters
    Options = [
        RelativePath = "planetary/apod?",
        Query = [
            api_key = api_key, 
            date = Date.ToText(date, "YYYY-MM-DD")
        ]
    ],
    
    // Try to get data from API
    JsonResponse = try Web.Contents(BaseUrl, Options) otherwise null,

    // If API response is null, throw connection error
    // Otherwise, try to parse JSON response or throw parsing error
    Source = if JsonResponse = null then error "Failed to connect to the API." 
             else try Json.Document(JsonResponse) otherwise error "Failed to parse the API response.",

    // Convert JSON record to table
    TableFromSource = Record.ToTable(Source)
    
in
    // Return the table
    TableFromSource,

// Get today's date
Today = DateTime.Date(DateTime.LocalNow()),

// Call GetAPOD function with today's date
APOD_Today = GetAPOD(Today)

// Return today's APOD
in APOD_Today
