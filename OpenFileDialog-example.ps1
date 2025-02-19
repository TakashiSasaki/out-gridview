# Windows Forms アセンブリの読み込み
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")

# OpenFileDialog オブジェクトの作成
$dialog = New-Object System.Windows.Forms.OpenFileDialog

# ダイアログのプロパティを設定
$dialog.Title = "ファイルを選択してください"
$dialog.InitialDirectory = [Environment]::GetFolderPath("Desktop")
$dialog.Filter = "テキストファイル (*.txt)|*.txt|すべてのファイル (*.*)|*.*"
$dialog.FilterIndex = 1
$dialog.RestoreDirectory = $true

# ダイアログを表示
$result = $dialog.ShowDialog()

# ファイルが選択された場合
if ($result -eq [System.Windows.Forms.DialogResult]::OK) {
    # 選択されたファイルのパスを取得
    $filePath = $dialog.FileName

    # 選択されたファイルを処理
    Write-Host "選択されたファイル： $filePath"
    $content = Get-Content $filePath
    Write-Host "ファイルの内容："
    $content
}
else {
    Write-Host "ファイルが選択されませんでした。"
}