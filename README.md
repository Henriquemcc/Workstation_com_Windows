[English Version](README.EN.md)

# Workstation com Windows

Este repositório contém os scripts de configuração e instalação dos programas que utilizo em minha máquina com Windows 10.

## Como executar

### 1. Habilite a execução de scripts PowerShell não assinados digitalmente

Devido ao fato destes scripts PowerShell não estarem assinados digitalmente, e o Windows 10 por padrão bloquear a execução de scripts não assinados, será necessário alterar esta configuração.

Para habilitar a execução de scripts PowerShell não assinados, em uma instância do PowerShell rodando como administrador, digite o seguinte comando:

```
set-executionpolicy remotesigned
```

Ou execute o arquivo 'HabilitarExecucaoDeScriptsPowerShell.bat' deste repositório como administrador.

### 2. Executando os scripts PowerShell

#### Script de configuração e instalação dos programas

Para executar o script de configuração e instalação dos programas, em uma instância do PowerShell, rodando como administrador, na pasta onde foi baixado e extraído este repositório, digite o seguinte comando:

```
powershell Instalar.ps1
```

## Scripts

### Script de configuração e instalação dos programas

#### Programas instalados

Este script instala estes programas:

* 7zip
* Audacity
* Balena Etcher
* Blizzard BattleNet
* Canneverbe CDBurnerXP
* Chocolatey
* Discord
* KeePass
* EA Desktop
* Epic Games Launcher
* Git
* GitHub Desktop
* GitHub Cli
* Google Chrome
* Google Drive File Stream
* Gsudo
* JetBrains Intellij IDEA Community
* Malwarebytes
* Microsoft OpenJDK 11
* Microsoft Teams
* Microsoft Visual Studio Code
* Microsoft Visual Studio Community 2019
* Mozilla Firefox ESR
* Nomacs
* Nvidia GeForce Experience
* Paint.Net
* Piriform CCleaner
* PlayStation Remote Play
* Rufus
* Trimble SketchUpMake
* Ubisoft Connect
* Valve Steam
* VideoLAN VLC
* Winget

#### Configurações alteradas

Este script altera as seguintes configurações do registro do Windows:

[Retpoline Spectre Mitigation](https://www.bleepingcomputer.com/news/security/boost-windows-10-performance-with-retpoline-spectre-mitigation/).

[Windows 10 make UAC always require password](https://superuser.com/questions/1085680/windows-10-make-uac-always-require-password).

[How to Fix Windows and Linux Showing Different Times When Dual Booting](https://www.howtogeek.com/323390/how-to-fix-windows-and-linux-showing-different-times-when-dual-booting/#google_ads_iframe_/10518929/tmnp.howtogeek/article_details/a0-p1-s2_1:~:text=Make%20Windows%20Use%20UTC%20Time%20By%20Editing%20the%20Registry).

## Licença

Estes scripts estão licenciados sobre licença [EUROPEAN UNION PUBLIC LICENCE v. 1.2](LICENSE).

Cada programa que será instalado por estes scripts tem sua própria licença. Ao executar estes scripts, você concorda com a licença de cada um desses programas.