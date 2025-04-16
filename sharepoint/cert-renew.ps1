#create new cert and upload cer into Azure Active Directory 

$cert = New-PnPAzureCertificate -OutPfx cert.pfx -OutCert cert.cer

#get pem encoded files / ## save as pem file
$PEM = get-PnPAzureCertificate -CertificatePath ".\cert.pfx" 

$cert | Out-File -FilePath ".file.pem"

## seperate pem files 

$cert.Certificate | Out-File -FilePath ".\cert.pem"

$cert.PrivateKey  | Out-File -FilePath ".\key.pem"

## Test Connection 

Connect-PnPOnline -Tenant $Tenant -ClientId $AppId -Thumbprint $Thumbprint -Url $Url

Connect-PnPOnline -CertificatePath D:\Users\Taher%Khan\Documents\docmosis\cert.pfx -Tenant $Tenant -ClientId $AppId -Url $Url

Connect-pnponline -Tenant $Tenant -url $url -ClientId $ClientId -PEMCertificate $PEMCertificate -PEMPrivateKey $PEMPrivateKey

# test connection using pem files 

$Tenant = ""
$url = ""
$ClientId = ""
$PEMCertificate = $cert.Certificate
$PEMPrivateKey =  $cert.PrivateKey


Connect-pnponline -url $url -Tenant $Tenant -ClientId $ClientId -PEMCertificate $PEMCertificate -PEMPrivateKey $PEMPrivateKey 

Connect-PnPOnline -Tenant $Tenant -ClientId $AppId -Thumbprint $Thumbprint -Url $Url

