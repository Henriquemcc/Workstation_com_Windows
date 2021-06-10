class UriComponents
{
    [String]$authority
    [string]$baseOfAbsolutePath

    UriComponents([String]$authority, [string]$baseOfAbsolutePath)
    {
        $this.authority = $authority
        $this.baseOfAbsolutePath = $baseOfAbsolutePath
    }

    [Boolean]
    ValidarUri([Uri]$uriASerValidado)
    {
        $ehValido = $true

        if (-not $this.authority.Equals($uriASerValidado.Authority))
        {
            $ehValido = $false
        }

        if (-not $uriASerValidado.AbsolutePath.StartsWith($this.baseOfAbsolutePath))
        {
            $ehValido = $false
        }

        return $ehValido
    }
}

class WingetPackage
{
    [String]$name
    [UriComponents]$uriComponents

    WingetPackage([String]$name, [UriComponents]$uriComponents)
    {
        $this.name = $name
        $this.uriComponents = $uriComponents
    }

    [System.Array]
    GetWingetRetrievedUri()
    {
        $urlDoPacote = New-Object -TypeName "System.Collections.ArrayList"
        $comecoStringUrlPacote = "Download Url: "
        $informacoesDoPacote = Invoke-Expression "winget show $( $this.name )"
        foreach ($informacao in $informacoesDoPacote)
        {
            if ( $informacao.Contains($comecoStringUrlPacote))
            {
                $posicaoInicioUrlDoPacote = $informacao.IndexOf($comecoStringUrlPacote) + $comecoStringUrlPacote.Length
                $urlDoPacote.Add($informacao.Substring($posicaoInicioUrlDoPacote))
            }
        }

        return $urlDoPacote.ToArray()
    }

    [Boolean]
    ValidateWingetRetrievedUri()
    {
        $ehValido = $true
        $urisRetrievedFromWinget = $this.GetWingetRetrievedUri()
        foreach ($uri in $urisRetrievedFromWinget)
        {
            if (-not $this.uriComponents.ValidarUri($uri))
            {
                $ehValido = $false
                break
            }
        }

        return $ehValido
    }

    [Void]
    Install()
    {
        if (-not $this.ValidateWingetRetrievedUri())
        {
            throw "Invalid Winget retrieved uri"
        }
        Invoke-Expression "winget install $( $this.name )"
        #Write-Host "winget install $($this.name)"
    }
}

$pacotesWinget = @(
[WingetPackage]::new("7zip.7zip",[UriComponents]::new("www.7-zip.org", "/a/")),

[WingetPackage]::new("Audacity.Audacity",[UriComponents]::new("github.com", "/audacity/audacity/releases/download/")),

[WingetPackage]::new("Balena.Etcher",[UriComponents]::new("github.com", "/balena-io/etcher/releases/download/")),

[WingetPackage]::new("Blizzard.BattleNet",[UriComponents]::new("dist.blizzard.com", "/downloads/bna-installers/")),

[WingetPackage]::new("Canneverbe.CDBurnerXP",[UriComponents]::new("download.cdburnerxp.se", "/msi/")),

[WingetPackage]::new("Discord.Discord",[UriComponents]::new("dl.discordapp.net", "/distro/app/stable/win/")),

[WingetPackage]::new("DominikReichl.KeePass",[UriComponents]::new("sourceforge.net", "/projects/keepass/files/")),

[WingetPackage]::new("ElectronicArts.EADesktop",[UriComponents]::new("origin-a.akamaihd.net", "/EA-Desktop-Client-Download/installer-releases/")),

[WingetPackage]::new("EpicGames.EpicGamesLauncher",[UriComponents]::new("epicgames-download1.akamaized.net", "/Builds/UnrealEngineLauncher/Installers/Win32/")),

[WingetPackage]::new("Git.Git",[UriComponents]::new("github.com", "/git-for-windows/git/releases/download/")),

[WingetPackage]::new("GitHub.GitHubDesktop",[UriComponents]::new("desktop.githubusercontent.com", "/releases/")),

[WingetPackage]::new("GitHub.cli",[UriComponents]::new("github.com", "/cli/cli/releases/download/")),

[WingetPackage]::new("Google.Chrome",[UriComponents]::new("dl.google.com", "/edgedl/chrome/install/")),

[WingetPackage]::new("Google.DriveFileStream",[UriComponents]::new("dl.google.com", "/drive-file-stream/")),

[WingetPackage]::new("JetBrains.IntelliJIDEA.Community",[UriComponents]::new("download.jetbrains.com", "/idea/")),

[WingetPackage]::new("Malwarebytes.Malwarebytes",[UriComponents]::new("data-cdn.mbamupdates.com", "/web/mb4-setup-consumer/")),

[WingetPackage]::new("Microsoft.OpenJDK.11",[UriComponents]::new("download.visualstudio.microsoft.com", "/download/pr/")),

[WingetPackage]::new("Microsoft.Teams",[UriComponents]::new("statics.teams.cdn.office.net", "/production-windows")),

[WingetPackage]::new("Microsoft.VisualStudioCode",[UriComponents]::new("az764295.vo.msecnd.net", "/stable/")),

[WingetPackage]::new("Microsoft.VisualStudio.2019.Community",[UriComponents]::new("download.visualstudio.microsoft.com", "/download/pr/")),

[WingetPackage]::new("Mozilla.FirefoxESR",[UriComponents]::new("download-installer.cdn.mozilla.net", "/pub/firefox/releases/")),

[WingetPackage]::new("Nvidia.GeForceExperience",[UriComponents]::new("us.download.nvidia.com", "/GFE/GFEClient/")),

[WingetPackage]::new("Piriform.CCleaner",[UriComponents]::new("download.ccleaner.com", "")),

[WingetPackage]::new("PlayStation.PSRemotePlay",[UriComponents]::new("remoteplay.dl.playstation.net", "/remoteplay/module/win/")),

[WingetPackage]::new("Rufus.Rufus",[UriComponents]::new("github.com", "/pbatard/rufus/releases/download/")),

[WingetPackage]::new("Trimble.SketchUpMake",[UriComponents]::new("www.sketchup.com", "/sketchup/2017/en/")),

[WingetPackage]::new("Ubisoft.Connect",[UriComponents]::new("ubistatic3-a.akamaihd.net", "/orbit/launcher_installer/UbisoftConnectInstaller.exe")),

[WingetPackage]::new("Valve.Steam",[UriComponents]::new("steamcdn-a.akamaihd.net", "/client/installer/SteamSetup.exe")),

[WingetPackage]::new("VideoLAN.VLC",[UriComponents]::new("download.videolan.org", "/vlc/")),

[WingetPackage]::new("gerardog.gsudo",[UriComponents]::new("github.com", "/gerardog/gsudo/releases/download/")),

[WingetPackage]::new("nomacs.nomacs",[UriComponents]::new("github.com", "/nomacs/nomacs/releases/download/"))

)

function InstalarWinget
{
    $url = "https://github.com/microsoft/winget-cli/releases/download/v1.0.11451/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.appxbundle"
    Invoke-WebRequest -Uri $url -OutFile ([System.IO.Path]::GetFileName($url))
    Add-AppxPackage -Path ([System.IO.Path]::GetFileName($url))
    RecarregarVariaveisDoSistema
}

function RecarregarVariaveisDoSistema
{
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path", "Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path", "User")
}

function InstalarChocolatey
{
    Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
    RecarregarVariaveisDoSistema
}

function InstalarProgramasChocolatey
{
    choco install paint.net --yes
}

function InstalarProgramasWinget
{

    foreach ($pacote in $pacotesWinget)
    {
        try
        {
            $pacote.Install()
        }
        catch
        {
            Write-Host $_
        }
    }
}

function ConfigurarWindowsUserAccountControl
{
    reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v ConsentPromptBehaviorAdmin /t REG_DWORD /d 1 /f
}

function ConfigurarFusoHorario
{
    reg add "HKLM\SYSTEM\CurrentControlSet\Control\TimeZoneInformation" /v RealTimeIsUniversal /t REG_QWORD /d 1
}

function ConfigurarGerenciamentoDeMemoria
{
    reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v FeatureSettingsOverride /t REG_DWORD /d 0x400
    reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v FeatureSettingsOverrideMask /t REG_DWORD /d 0x400
}

function Main
{
    InstalarChocolatey
    InstalarWinget
    InstalarProgramasChocolatey
    InstalarProgramasWinget
    ConfigurarWindowsUserAccountControl
    ConfigurarFusoHorario
    ConfigurarGerenciamentoDeMemoria
}

Main

