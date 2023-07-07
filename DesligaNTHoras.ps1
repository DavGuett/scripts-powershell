$Tempo = Read-Host -Prompt "Quanto tempo até o desligamento (em horas)?"
$Horas = [int]$Tempo * 3600
Write-Host $Horas
shutdown /s /t $Horas