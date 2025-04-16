<#   
    .NOTES
    ===========================================================================  
     Created on:    29-Mar-2017 12:16 PM
     Created by:    Noam Wajnman      
     Filename:      Split-PFXCertificate.ps1        
    ===========================================================================
    .DESCRIPTION
        Splits a PFX certificate into a public/private key pair. See the Parameters 
        section to optionally convert to PEM and/or decrypt the private key.
#>
#PARAMETERS
$openssl = 'C:\OpenSSL-Win64\bin\openssl.exe'
$sourcePFX = 'd:\cert.pfx'
$sourcePFX_Passphrase = 'password'
$convertToPEM = $true
$decryptPrivateKey = $true
#INITIALIZE
$sourcePFX_Dir = (Get-ChildItem $sourcePFX).DirectoryName
$PrivateKeyFile = $sourcePFX.Replace('.pfx', '-encrypted.key')
$PublicKeyFile = $sourcePFX.Replace('.pfx', '.crt')
$ErrorActionPreference = 'SilentlyContinue'

#SCRIPT MAIN
#Extract the private key
& $openssl 'pkcs12' -in $sourcePFX -nocerts -out $PrivateKeyFile -password pass:$sourcePFX_Passphrase -passout pass:$sourcePFX_Passphrase

#Extract the public key
& $openssl pkcs12 -in $sourcePFX -clcerts -nokeys -out $PublicKeyFile -password pass:$sourcePFX_Passphrase

#if specified convert private key to PEM
if ($convertToPEM)
{
    $PrivateKeyPEMFile = $PrivateKeyFile.Replace('.key', '-pem.key')
    & $openssl rsa -in $PrivateKeyFile -outform PEM -out $PrivateKeyPEMFile -passin pass:$sourcePFX_Passphrase -passout pass:$sourcePFX_Passphrase
}
#If specified decrypt the private key
if ($decryptPrivateKey)
{
    if ($convertToPEM)
    {
        $PrivateKeyFile = $PrivateKeyPEMFile
    }
    $decryptedKeyFile = $PrivateKeyFile.Replace('.key', '-decrypted.key').Replace('-encrypted','')
    & $openssl rsa -in $PrivateKeyFile -out $decryptedKeyFile -passin pass:$sourcePFX_Passphrase -passout pass:$sourcePFX_Passphrase
}
