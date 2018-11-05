function touch {
	$version = "v2.3.6"

    $fflag = 1

	$t_curr_ext = ""
	
	For($i=0; $i -lt $args.Length; $i++){
		if(($args[$i] -eq "-e") -or ($args[$i] -eq "--extn")){
			if($args[$i + 1] -like ".*")
			{
				$t_curr_ext = $args[$i + 1] 
			} 
			else {
				throw "Invalid Extension : Please check parameters after -e flags"
				break
			}
			$i += 2
		}
		# Help Menu display
		elseif(($args[$i] -eq "-h") -or ($args[$i] -eq "--help")) {
			# TODO: Formatting
			Write-Output "ZRTHXN Labs Touch Version $version"
			Write-Output "Custom Command Line Tools [PowerShell]"
			Write-Output ""
			Write-Output "  Touch Help"
			Write-Output ""
			Write-Output "      Syntax"
            Write-Output "      >   touch [flags] [extns] [args]"
            Write-Output ""
			Write-Output "  The following flags are currently available with Touch"
			Write-Output "  --help or -h :      Display Help Menu"
			Write-Output "  --extn or -e :      Use a common extension for all the following files. Supply the extension after the flag. Eg : touch -e .txt file_1 file_2 file_3"
			Write-Output ""
            $fflag = 0
            break
		}
		# Version Display
		elseif(($args[$i] -eq "-v") -or ($args[$i] -eq "--version")) {
			Write-Output "ZRTHXN Labs Touch Version $version"
            $fflag = 0
            break
		}
		# Updating
		elseif($args[$i] -eq "update") {
			$cdir = Get-Location
			Set-Location -Path "C:\Users\Alisamar\Documents\WindowsPowerShell"
			Start-Sleep -Milliseconds 250

			git pull origin master

			Set-Location -Path $cdir

			. $profile

			Write-Output "ZRTHXN Labs"
			Write-Output "Updated : Touch Version $version"
			Write-Output ""
            $fflag = 0
            break
		}

		# If file has to be written, file write mode true
		if($fflag -eq 1)
		{
			if($args[$i] -like "*/*")
			{
				throw "Invalid File Name : Cannot create folders with Touch"
				break
			}
			else
			{
				set-content -Path ($args[$i] + $t_curr_ext) -Value ($null)
			}
		}		
	}
	
	# If file was written, show Touch Branding
	if($fflag -eq 1)
	{
		Write-Output "ZRTHXN Labs Touch Version $version"
		Write-Output "Custom Command Line Tools [PowerShell]"
		Write-Output ""
	}
}