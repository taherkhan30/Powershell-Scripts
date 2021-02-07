

Import-Module PSWriteWord #-ForceMEMDocumentationTempl

## Setup HW/SW Record Document 

##replace info 
Function replaceInfo {

    If ($Document) { 
        $WordDocument = Get-WordDocument -FilePath $DocumentTemplate
    
        foreach ($Paragraph in $WordDocument.Paragraphs) {
            $Paragraph.ReplaceText('#DATE#', (Get-Date -Format "yyyy.MM.dd HH:mm"))
            $Paragraph.ReplaceText('#TENANT#', "test")
            $Paragraph.ReplaceText('#USERNAME#', "test")
        }
    
        foreach ($cell in $WordDocument.Paragraphs) {
            $cell.ReplaceText('#1#', $CSVFile.'name ')
            $cell.ReplaceText('#2#', $CSVFile.age)
            $cell.ReplaceText('#3#', "test")
            $cell.ReplaceText('#4#', "test")
        }
    
    
    }

}

##-------------------------------------------------------------------------------------------------------------------------------

## Populate Standard Hardware Record 

##Import and format the CSV Data 
##get-help Import-CSV -Online

$HWCSVFile = Import-Csv -Path 'D:\Users\Taher Khan\Desktop\WriteWord\AllResources.csv' 
$HWCSVFile | Format-Table


## Obtain template filepath 
$HWDocumentTemplate = "$Env:USERPROFILE\Desktop\writeword\TEMPLATE.docx"

$HWWordDocument = Get-WordDocument -FilePath $HWDocumentTemplate

Add-WordTable -WordDocument $HWWordDocument -DataTable $HWCSVFile -Design TableGrid -BreakPageAfterTable -AutoFit Window #-Supress $true -Transpose #-Verbose 
$HWtableinfo = Get-WordTable -WordDocument $HWWordDocument -TableID 6


Add-WordTableColumn -Table $HWtableinfo -Count 1 -index 2 -Direction right 
Add-WordTableColumn -Table $HWtableinfo -Count 1 -index 3 -Direction right 
##Add-WordTableColumn -Table $HWtableinfo -Count 1 -index 4 -Direction right 

Add-WordTableTitle -Table $HWtableinfo -Titles 'Ref.','Specification Required','Specification Found','Pass\Fail'

### Save document
Save-WordDocument $HWWordDocument




##-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------



## Populate Standard Software Records 

##Import CSV Data 
$CSVFile = Import-Csv -Path 'D:\Users\Taher Khan\Desktop\WriteWord\allvmresources.csv'

## create filepath 
$DocumentTemplate = "$Env:USERPROFILE\Desktop\writeword\TEMPLATE.docx"

## define new document
$WordDocument = $DocumentTemplate

$WordDocument = Get-WordDocument -FilePath $DocumentTemplate

<#Add-WordTOC -WordDocument $WordDocument -Title 'Table of content' -HeaderStyle Heading1 -Supress $True

Add-WordPageBreak -WordDocument $WordDocument -Supress $True

Add-WordSection -WordDocument $WordDocument -PageBreak -Supress $True#>

##$tableinfo | gm
##Populate template
Add-WordTable -WordDocument $WordDocument -DataTable $CSVFile -Design TableGrid -BreakPageAfterTable -AutoFit - #-Supress $true #-Transpose #-Verbose 
$tableinfo = Get-WordTable -WordDocument $WordDocument -TableID 6

$tableinfo | gm
Add-WordTableColumn -Table $tableinfo -Count 1 -index 2 -Direction right 
Add-WordTableColumn -Table $tableinfo -Count 1 -index 3 -Direction right 
Add-WordTableColumn -Table $tableinfo -Count 1 -index 4 -Direction right 

Add-WordTableTitle -Table $tableinfo -Titles 'Ref.' , 'Specification Required' ,'Specification Found', 'Pass\Fail'


##$row = Get-WordTableRow -Table $tableinfo -RowNr 1 -ColumnNr 3 
##Set-WordTableCell -Table $tableinfo -ColumnNr 3 -RowNr 1 


##Add-WordTableColumn -Table $tableinfo -Count 1 -index 1 -Direction left

##$WordDocument| gm
##$WordDocument.ReplaceText('#TENANT#',"test")



### Save document
Save-WordDocument $WordDocument



### Start Word with file
Invoke-Item $DocumentTemplate

Write-Log "---------- Script Completed ----------"