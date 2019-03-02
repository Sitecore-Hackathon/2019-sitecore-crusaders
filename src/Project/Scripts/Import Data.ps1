function NormalizeName($name)
{
    # replace all special symbols with single spaces
    $name = $name -replace "[^a-zA-Z0-9]", " " -replace "\s+", ""
    
    return $name.Trim()
}

$media = Get-Item "/sitecore/media library"
$folder = Get-Item "/sitecore/content"
$template = Get-Item "/sitecore/templates"
$language = Get-Item "/sitecore/System/Languages"
$dialog = Read-Variable -Parameters `
    @{ Name = "media"; Title = "Source"; Root="/sitecore/media library/"; Editor="item"}, 
    @{ Name = "folder"; Title = "Destination"; Root="/sitecore/"; Editor="item"}, 
    @{ Name = "template"; Title = "Template"; Root="/sitecore/templates/"; Editor="item"},
    @{ Name = "language"; Title = "Language"; Root="/sitecore/System/Languages/"; Editor="item"} `
    -Description "This script will convert CSV data into content items." `
    -Width 800 -Height 600 `
    -Title "Data Import Tool" `
    -OkButtonName "Import" `
    -CancelButtonName "Cancel"

if ($dialog -ne "ok") 
{
    Exit
}
[system.io.stream]$body = $media.Fields["blob"].GetBlobStream()
try 
{
    $contents = New-Object byte[] $body.Length
    $body.Read($contents, 0, $body.Length) | Out-Null
} 
finally 
{
    $body.Close()    
}
$csv = [System.Text.Encoding]::Default.GetString($contents) | ConvertFrom-Csv

$bulk = New-Object "Sitecore.Data.BulkUpdateContext"
try 
{
    foreach ($record in $csv)
    {
        $name = NormalizeName $record.{Product Name}
        Write-Host "Normalized [$($record.{Product Name})] => [$name]"
        
        $item = New-Item -Path $folder.Paths.FullPath -Name $name -ItemType $template.Paths.FullPath -Language $language.name
        
        $item.Editing.BeginEdit()
        $item["__Display name"] = $record.{Product Name}
        $record | 
            Get-Member -MemberType Properties | `
            ForEach-Object { $item["$($_.Name)"] = $record."$($_.Name)" }      
        $item.Editing.EndEdit()
        
        Write-Host "Created $($item.Paths.FullPath) for $($record.Name)"
    }
}
finally
{
    $bulk.Dispose()
}