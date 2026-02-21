# ==== UTF-8 ====
[Console]::InputEncoding  = [Console]::OutputEncoding = [Text.UTF8Encoding]::new()

# ==== PSReadLine (smart suggestions for PowerShell 7) ====
Import-Module PSReadLine
try {
  Set-PSReadLineOption -PredictionSource HistoryAndPlugin
  Set-PSReadLineOption -PredictionViewStyle ListView
} catch {
  Set-PSReadLineOption -EditMode Windows
}
Set-PSReadLineOption -HistorySearchCursorMovesToEnd
Set-PSReadLineKeyHandler -Key Ctrl+r -Function ReverseSearchHistory

# ==== Icons ====
Import-Module Terminal-Icons

# ==== zoxide (lightning-fast directory jumping) ====
Invoke-Expression (& { (zoxide init powershell | Out-String) })

# ==== FZF shortcuts ====
function ff { Get-ChildItem -File -Recurse | ForEach-Object FullName | fzf | ForEach-Object { if ($_) { ii $_ } } }
function fdz { Get-ChildItem -Directory -Recurse | ForEach-Object FullName | fzf | ForEach-Object { if ($_) { Set-Location $_ } } }

# ==== Aliases for eza / bat / fd / rg ====
Set-Alias ls eza
function ll { eza -l --git --icons --group-directories-first }
function la { eza -la --git --icons --group-directories-first }
function lt { eza -T --icons --git-ignore }
Set-Alias cat bat
Set-Alias find fd
Set-Alias grep rg

# ==== Common Git shortcuts ====
function gst { git status }
function gco { git checkout $args }
function gcm { git commit -m $args }
function gpl { git pull }
function gps { git push }

# ==== Oh-My-Posh theme (using the official theme path environment variable) ====
$env:VIRTUAL_ENV_DISABLE_PROMPT = 1  # Let Oh-My-Posh handle the Python venv name display
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\clean-detailed.omp.json" | Invoke-Expression

fastfetch
