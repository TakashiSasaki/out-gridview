Add-Type -AssemblyName System.Windows.Forms

$title = "情報"
$message = "これは情報メッセージです。"

[System.Windows.Forms.MessageBox]::Show($message, $title)