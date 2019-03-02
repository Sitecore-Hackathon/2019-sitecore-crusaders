# Data Import-Export Tool


## Summary

**Category:**  Best use of SPE to help Content authors and Marketers

 - **Purpose** : The purpose of this module is to empower content authors and marketers with the ability to import and export bulk content.
 - **Problem Solved** : While dealing with bulk data, it becomes tedious to create and view the data. This tool helps the users to instead deal with Excel files to both import and export data. Hence saving a lot of time.
 - **How it works** : This  Content Import/Export Tool is built with the Sitecore Powershell module, making the functioning of the tool faster and powerful. For the import functionality, the user has to fill the content to a CSV and input it to the tool. For the export functionality, the user will have select his targeted content, and the data will be exported as CSV file.
 
## Pre-requisites

- Sitecore Powershell Module v4.0 and above.

## Installation

1.  Use the Sitecore Installation wizard to install the  [package](https://github.com/Sitecore-Hackathon/2019-sitecore-crusaders/blob/master/documentation/README.md#link-to-package).

## Usage

1. ### Import Functionality
	- Fill the data you want to import in a CSV file and upload the file to the media library.
	- Open the **Content Editor**.
	- Go to the **Import Export Tool** tab as shown in the below screenshot.
	![Select Tool Tab](https://github.com/Sitecore-Hackathon/2019-sitecore-crusaders/blob/master/sc.package/Data_Import_Export_Installation_Package-1.zip?raw=true)
	- Click on **Import Data**.
	- You will see a prompt dialog as the below screenshot.
	![Select-Import-Options](https://github.com/Sitecore-Hackathon/2019-sitecore-crusaders/blob/master/documentation/images/Import-Dialog.png?raw=true)
	- Select the uploaded file as the **Source**.
	- Select the node where the data has to be populated as **Destination**.
	- Select the template of the type of the content you want to import.
	- Select the language of the content you want to import.
	- Click on **Import**.
	![Import-Success](https://github.com/Sitecore-Hackathon/2019-sitecore-crusaders/blob/master/documentation/images/Import-Success.png?raw=true)
2. ### Export Functionality
	- Open the **Content Editor**.
	- Go to the **Import Export Tool** tab as shown in the below screenshot.	
	![Select-Tool-Tab](https://github.com/Sitecore-Hackathon/2019-sitecore-crusaders/blob/master/documentation/images/Tool-Tab-New.png?raw=true)
	- Click on **Export Data**.
	- You will see a prompt dialog as the below screenshot.
	![Select Options](https://github.com/Sitecore-Hackathon/2019-sitecore-crusaders/blob/master/documentation/images/Export-Select_Options-New.png?raw=true)
	- Select the site that you want to export the data from.
	- Select the template of the type of the content you want to export.
	- Select the language of the content you want to export.
	- Click on **Export**.
	- After you see the Download dialog, click on **Download**.
	![ Download File Dialog ](https://github.com/Sitecore-Hackathon/2019-sitecore-crusaders/blob/master/documentation/images/Export-Download_Dialog-New.png?raw=true)
	- Open the downloaded file.
	- The data exported will be in the file.
	![Downloaded File ](https://github.com/Sitecore-Hackathon/2019-sitecore-crusaders/blob/master/documentation/images/Export-File.png?raw=true)
	
## Video
The link to the video can be found [here](https://www.youtube.com).

