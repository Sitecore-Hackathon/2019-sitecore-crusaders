# Export the Data to CSV.

#Initializing Dropdowns
[Item]$rootItemID = Get-Item master:\sitecore\content\
[Item]$language = Get-Item master:\sitecore\system\Languages\
[Item]$template  = Get-Item master:\sitecore\Templates\

#Inputing the Required Data
$variableResult = @{
    Parameters = @(
        @{Name="rootItemID"; Title="Select Site root Item"; Root="/sitecore/content/"},
        @{Name="language"; Title="Select language"; Root="/sitecore/system/Languages/" },
        @{Name="template"; Title="Select the Template"; Root="/sitecore/Templates/" }
    )
    Title = "Data Export Tool"
    Description = "Export Tool to export the data based on the template and language."
    Width = 500
    Height = 400
    ShowHints = $true
    OkButtonName = "Export"
}

$selection = Read-Variable @variableResult

if($selection -ne "ok"){
    Close-Window
    Exit
}

#Main Export Functionality
$EverythingUnderRootItem = Get-ChildItem -ID $rootItemID.ID -Language "$language" -Recurse

if( $EverythingUnderRootItem.Count -gt 0 ){
    $i = 0;
    [Item[]] $Results = @();
    $EverythingUnderRootItem | ForEach-Object {
    if ($_.TemplateName -eq $template.Name) {
            if($i -eq 0)
            {
		        [string[]] $columns = $_ | Get-ItemField
            }
            $i = $i + 1
            $Results += $_
		}
	}
	
    $props = @{
        Title = "Export Items"
        InfoTitle = "Total $($i) items found!"
        InfoDescription = "Export Item Data"
        PageSize = 100
    }
    
    if($Results.Count -gt 0){
	        
            #Variable to initialize File Name and Path
            $dateNow = Get-Date -Format “dd_MM_yyyy_hh_mm_ss”
            $exportFileName = $template.Name + $dateNow 
            $outputFilePath = $SitecoreDataFolder + '\' +  $exportFileName + ".csv"

            $Results | Select-Object  $columns | 
			Export-Csv -NoTypeInformation -Path $outputFilePath 
			Write-Host "File Written"
			
			Get-Item -Path $outputFilePath | Send-File
    }
}
else{
    Show-Alert -Title "Items Not Found"
}