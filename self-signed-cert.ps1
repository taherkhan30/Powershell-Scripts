$Cert = 

$CertificateName = "AzureRunAsCertificate"
$OutputFolder = "c:\certs"
$CertificatePassword = "password123"


New-SelfSignedCertificate `
            -DnsName $CertificateName `
            -CertStoreLocation cert:\LocalMachine\My `
            -KeyExportPolicy Exportable `
            -Provider "Microsoft Enhanced RSA and AES Cryptographic Provider" `
            -NotAfter (Get-Date).AddMonths(1)


        $cert = Get-ChildItem -Path cert:\LocalMachine\My\2e895fecbb6195cb9c90e8fcb72aefd9adb99f19

        $SecurePassword = ConvertTo-SecureString $CertificatePassword -AsPlainText -Force

        Export-PfxCertificate -Cert $Cert -FilePath C:\certs\cert.pfx -Password $SecurePassword 

        Export-Certificate -Cert ("Cert:\localmachine\my\" + $Cert.Thumbprint) -FilePath ("cert.cer" -f $OutputFolder, $CertificateName) -Type CERT
  
        Export-Certificate -Cert $cert -FilePath c:\certs\cert.cer