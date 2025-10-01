# =========================================================
# ポータブルツール用 PowerShell 起動スクリプト
# ダブルクリックで PATH が通った PowerShell が開く
# =========================================================

# スクリプトのあるフォルダ
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Definition

# PATH に追加
$env:PATH = "$ScriptDir\nvim-win64\bin;$ScriptDir\pandoc-3.8.1;$ScriptDir\PortableGit\cmd;$ScriptDir\gitchx-cli-Windows-amd64;$ScriptDir\zstd-v1.5.7-win64;$ScriptDir\gh_2.81.0_windows_amd64\bin;$env:PATH"

# ツール確認
Write-Host "=== PATH にツールを追加しました ==="
Write-Host "Git: $(git --version)"
Write-Host "Neovim: $(nvim --version | Select-Object -First 1)"
Write-Host "Pandoc: $(pandoc --version | Select-Object -First 1)"
Write-Host "Github CLI: $(gh --version | Select-Object -First 1)"
Write-Host "zstd: $(zstd --version | Select-Object -First 1)"

# gitchx-cli ツールの存在確認
foreach ($tool in "wcat","pdoc","gpush") {
    if (Get-Command $tool -ErrorAction SilentlyContinue) {
        Write-Host "${tool}: PATH に追加済み"
    } else {
        Write-Host "${tool}: 見つかりません"
    }
}

Write-Host ""
Write-Host "PowerShell はこのまま使用可能です。終了するには 'exit' と入力してください。"

