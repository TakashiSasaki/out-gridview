# プロセス情報を取得し、Out-GridViewで表示
$selectedProcesses = Get-Process | Out-GridView -PassThru -Title "プロセスを選択してください"

# ユーザーが選択したプロセスが存在する場合
if ($selectedProcesses) {
    # 選択されたプロセスを表示
    Write-Host "選択されたプロセス:"
    $selectedProcesses | Format-Table -AutoSize

    # 選択されたプロセスを終了するか確認
    $confirm = Read-Host "選択されたプロセスを終了しますか？ (Y/N)"

    if ($confirm -eq "Y") {
        # 選択されたプロセスを終了
        $selectedProcesses | Stop-Process -Force
        Write-Host "選択されたプロセスが終了されました。"
    }
    else {
        Write-Host "プロセスは終了されませんでした。"
    }
}
else {
    Write-Host "プロセスが選択されませんでした。"
}