$ResourceGroupName=""
$sku=""
$name="" 
$Location=""                   
$Organization=""
$AdminEmail=""
$apiName=" #the name of the web API."
$url="" #the URL of the web service that exposes the API.
$path="" #the web API path, which is the last part of the API's public URL and corresponds to the Web API URL suffix field in the admin portal.

#login azure
Connect-AzureRmAccount

#create api management instance with required parameters
New-AzureRmApiManagement -ResourceGroupName $ResourceGroupName -Name $name -Sku $sku -Location $Location -Organization $Organization -AdminEmail $AdminEmail

$ApiMgmtContext =New-AzureRmApiManagementContext -ResourceGroupName $ResourceGroupName -ServiceName $name

#create api
$api = New-AzureRmApiManagementApi -Context $ApiMgmtContext -Name $apiName -ServiceUrl $url -Protocols @("http", "https") -Path $path

#run the command if you do not know product id
Get-AzureRmApiManagementProduct -Context $ApiMgmtContext

#add api to product
Add-AzApiManagementApiToProduct -Context $ApiMgmtContext -ProductId "" -ApiId $api.ApiId