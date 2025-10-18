Set-ExecutionPolicy RemoteSigned -Scope CurrentUser

# ==== Install required PowerShell modules ====
Install-Module Terminal-Icons -Scope CurrentUser -Force
Install-Module PSReadLine -Scope CurrentUser -Force

# ==== Install essential CLI tools ====
winget install JanDeDobbeleer.OhMyPosh -s winget
winget install ajeetdsouza.zoxide
winget install sharkdp.eza
winget install sharkdp.bat
winget install sharkdp.fd
winget install BurntSushi.ripgrep
winget install fzf
winget install Git.Git