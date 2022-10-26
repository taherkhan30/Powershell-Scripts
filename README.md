# Powershell-Cheatsheet

## Contents 
[Why PowerShell?](https://github.com/taherkhan30/Powershell-Scripts#why-powershell)

[PowerShell Basics ](https://github.com/taherkhan30/Powershell-Scripts#powershell-basics)

[Azure Powershell ](https://github.com/taherkhan30/Powershell-Scripts#azure-powershell)

[Powershell DSC for Configuration Management](https://github.com/taherkhan30/Powershell-Scripts#powershell-dsc)

[PowerShell Automation](https://github.com/taherkhan30/Powershell-Scripts#powershell-automation)


## Why PowerShell?

	- Microsoft's goals for PowerShell is to build 100% of a products administration functionality on the shell. 
	- Ease of Interacting with Microsoft products across Azure and Microsoft 365  
	- Helps to automate repetitive task 
	- GUI consoles execute PowerShell behind the scenes. If GUI isn't too great you can do it through PowerShell, some products have deficient GUI             functionality and certain tasks can only be done through PowerShell  
	- Write commands, write scripts for CI/CD pipelines, Automate Azure cloud. 
	- Powershell works across Windows, Mac and linux distributions 

## PowerShell Basics 

**Terminology** 

**Cmdlet** - get-service / follows a verb pattern

**Parameter** - get-childitem -recursive 

**Alias** - gsv -s 

**Pipeline** - gci c:\mmmmm -s | measure-object 

**Functions** - block of code 

**Script** - a .ps1 file , functions live inside scripts

**Modules** - packages of related ps components tha we can install in our system 

### Setting up VSCode for Powershell 

Download VSCode from here  [Get VSCode](https://code.visualstudio.com/download)


## Variables 

### User defined variables 

    $variable 

    $variable=value 



### Automatic variables 
    '$null'
    '$lastexitcode - ping.exe -n 1 google.com > $lastexitcode' 
    '$maximummhistorycount' 

### Preference variables 
* Error
* Warning
* Verbose
* Debug
* Information 

Find all preference variables by doing

    get-variables -Name *Preference 
    
Pref vars help to manipulate outputs 

## Data Types in PowerShell 

> Remember it with bidso 

### Bools 
    $inOn=$true
    $isOn=$false 

### Integers 
    $num = 1 
    $num.GetType().name 
Force cast int by [int32]$num - this will round it off 

### Double 
    $num = 1.463643634
    [float]$num 

### Strings 
    $color='blue'
    
Must have quotes

Strings can be sentences 

    '' or "" for simple strings 

### Objects 

Objects have properties and methods 

    $color
    $color.length 
    $color.remove(1,1) 
    $newcolor = $color.remove(1,1) 



## Data Structures 

### Arrays 
ArrayList
Hashtables 

Arrays 
    $colorPicker = @('blue', 'white', 'yellow', 'red')
    
Access arrays by using 

    $colorPicker[1] 

> Using -1 will return last item of array 

> Get a range of array element by using $colorPicker[1..3] 

Add item to array list 

    $colorPicker = $colorPicker + 'blue' 

    $colorPicker =+ 'blue' 

    $colorPicker =+ @('blue', 'cyan') 
 
### Arraylists 

	- They don’t have a fixed size comapred to arrays 

$colorPicker = $colorPicker + 'blue' 


### Hashtable 

	- Essentially a doctionary of key value pairs 

$users = @{ tkhan= 'taher khan' sakhan = 'sulayman khan'}

$users 

Duplicate keys not allowed 

Can be array 

Can be another hashtable 

$users.takhan 

$users.keys

$users.values 

$users.add('key','value')


$users.containKey('tkhan')  / will return true or false 

$users['tkhan']='takhan' 

$users.remove('takhan')


### Custom object 

Powershell gives tou objects, you can also make your own objects with properties and methods that you define. 

$myobject = [pscustomobject]@{OSBuild='x';OSVersion='y'}

Get-member -inputObject $myobject 

$myobject.OSVersion


## Azure Powershell 

###### Accounts and Subscriptions

    Connect-AZaccount 

    Select-AZSubscription -SubscriptionName "string" 

###### Virtual Machines 

Examples script which deallocates a VM [Deallocate VM](https://github.com/taherkhan30/PowerShell-Scripts/blob/main/jumpbox-automation.ps1 
) 

## Powershell DSC 

Pull and push model 

Phases 

	- Authoring 
		○ Dscribe the configurations 
	- Staging 
		○ Convet config to mof files ready to be deployed 
	- Configuration phase 
		○ Dsc pushes mof files
		○ Clients will pull mof files 
		○ Can be automated 
	
Dsc push model 

Push model - we are putting git on the servers locally 

Pull model - clients pull from the configuration server 

## PowerShell Automation

Goal, triggers, actions, future 

	• Goal - what should the automation achieve? 

	• Triggers can be monitor and scheduled actions 

	• Actions - logic , tasks and logging 	
	
	• Future - will it be useful in the future? Difficult to maintain? 

## PowerShell Security 

* PowerShell give you a wide scope of access within a system such as a windows machine, azure or microsft 365 resource. 
* PowerShell commands can be hidden inside .exe and be used to attack systems by Hackers. Some organisations tend to block powershell, by doing that they are missing out using a secure and security transparent management tool and instead should focus on their underlying security issues. this section has some tips and commands to make your powershell usage safe for your environment.  
* Due to the above two reason it is vital that you use safeguards given by PowerShell 

#### Execution Policy 

    Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope LocalMachine
    Get-ExecutionPolicy -List
    
#### Module and Pipeline logging collection 

   you can enable log collection for PowerShell to check that it is not being misused
   
#### System Transcripts 



#### Important resources for Powershell Security 
* https://www.zdnet.com/article/nsa-cisa-say-dont-block-powershell-heres-what-to-do-instead/ 
* Lee Holmes talk about Defending against PowerShell Attacks https://www.youtube.com/watch?v=M5bkHUQy-JA 
* https://www.darkoperator.com/
* multiple machine logon reporting tool - https://mickitblog.blogspot.com/2020/08/multiple-machine-logon-reporting.html  

## Useful Commands 

###### Update to Powershell 7 

    iex "& { $(irm https://aka.ms/install-powershell.ps1) } -UseMSI"

###### Bypass TLS 

    [Net.ServicePointManager]::SecurityProtocol = "tls12, tls11, tls"


## Powershell Resources 

#### Podcasts 

* PowerScripting Podcast - https://powershell.org/category/podcast/ 
* PowerShell News Podcast - https://powershellnews.podbean.com/
* The PowerShell Podcast - https://powershellpodcast.podbean.com/  || Video Edition https://www.youtube.com/watch?v=a3nNHS5SCf4

#### Websites 

* Are you looking for automation ideas? https://community.spiceworks.com/topic/1926925-what-have-you-automated-using-powershell 
* More real life automation ideas https://www.reddit.com/r/PowerShell/comments/hl1fxy/what_have_you_done_in_powershell_to_automate_your/

#### PowerShell Influencers 

* Josh Duffney https://twitter.com/joshduffney?lang=en 

## PowerShell Latest 

* get-whatsnew 
https://devblogs.microsoft.com/powershell/announcing-the-release-of-get-whatsnew/ 
