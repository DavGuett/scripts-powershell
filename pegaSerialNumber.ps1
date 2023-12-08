$serialNumber = Get-CimInstance Win32_SystemEnclosure | Select-Object serialnumber
Write-Host ($serialNumber.serialnumber)