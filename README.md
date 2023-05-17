# NASA APOD Fetcher

This repository contains a Minimum Working Example (MWE) of a Power Query script for fetching data from NASA's Astronomy Picture of the Day (APOD) API.

The primary objective of this MWE is to demonstrate how `RelativePath`, `Query`, and `Web.Contents()` can be utilized to reconstruct API URL paths. This is especially useful for enabling dataset refreshes or scheduled refreshes of datasets published to the Power BI Service.

## Problem

Without this approach, users might encounter failures on the Power BI Service, resulting in error messages like "This dataset includes a dynamic data source...this dataset won't be refreshed". This issue arises when the Power BI Service analyzes the code (which doesn't happen on Power BI Desktop) and detects definitions of data sources that depend on parameters from custom M functions, thereby preventing the dataset from refreshing.

## Solution

This script employs a strategy to avoid these errors by constructing the URL path in a way that the Power BI Service can understand and accept, ensuring successful dataset refreshes.

## How to use

1. Clone this repository or copy the MWE script.
2. Replace the `api_key` variable with your own NASA API key.
3. If needed, modify the `date` variable to the desired date for the APOD image.
4. Use this script in your Power Query environment.

## Further Reading

To delve deeper into this topic and to learn more about the `Web.Contents()` function, `RelativePath`, and `Query` parameters, you may refer to the following resources:

- [Web.Contents, M functions, and dataset refresh errors in Power BI](https://blog.crossjoin.co.uk/2016/08/23/web-contents-m-functions-and-dataset-refresh-errors-in-power-bi/)
- [Using the RelativePath and Query options with Web.Contents in Power Query and Power BI M code](https://blog.crossjoin.co.uk/2016/08/16/using-the-relativepath-and-query-options-with-web-contents-in-power-query-and-power-bi-m-code/)
- [Dynamic Data Sources](https://aka.ms/dynamic-data-sources)

## License

This project is open source and available under the [MIT License](LICENSE).