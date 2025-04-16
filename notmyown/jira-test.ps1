# https://atlassianps.org/module/JiraPS/

Import-Module JiraPS
Set-JiraConfigServer "https://taherkhantest.atlassian.net/"

New-JiraSession -Credential $cred

# find out what fields you need 
Get-JiraIssueCreateMetadata -Project DTSPO -IssueType Task

#Get-JiraIssueType
get-jiraissuetype -issuetype "task"

get-jiraproject

$restapiuri = "https://taherkhantest.atlassian.net/rest/api/2/issue/"
# $headers = Get-HttpBasicHeader "user" "password"

Get-JiraIssueCreateMetadata -Project DTSPO -IssueType Task | ? {$_.Required -eq $true}

$parameters = @{
    Project = 'DTSPO'
    IssueType = 'Task'
    Reporter = 'somethingelse'
    Summary = 'Test issue from PowerShell'
}

New-JiraIssue @parameters

Issuetype
PROJECT
REPORTER 
summary 

New-JiraIssue -Project DTSPO -IssueType Task -Reporter powershell -Summary Test issue from PowerShell

Invoke-RestMethod -uri $restapiuri -Method POST -ContentType "application/json" -Body $body

