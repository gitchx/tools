# =========================================================
# �|�[�^�u���c�[���p PowerShell �N���X�N���v�g
# �_�u���N���b�N�� PATH ���ʂ��� PowerShell ���J��
# =========================================================

# �X�N���v�g�̂���t�H���_
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Definition

# PATH �ɒǉ�
$env:PATH = "$ScriptDir\nvim-win64\bin;$ScriptDir\pandoc-3.8.1;$ScriptDir\PortableGit\cmd;$ScriptDir\gitchx-cli-Windows-amd64;$ScriptDir\zstd-v1.5.7-win64;$ScriptDir\gh_2.81.0_windows_amd64\bin;$env:PATH"

# �c�[���m�F
Write-Host "=== PATH �Ƀc�[����ǉ����܂��� ==="
Write-Host "Git: $(git --version)"
Write-Host "Neovim: $(nvim --version | Select-Object -First 1)"
Write-Host "Pandoc: $(pandoc --version | Select-Object -First 1)"
Write-Host "Github CLI: $(gh --version | Select-Object -First 1)"
Write-Host "zstd: $(zstd --version | Select-Object -First 1)"

# gitchx-cli �c�[���̑��݊m�F
foreach ($tool in "wcat","pdoc","gpush") {
    if (Get-Command $tool -ErrorAction SilentlyContinue) {
        Write-Host "${tool}: PATH �ɒǉ��ς�"
    } else {
        Write-Host "${tool}: ������܂���"
    }
}

Write-Host ""
Write-Host "PowerShell �͂��̂܂܎g�p�\�ł��B�I������ɂ� 'exit' �Ɠ��͂��Ă��������B"

