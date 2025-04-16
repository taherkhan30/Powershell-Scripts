
https://stackoverflow.com/questions/58345592/azure-powershell-tagging-vms-from-csv-file 

# Set Credentials (Fixed this up)

$context = Get-AzureRmContext
if ($context.Account -eq $null) {
    Login-AzureRmAccount
}

# Select Azure Subscription

$subscriptionId = (Get-AzureRmSubscription | Out-GridView -Title "Select an Azure Subscription ..." -PassThru).SubscriptionId

#Select specified subscription ID

Select-AzureRmSubscription -SubscriptionId $subscriptionId

$InputCSVFilePath = "C:\Users\Nick\Desktop\test.csv"

################
#
# Here you were missing loading the actual data. Also renamed the items in the loop, nitpicking. :)
#
################

$csvItems = Import-Csv $InputCSVFilePath

################

#Start loop

foreach ($item in $csvItems)
{
    ################
    #
    # Change here, you need ResourceGroupName
    # Also cleared r because if you don't, it will still have a value if no matching VM is found, which would re-tag the previous item from the loop, instead of throwing an error that the VM was not found
    #
    ################ 

    Clear-Variable r

    $r = Get-AzureRmResource -ResourceGroupName $item.ResourceGroup -Name $item.VMName -ErrorAction Continue

    ################ 

    if ($r -ne $null)
    {
        if ($r.Tags)
        {
            # Tag - Application

            if ($r.Tags.ContainsKey("Application"))
            {
                $r.Tags["Application"] = $item.Application
            }
            else
            {
                $r.Tags.Add("Application", $item.Application)
            }

            # Tag - SubCat

            if ($r.Tags.ContainsKey("subCat"))
            {
                $r.Tags["subCat"] = $item.subCat
            }
            else
            {
                $r.Tags.Add("subCat", $item.subCat)
            }

            # Tag - Environment

            if ($r.Tags.ContainsKey("Environment"))
            {
                $r.Tags["Environment"] = $item.Environment
            }
            else
            {
                $r.Tags.Add("Environment", $item.Environment)
            }

            # Tag - AppOwner

            if ($r.Tags.ContainsKey("AppOwner"))
            {
                $r.Tags["AppOwner"] = $item.AppOwner
            }
            else
            {
                $r.Tags.Add("AppOwner", $item.AppOwner)
            }


## get all vms 

## check which ones are tagged 


## tag them based on values from csv 

