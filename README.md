# PS-ActiveDirectory-AzureAD-O365
Management with PowerShell scripts: Active Directory, Azure AD, O365, Exchange Online.

#### 01.Assign-Licenses-To-UserAccounts-O365
- Get or Assign licenses to user accounts with Office 365 PowerShell script from csv file to import.

#### 02.Manage-Permissions-RecipientsMailbox-EXO
- Manage permissions for recipients in Exchange Online. Add multiple users to a shared mailbox.

#### 03.Create-ADUsers
- Create new users in Active Directory with PowerShell script from csv file to import.

#### 04.Create-ADGroups
- Create new groups in Active Directory with PowerShell script from csv file to import.

#### 05.Get-Inactive-ADCompUsers-LastLogon
- *Get-Inactive-ADCompUsers.ps1*: Get objects users and computers inactive in Active Directory with PowerShell script and export to a csv file.
- *Get-Inactivity-ADUsersLastLogon.ps1*: Get the last login of Active Directory users (set the $DaysInactive variable). Search only for enabled AD users and export the output to a csv file.

#### 06.Get-Move-ADComputers
- Get or move computers objects in Active Directory with PowerShell script from csv file to import.

#### 07.Get-DNS-Records-Duplicate-IPs
- Get hostname (DNS Records) of active computers in Active Directory and associated duplicate IPs.

#### 08.Create-Recursive-Directories
- Create batch directories from a csv file recursively in local or shared directories.

#### 09.Get-ADUsers-LastLogon
- Get the last login of all Active Directory users by traversing this query on all available domain controllers, thus ensuring the effectiveness of the LastLogon TimeStamp. Export the output to a .csv file for work later date filtering.

#### 10.Change-Attributes-ADUsers
- Modify Active Directory User Account Attributes, loading a list of users from a CSV file.

#### 11.Manage-LocalUsers-Accounts
- Sample functions for managing Windows local user accounts. Example files of password encryption, to avoid parameterize a password in plain text in a PowerShell script. (function to check script execution privileges "*CheckPrivileges*").

#### 12.Migrate-UserProfile
- Migrate/Copy the most relevant directories from a local or domain user profile to a new computer using ROBOCOPY tool.

#### 13.Encode-Password-Batchfile
- Encode Password in batch file (.bat). A possible way to encode passwords in a batch file and not display in plain text passwords.

#### 14.Get-ADGroups-Inherited
- Get up to 3 levels of nested inheritances in Active Directory groups.

#### 15.Get-Services-RemoteHost
- Get report of all local services and users of remote server computers.

#### 16.Manage-ADResourcesShared
- Management of common shared resources, assignment of resource permissions to AD users. (Makes use of the *NTFSSecurity* module).

#### 17.Join-ComputerToDomain
- Set computer name and join computer to AD domain.

#### 18.CopyUsers-ADGroup-SourceToDestination
- Copy all users from a source group to a target group in Active Directory.

#### 19.ReverseSID-ADUser
- Get AD SamAccountName given your SID.

#### 20.Move-ItemExtension-RecursivePath
- Recursively move files of a given extension from subdirectories to a target root directory.

#### 21.Export-ADObjects-MultipleDomains
- *FullExport-ADObjects.ps1*: Get all objects from all available Active Directory domains and export them in a CSV format (users, groups and computers).
- *Get-AddFQDN-ADComputers.ps1, Set-FQDNToCsv.ps1*: Concatenate attributes Name, Domain and DistinguishedName to establish a FQDN (DNSHostName) for computers objects (non-Windows), add a new column to an existing CSV file and then export it all in a single CSV file.

#### 22.WindowsDefender-Status
- Check the status of the Windows Defender service and components and disable it for security testing to prevent threat detection.

#### 23.AdminLocal-Config
- Disable the default local administrator and create a new user that is part of the local administrators group.

#### 24.Remote-Code-Execution
- Remote Code Execution Options. Execute commands remotely on a Domain Controller using: WMI, WinRM, PowerShell (WMI), PowerShell Remoting.

#### 25.Get-Properties-By-Email
- Get a AD user properties information from the domain email. And get from an array of emails.

#### 26.Get-ADUsers-LastWhenCreated
- Get the AD users created in the last 30 days. We can filter by name with findstr for a more specific result.