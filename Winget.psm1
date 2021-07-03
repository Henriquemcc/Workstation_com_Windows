sing module "./Download.psm1"

function Install-Winget
{
	Install-Microsoft-VC-Libs

	$instalador = @{
		url = "https://github.com/microsoft/winget-cli/releases/download/v1.0.11692/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle"
		checksum = "2414D8DC102296BAB4081F126DD9C4FFA878F45193BAF1F96EC881AB7FAFE35A"
		checksumType = "SHA256"
	}

	$caminhoArquivoBaixado = Get-WebFile -url $instalador.url -checksum $instalador.checksum -tipoDeChecksum $checksumType

	Add-AppPackage -Path $caminhoArquivoBaixado
}

function Install-Microsoft-VC-Libs
{
	$instalador_x86 = @{
		url = "https://aka.ms/Microsoft.VCLibs.x86.14.00.Desktop.appx"
		checksum = "EB0E38A8958DF9E4576089851D846473D04204C62D69F5AFACFD67D69D74D5D1"
		checksumType = "SHA256"
	}

	$instalador_amd64 = @{
		url = "https://aka.ms/Microsoft.VCLibs.x64.14.00.Desktop.appx"
		checksum = "6602159C341BAFEA747D0EDF15669AC72DF8817299FBFAA90469909E06794256"
		checksumType = "SHA256"
	}

	$instalador = $instalador_x86

	if($env:PROCESSOR_ARCHITECTURE -eq "AMD64")
	{
		$instalador = $instalador_amd64
	}

	$caminhoArquivoBaixado = Get-WebFile -url $instalador.url -checksum $instalador.checksum -tipoDeChecksum $checksumType

	Add-AppxPackage -Path $caminhoArquivoBaixado
}

Export-ModuleMember -Function Install-Winget