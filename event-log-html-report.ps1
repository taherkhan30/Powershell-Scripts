# get-errors 
param (
    [string]$Log = "System",
    [string]$ComputerName = $env:computername,
    [int32]$Newest = 500,
    [string]$ReportTitle = "Event Log Report",
    [Parameter(Mandatory, HelpMessage = "Enter the path for the HTML file.")]
    [string]$Path
)

$Data = get-eventlog $Log -EntryType Error -Newest $Newest -ComputerName $computername | Group-object -Property Source -NoElement

# create HTML report 

$title = "System Log Analysis"
$footer = "<h5> report run $(Get-Date)</h5>"
$css = "http://jdhitsolutions.com/sample.css"

$Data | Sort-Object -Property Count, Name -Descending | 
Select-object Count, Name |
ConvertTo-HTML -Title $title -PreContent "<h1>$ComputerName</h1>" -PostContent $footer -CssUri $css |
Out-File -file $Path

invoke-item D:\outputs\systemsources.html