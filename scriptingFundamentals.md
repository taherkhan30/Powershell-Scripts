<h1>Notes from Automation with Windows PowerShell Scripts </h1>

<b>Notes by Taher Khan</b>

<a> https://app.pluralsight.com/library/courses/automation-powershell-scripts/table-of-contents </a>

<b>Section 1 - PS Scripting Fundamentals</b>

Before starting to script in powershell you should be aware of 3 things, execution policies, powershell scopes and profile settings.  


<b><i>Execution policy</b></i> 

purpose - stops you from running code accidentally in production

by default doesnt run scripts 
execution policy 
restricted 
remotesigned 
Allsigned
unrestricted 
bypass

set-executionpolicy  remotesigned 

get-executionpolicy 

.\mondaytasks.ps1 

cannot find cmdlet, cannot run type errors area all to do with execution policy 

invoke-item . 
unblock-file <filepath>

<b><i>scope</b></i> 

- like a container 
- scripts run in their own scope 
- global
- script 
- private 
- numbered scope 
-you reference something =, ps looks at current scope, then parent e scope then parent up 
- PS can only read and write on the current scope 
- $global:x

<b><i>profile settings</b></i> 

you can create a profile script 
$profile 
$profile.currentuserallhosts 
$profile.allusercurrenthost 
$profile | select *host* | format-list
dir $profile 
new-item $profile -Force 
add-content -Value 'cd c:\scripts' -Path $Profile 
add-content -Value 'write-host "hello, how are you" -foregroundcolor magenta 

<b>Section 2 - Put it in writing </b>

- automate repitative task 
- ensure consistency 
- manage at scale 
- enhance your career 
- runs from top to bottom 
- see basic-script.ps1
- parameterization of scripts 
- format document in vscode 
- best practices for PS SCRIPTS
- use params 
- no hard coded password or creds
- dont use aliases
- use full cmdlet and param names 
- format your code 
- write for the next person    

<b> Section 3 - Scripting Techniques </b> 

Overview 
- no difference between interactive commands and a script 
- only scripts make life easier 
- goal is to use powershell to simplify the process 

<b><i>if statements </b></i>

if <condition> { }

*know the powershell comparison operators 
eq
!eq 

if { 

}elseif {

}else {


}

example - test of file exists 

<code>

if (test-path c:\files\data.txt){
    $data = get-content c:\files\data.txt
}else{

    Write Warning "cant find c:\files\data.txt"
}</code>


<b><i>foreach / foreach-object </b></i>

foreach object / alias is foreach 
2,5,6,7,89 | ForEach { $_ * 3}

$n = 1..10

foreach ($item in $in) {
    $file = "testfile=$item.txt"
    New-Item $file 
}

<b><i>Arrays </b></i>

collection of things 
$arr - @()
typically the same but not required 
powershell will auto unroll an array 
but you can ref items by index 0 
-1 to start at end 

$n = 1..5
$n.count 
$n[1] 

$s = get-service / technically this becomes an array so you can access each service with [1]
$s[-1].Name 

create an empty array 

$arr = @() 
%arr += 100

powershell will treat any list like below as an array 

$b = "jeff, "jasan', "don"
$b -is [array]

<b><i>hashtables</b></i> 

<b><i>custom objects</b></i> 

<b><i>try/catch error handling</b></i> 


<b>Section 4 -  Powershell Fun</b> 

- powershell can leverage .net
- working with strings 
- working with dates
- doing math 
- 

<b>Section 5 - Creating a Process Controller Script </b>

script -> function -> module 

controller script - a script that orchestrates or runs other powershell commands, functions and scripts. 

