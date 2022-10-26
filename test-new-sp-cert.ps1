$Tenant = "#entervalue"
$url = "#entervalue"
$ClientId = "#entervalue"
$PEMCertificate = $cert.Certificate
$PEMPrivateKey =  $cert.PrivateKey

Connect-pnponline -Tenant $Tenant -url $url -ClientId $ClientId -PEMCertificate $PEMCertificate -PEMPrivateKey $PEMPrivateKey
