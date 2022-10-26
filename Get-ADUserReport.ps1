<#PSScriptInfo
 
.VERSION 1.0
 
.GUID e6b77778-2225-42cb-8dc3-5f18f385a19a
 
.AUTHOR
    CarlosDZRZ
 
.DESCRIPTION
    Returns a customized list of Active Directory account information for a single user. The customized list is a combination of the fields that are most commonly needed to review when an employee calls the helpdesk for assistance.
 
.COMPANYNAME
 
.COPYRIGHT
 
.TAGS User Report Info
 
.EXTERNALMODULEDEPENDENCIES ActiveDirectory
 
.RELEASENOTES
Version 1.0: Original published version.
 
.PRIVATEDATA
 
#>

Function Get-ADUserReport {
    <#
        .SYNOPSIS
            Returns a customized list of Active Directory account information for a single user
        .EXAMPLE
            Get-ADUserReport <UserName>
            Returns a customized list of AD account information from UserName
            PS C:\Scripts> Get-ADUserReport JSmith
                FirstName : John
                LastName : Smith
                Title : System Engineer
                Department : IT
                Manager : Bruce
                City : Redmon
                UserName : jsmith
                DisplayName : Smith, John
                UserPrincipalName : jsmith@contoso.com
                EmailAddress : jsmith@outlook.com
                OfficePhone : 12345
                MobilePhone : 123456789
                LogonWorkstations :
                LastLogon : 18-Dec-19 8:08:42 AM
                LastLogonTimestamp : 17-Dec-19 12:01:14 AM
     
                AccountExpires : 01-Feb-20 12:00:00 AM
                AccountIsEnabled : True
                AccountIsLockedOut : False
                PasswordAge : 18.22:22:23
                PasswordLastSet : 29-Nov-19 10:29:23 AM
                PasswordNeverExpires : False
                PasswordExpires : 28-Jan-20 10:29:23 AM
                UserMustChangePassword : False
                PasswordIsExpired : False
                LastBadPasswordAttempt : 05-Dec-19 12:55:36 PM
         .PARAMETER UserName
            The employee account to lookup in Active Directory
        .NOTES
            NAME: Get-ADUserReport
            AUTHOR: CarlosDZRZ
        .LINK
            http://www.microsoft.com
        .LINK
            http://www.google.es
        .LINK
            http://lmgtfy.com/?q=Manual+powershell
    #>
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory=$true,ValueFromPipeline=$true,ValueFromPipelineByPropertyName=$true)]
        [string[]]$User_Name
    )
    Begin {
        $Manager = $null
        $AccountExpires = $null
        $PwdLastSet = $null
    }
    Process{
        foreach ($UserName in $User_Name){
            $ADusr = Get-ADuser $UserName -Properties givenName, Surname, Title, Department, Manager, City, SamAccountName,
            DisplayName, UserPrincipalName, EmailAddress, OfficePhone, MobilePhone, LogonWorkstations, LastLogon, LastLogonTimestamp,
            accountExpires, Enabled, LockedOut, PasswordLastSet, PasswordNeverExpires, PasswordExpired, CannotChangePassword,
            msDS-UserPasswordExpiryTimeComputed, LastBadPasswordAttempt
            $PasswordExpires = [datetime]::FromFileTime($ADusr.'msDS-UserPasswordExpiryTimeComputed')
            if ($null -ne $ADusr.manager){
                $Manager = Get-ADUser $ADusr.Manager
            }
            if ($ADusr.AccountExpires -eq 0){
                $AccountExpires = "Never"
            }
            else {
                $AccountExpires = [datetime]::FromFileTime($ADusr.accountExpires)
            }
            if ($null -eq $ADusr.PasswordLastSet){
                $PasswordAge = 0
                $PwdLastSet = 0
            }
            else{
                $PasswordAge = ((Get-Date) - ($ADusr.PasswordLastSet)).ToString("dd\.hh':'mm':'ss")
                $PwdLastSet = $ADusr.PasswordLastSet
            }
            $AccountInfo = [PSCustomObject]@{
                FirstName           = $ADusr.givenName
                LastName            = $ADusr.Surname
                Title               = $ADusr.Title
                Department          = $ADusr.Department
                Manager             = $Manager.SamAccountName
                City                = $ADusr.City
                UserName            = $ADusr.SamAccountName
                DisplayName         = $ADusr.DisplayName
                UserPrincipalName   = $ADusr.UserPrincipalName
                EmailAddress        = $ADusr.EmailAddress
                OfficePhone         = $ADusr.OfficePhone
                MobilePhone         = $ADusr.MobilePhone
                LogonWorkstations   = $ADusr.LogonWorkstations
                LastLogon           = [datetime]::FromFileTime($ADusr.LastLogon)
                LastLogonTimestamp  = [datetime]::FromFileTime($ADusr.LastLogonTimestamp)
            }
            $AccountStatus = [PSCustomObject]@{
                AccountExpires          = $AccountExpires
                AccountIsEnabled        = $ADusr.Enabled
                AccountIsLockedOut      = $ADusr.LockedOut
                PasswordAge             = $PasswordAge
                PasswordLastSet         = $PwdLastSet
                PasswordNeverExpires    = $ADusr.PasswordNeverExpires
                PasswordExpires         = $PasswordExpires
                UserMustChangePassword  = $ADusr.CannotChangePassword
                PasswordIsExpired       = $ADusr.PasswordExpired
                LastBadPasswordAttempt  = $ADusr.LastBadPasswordAttempt
            }
            $AccountInfo
            $AccountStatus
        }
    }#End Process
    }#End Function Get-ADUserReport