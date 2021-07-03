function Get-WebFile
{
	param(
		[parameter(Mandatory=$false)][String]$caminhoCompletoArquivo,
		[parameter(Mandatory=$true)][String]$url,
		[parameter(Mandatory=$false)][String]$checksum,
		[parameter(Mandatory=$false)][String]$tipoDeChecksum
	)

	if($caminhoCompletoArquivo -eq $null -or $caminhoCompletoArquivo.Length -eq 0)
	{
		$caminhoCompletoArquivo = Join-Path -Path $env:TEMP -ChildPath ([System.IO.Path]::GetFileName($url))
	}

	Invoke-WebRequest -Uri $url -OutFile $caminhoCompletoArquivo

	if($checksum -ne $null -and $checksum.Length -gt 0 -and $tipoDeChecksum -ne $null -and $tipoDeChecksum.Length -gt 0)
	{
		$checksumArquivoBaixado = Get-FileHash -Path $caminhoCompletoArquivo -Algorithm $tipoDeChecksum

		if($checksum -ne $checksumArquivoBaixado)
		{
			throw "O hash do arquivo baixado não é igual ao hash especificado"
		}
	}

	return $caminhoCompletoArquivo
}

Export-ModuleMember -Function Get-WebFile