$options = [System.Management.Automation.Host.ChoiceDescription[]] @("&はい", "&いいえ")
$title = "確認"
$message = "処理を続行しますか？"
$default = 0

$choice = $Host.UI.PromptForChoice($title, $message, $options, $default)

switch ($choice) {
    0 { Write-Host "はいが選択されました。処理を続行します。" }
    1 { Write-Host "いいえが選択されました。処理を中止します。" }
}