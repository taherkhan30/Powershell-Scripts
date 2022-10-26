

$context = New-AzApiManagementContext -ResourceGroupName "$(RGName)" -ServiceName "api-$(ClusterName)"
$logger = Get-AzApiManagementLogger -Context $context -LoggerId "$(ClusterName)AppInsights"
$samplingsetting = New-AzApiManagementSamplingSetting -SamplingType fixed -SamplingPercentage 100
$httpMessageDiagnostic = New-AzApiManagementHttpMessageDiagnostic -HeadersToLog 'Content-Type', 'User-Agent' -BodyBytesToLog 100
$pipelineDiagnostic = New-AzApiManagementPipelineDiagnosticSetting -Request $httpMessageDiagnostic -Response $httpMessageDiagnostic


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

