
param(
[parameter(Mandatory=$true)]
[String[]]$computername
)

Get-CimInstance -ComputerName $computername -Classname Win32_Logicaldisk -filter "DeviceID='C:'" |
    Select-Object -Property @{n="computername";e={$_.PSComputerName }},
        @{n="FreeGB";e={$_.FreeSpace / 1gb -as [int]}}
