for ($i = 0; $i -le 100; $i += 10) {
    Write-Progress -Activity "処理中..." -Status "$i% 完了" -PercentComplete $i
    Start-Sleep -Milliseconds 500
}