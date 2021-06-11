[Versão em Português](README.md)

# Workstation with Windows

This repository contains the setup and installation scripts for the programs I use on my Windows 10 machine.

## How to run

### 1. Enable running unsigned PowerShell scripts

Because these PowerShell scripts are not digitally signed, and Windows 10 by default blocks unsigned scripts from running, you will need to change this setting.

To enable execution of unsigned PowerShell scripts, on an instance of PowerShell running as an administrator, enter the following command:

```
set-executionpolicy remotesigned
```

Or run the file 'EnablerExecucaoDeScriptsPowerShell.bat' from this repository as an administrator.

### 2. Running the PowerShell Scripts

#### Script for configuration and installation of programs

To run the configuration and installation script of the programs, in a PowerShell instance, running as an administrator, in the folder where this repository was downloaded and extracted, type the following command:

```
powershell Instalar.ps1
```

## Scripts

### Script for configuration and installation of programs

#### Installed programs

This script installs those programs:

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

#### Settings changed

This script changes the following Windows registry settings:

[Retpoline Spectre Mitigation](https://www.bleepingcomputer.com/news/security/boost-windows-10-performance-with-retpoline-spectre-mitigation/).

[Windows 10 make UAC always require password](https://superuser.com/questions/1085680/windows-10-make-uac-always-require-password).

[How to Fix Windows and Linux Showing Different Times When Dual Booting](https://www.howtogeek.com/323390/how-to-fix-windows-and-linux-showing-different-times-when-dual-booting/#google_ads_iframe_/10518929/tmnp.howtogeek/article_details/a0-p1-s2_1:~:text=Make%20Windows%20Use%20UTC%20Time%20By%20Editing%20the%20Registry).

## License

These scripts are licensed under license [EUROPEAN UNION PUBLIC LICENCE v. 1.2](LICENSE).

Each program that will be installed by these scripts has its own license. By running these scripts, you agree to the license of each of these programs.