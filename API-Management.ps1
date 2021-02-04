$context = New-AzApiManagementContext -ResourceGroupName "$(RGName)" -ServiceName "api-$(ClusterName)"
$logger = Get-AzApiManagementLogger -Context $context -LoggerId "$(ClusterName)AppInsights"
$samplingsetting = New-AzApiManagementSamplingSetting -SamplingType fixed -SamplingPercentage 100
$httpMessageDiagnostic = New-AzApiManagementHttpMessageDiagnostic -HeadersToLog 'Content-Type', 'User-Agent' -BodyBytesToLog 100
$pipelineDiagnostic = New-AzApiManagementPipelineDiagnosticSetting -Request $httpMessageDiagnostic -Response $httpMessageDiagnostic


New-AzApiManagementDiagnostic -LoggerId $logger.LoggerId -Context $context -ApiId Local Organisation API -AlwaysLog allErrors -SamplingSetting $samplingsetting -FrontEndSetting $pipelineDiagnostic -BackendSetting $pipelineDiagnostic -DiagnosticId "applicationinsights"


Select-AzSubscription -Tenant "b00367e2-193a-4f48-94de-7245d45c0947" -Subscription "1abdef14-3cd8-4edd-8469-2879a50e633f"

connect-azaccount

$context = New-AzApiManagementContext -resourcegroupname "NBSDevelopment" -ServiceName "api-nbs-dev-01"

Get-AzApiManagementApi -context $context





### DEVOPS VERSION 

$context = New-AzApiManagementContext -ResourceGroupName "$(RGName)" -ServiceName "api-$(ClusterName)"
$APIM = Get-AzAPIManagementApi -Context $context 
$logger = Get-AzApiManagementLogger -Context $context -LoggerId "$(ClusterName)AppInsights"
$samplingsetting = New-AzApiManagementSamplingSetting -SamplingType fixed -SamplingPercentage 100
$httpMessageDiagnostic = New-AzApiManagementHttpMessageDiagnostic -HeadersToLog 'Content-Type', 'User-Agent' -BodyBytesToLog 100
$pipelineDiagnostic = New-AzApiManagementPipelineDiagnosticSetting -Request $httpMessageDiagnostic -Response $httpMessageDiagnostic

foreach($API in $APIM) {

New-AzApiManagementDiagnostic -LoggerId $logger.LoggerId -Context $context -ApiId $API.ApiId -AlwaysLog allErrors -SamplingSetting $samplingsetting -FrontEndSetting $pipelineDiagnostic -BackendSetting $pipelineDiagnostic -DiagnosticId "applicationinsights"

}



"nbs-dev-01AppInsights"

##### WORKING VERSION 
$RGName = "NBSDevelopment"
$ServiceName = "api-nbs-dev-01"
$context = New-AzApiManagementContext -ResourceGroupName $RGName -ServiceName $ServiceName
$APIM = Get-AzAPIManagementApi -Context $context 
$logger = Get-AzApiManagementLogger -Context $context -LoggerId "logger"
$samplingsetting = New-AzApiManagementSamplingSetting -SamplingType fixed -SamplingPercentage 100
$httpMessageDiagnostic = New-AzApiManagementHttpMessageDiagnostic -HeadersToLog 'Content-Type', 'User-Agent' -BodyBytesToLog 100
$pipelineDiagnostic = New-AzApiManagementPipelineDiagnosticSetting -Request $httpMessageDiagnostic -Response $httpMessageDiagnostic

foreach($API in $APIM) {

    New-AzApiManagementDiagnostic -LoggerId $logger.LoggerId -Context $context -ApiId $API.ApiId -AlwaysLog allErrors -SamplingSetting $samplingsetting -FrontEndSetting $pipelineDiagnostic -BackendSetting $pipelineDiagnostic -DiagnosticId "applicationinsights"

}


Set-AzApiManagementLogger -Context $context -LoggerId "Logger" -Name "nbs-dev-01AppInsights"

