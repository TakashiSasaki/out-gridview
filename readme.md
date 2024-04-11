# PowerShellでGUIライクな表現を実現するテクニック

PowerShellはコマンドラインベースのシェルであるが、いくつかのテクニックを使うことでGUIライクな表現を実現することができる。ここでは、PowerShellでよく使われるGUIやテキストベースのUIについて紹介する。

## Out-GridView
- Out-GridViewコマンドレットを使うと、データをグリッド形式で表示し、フィルタリングや並べ替えを行うことができる。
- 例えば、以下のコマンドでプロセス一覧をグリッド形式で表示できる：
  ```powershell
  Get-Process | Out-GridView -Title "プロセス一覧"
  ```

## Show-Command
- Show-Commandコマンドレットを使うと、コマンドレットのパラメータをGUI形式で入力できるダイアログを表示できる。
- 例えば、以下のコマンドでGet-ChildItemコマンドレットのパラメータを入力するダイアログを表示できる：
  ```powershell
  $params = Show-Command Get-ChildItem -PassThru
  Get-ChildItem @params
  ```

## Read-Host -Prompt
- Read-Host -Promptを使うと、ユーザーに入力を求めるプロンプトを表示できる。
- 例えば、以下のコマンドでユーザーの名前を入力させることができる：
  ```powershell
  $name = Read-Host -Prompt "あなたの名前を入力してください"
  ```

## $Host.UI.PromptForChoice()
- $Host.UI.PromptForChoice()を使うと、ユーザーに選択肢を提示し、選択させることができる。
- 例えば、以下のコマンドでユーザーに「はい」or「いいえ」を選択させることができる：
  ```powershell
  $options = [System.Management.Automation.Host.ChoiceDescription[]] @("&はい", "&いいえ")
  $choice = $Host.UI.PromptForChoice("タイトル", "メッセージ", $options, 0)
  ```

## [System.Windows.Forms.MessageBox]::Show()
- [System.Windows.Forms.MessageBox]::Show()を使うと、メッセージボックスを表示できる。
- 例えば、以下のコマンドで情報メッセージを表示できる：
  ```powershell
  [System.Windows.Forms.MessageBox]::Show("メッセージ", "タイトル")
  ```

## Write-Progress
- Write-Progressコマンドレットを使うと、処理の進捗状況をプログレスバーで表示できる。
- 例えば、以下のコマンドで0～100%までの進捗を表示できる：
  ```powershell
  for ($i = 0; $i -le 100; $i += 10) {
      Write-Progress -Activity "処理中" -Status "$i%" -PercentComplete $i
      Start-Sleep -Milliseconds 500
  }
  ```

## Write-Host -ForegroundColor/-BackgroundColor
- Write-Hostコマンドレットに-ForegroundColorや-BackgroundColorパラメータを指定すると、テキストの色を変更できる。
- 例えば、以下のコマンドで青色のテキストを表示できる：
  ```powershell
  Write-Host "青色のテキスト" -ForegroundColor Blue
  ```

## PowerShell Formsを使ったGUIアプリケーション
- PowerShell FormsモジュールやWPFを使うことで、本格的なGUIアプリケーションを作成することもできる。
- 例えば、以下のコマンドでフォームを表示できる：
  ```powershell
  Add-Type -AssemblyName System.Windows.Forms
  $form = New-Object System.Windows.Forms.Form
  $form.Text = "PowerShell Formsのサンプル"
  $form.ShowDialog()
  ```

以上、PowerShellでGUIライクな表現を実現するテクニックを紹介した。これらのテクニックを活用することで、PowerShellスクリプトをよりユーザーフレンドリーにすることができる。