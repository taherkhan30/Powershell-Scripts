#create new cert and upload cer into Azure Active Directory 

$cert = New-PnPAzureCertificate -OutPfx cert.pfx -OutCert cert.cer

#get pem encoded files and save as pem file
$PEM = get-PnPAzureCertificate -CertificatePath ".\cert.pfx" 

$cert | Out-File -FilePath ".file.pem"

## Extract Cert and Private key and save as seperate pem files 

$cert.Certificate | Out-File -FilePath ".\cert.pem"

$cert.PrivateKey  | Out-File -FilePath ".\key.pem"

## Use the test-new-sp-cert.ps1 script to test the cert from local.

