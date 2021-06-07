<#
    Export all Active Directory equipment type objects.
    For NON WINDOWS computers that do not have value set in the attribute "DNSHostName" we concatenate the fields Name, Domain and DistinguishedName 
    to create it completely (FQDN) and then create a new csv file the DNSHostName field for all computers objects.
#>
# Import-Module ActiveDirectory

Function Get-AddFQDN-ADComputers {

    param (
        [Parameter(Mandatory=$True)]
        [string]$CsvLocalPath,
        [Parameter(Mandatory=$True)]
        [string]$CsvDestinationPath
    )

	$CsvTemp = "$CsvLocalPath\ADComputers_temp.csv"
	$CsvADComputers = "$CsvLocalPath\ADComputers.csv"
	
	if ( (Test-Path "$CsvTemp" -PathType leaf) -or (Test-Path "$CsvADComputers" -PathType leaf) ) {
		Remove-Item -Path $CsvTemp -Force
        Remove-Item -Path "$CsvADComputers" -Force
	}
	
	# Create the initial csv file.
	Set-Content -Path $CsvTemp -Value '"DistinguishedName","DNSHostName","Enabled","IPv4Address","LastLogonDate","Location","Name","ObjectClass","ObjectGUID","OperatingSystem","OperatingSystemVersion","SamAccountName","SID","UserPrincipalName","whenCreated"'

# In the case of multiple domains or subdomains we can add them here.
    $csv = @"
"dc";"domain"
"DC1.subdomain1.domain.local";"DC=subdomain1,DC=domain,DC=local"
"DC1.subdomain2.domain.local";"DC=subdomain2,DC=domain,DC=local"
"@ | ConvertFrom-CSV -Delimiter ';'

    $csv | ForEach-Object {

        $dc = $_."dc"
        $domain = $_."domain"

        $ADComputers = Get-ADComputer -Filter * -Server $dc -SearchBase $domain -Properties `
        Name,DistinguishedName,DNSHostName,IPv4Address,Enabled,LastLogonDate,whenCreated,OperatingSystem,OperatingSystemVersion,Location,ObjectGUID,SID
        $ADComputers | ConvertTo-Csv -NoTypeInformation | Select-Object -Skip 1 | Add-Content $CsvTemp -Encoding UTF8
	}
	
	# Add DNSHostName value in all computers objects
	Import-Csv -Path $CsvTemp | ForEach-Object {

        $DistinguishedName = $_."DistinguishedName"
        $DNSHostName = $_."DNSHostName"
        $Enabled = $_."Enabled"
        $IPv4Address = $_."IPv4Address"
        $LastLogonDate = $_."LastLogonDate"
        $Location = $_."Location"
        $Name = $_."Name"
        $ObjectGUID = $_."ObjectGUID"
        $OperatingSystem = $_."OperatingSystem"
        $OperatingSystemVersion = $_."OperatingSystemVersion"
        $SID = $_."SID"
        $whenCreated = $_."whenCreated"
		
	# Calculate the DNSHostName attribute if is empty. Select the substring ignoring "DC=" and convert the entire string to lower case ToLower.
        $dn = $DistinguishedName.Split(",")
        $Domain = [System.String]::Concat($dn[-3].Substring(3), ".", $dn[-2].Substring(3), ".", $dn[-1].Substring(3))
        $FQDN = ($Name + "." + $Domain).ToLower()
        
	# CSV fields, where DNSHostName will be the FQDN created earlier.
        $CsvTemp | Select-Object `
            @{Name='DistinguishedName';Expression={$DistinguishedName}},`
            @{Name='DNSHostName';Expression={$FQDN}},`
            @{Name='Enabled';Expression={$Enabled}},`
            @{Name='IPv4Address';Expression={$IPv4Address}},`
            @{Name='LastLogonDate';Expression={$LastLogonDate}},`
            @{Name='Location';Expression={$Location}},`
            @{Name='Name';Expression={$Name}},` 
            @{Name='ObjectGUID';Expression={$ObjectGUID}},` 
            @{Name='OperatingSystem';Expression={$OperatingSystem}},` 
            @{Name='OperatingSystemVersion';Expression={$OperatingSystemVersion}},`
            @{Name='SID';Expression={$SID}},` 
            @{Name='whenCreated';Expression={$whenCreated}} `
            | Export-Csv -Path "$CsvADComputers" -Encoding UTF8 -Append -NoTypeInformation
    }
	
	Copy-Item -Path "$CsvADComputers" -Destination $CsvDestinationPath -Force
	Remove-Item -Path "$CsvTemp" -Force
	Remove-Item -Path "$CsvADComputers" -Force
}

Get-AddFQDN-ADComputers -CsvLocalPath "C:\AD\export" -CsvDestinationPath "\\shared\export"
