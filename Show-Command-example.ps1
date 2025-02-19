# Show-Commandを使って、Get-ChildItemコマンドレットのパラメータを入力
$params = Show-Command Get-ChildItem -PassThru

# パラメータが入力された場合
if ($params) {
    # 入力されたパラメータを表示
    Write-Host "入力されたパラメータ："
    $params

    # 入力されたパラメータを使ってGet-ChildItemを実行
    $result = Get-ChildItem @params

    # 結果を表示
    Write-Host "Get-ChildItemの結果："
    $result | Format-Table -AutoSize
}
else {
    Write-Host "パラメータが入力されませんでした。"
}