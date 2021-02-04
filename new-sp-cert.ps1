#create new cert and upload cer into Azure Active Directory 

$cert = New-PnPAzureCertificate -OutPfx cert.pfx -OutCert cert.cer

#get pem encoded files and save as pem file
$PEM = get-PnPAzureCertificate -CertificatePath ".\cert.pfx" 

$cert | Out-File -FilePath ".file.pem"

## Extract Cert and Private key and save as seperate pem files 

$cert.Certificate | Out-File -FilePath ".\cert.pem"

$cert.PrivateKey  | Out-File -FilePath ".\key.pem"

## Test Connection 

$Tenant = "#entervalue"
$url = "#entervalue"
$ClientId = "#entervalue"
$PEMCertificate = $cert.Certificate
$PEMPrivateKey =  $cert.PrivateKey

Connect-pnponline -Tenant $Tenant -url $url -ClientId $ClientId -PEMCertificate $PEMCertificate -PEMPrivateKey $PEMPrivateKey