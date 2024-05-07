# Tip: open it in VsCode
# Tip2: use the PS script CollectServerInfo.ps1 to collect info on the server.
# deletes the results.json file then creates a fresh file. Every interation the result is appended to it.
$start = "Start Time: " + (Get-Date)
cd 'C:\bruno\dvdrental\'
$json = 'results.json'
if(test-path results.json) {
    Remove-Item -Path $json 

}
New-Item -Name $json -ItemType File
for ($i = 0; $i -lt 1; $i++) {
    $res = bru run --env dvdrental
    Add-Content -Path $json -Value $res
    $res
}
$finish = "Finish Time: " + (Get-Date)

$start
$finish