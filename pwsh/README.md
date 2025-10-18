# 🧰 Install PowerShell 7

```shell
> winget install --id Microsoft.PowerShell -e
```

# 📦 Install modules and CLI tools

```shell
> ./install.ps1
```

# ⚙️ Check and configure `$PROFILE`

1. Verify if your profile exists
```shell
> Test-Path $PROFILE
```
- If it returns **True**, your profile file already exists.
- If it returns **False**, create one:
```shell
> New-Item -Path $PROFILE -ItemType File -Force
```

2. Open `$PROFILE` for editing
```shell
> notepad $PROFILE
```

3. Paste [Microsoft.PowerShell_profile.ps1](./Microsoft.PowerShell_profile.ps1) to $PROFILE