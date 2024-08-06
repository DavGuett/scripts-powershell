Connect-ExchangeOnline
$usuarios = Import-Csv -Path "C:\temp\teste.CSV"
$mensagem = "Testando encaminhamento e mensagem automática"
foreach ($usuario in $usuarios) {
    if ($null -ne $usuario.EmailUsuario -and $null -ne $usuario.EmailResponsavel -and $usuario.EmailUsuario -ne "" -and $usuario.EmailResponsavel -ne "") {
        try {
            # Configurar encaminhamento de e-mail
            Set-Mailbox -Identity $usuario.EmailUsuario -ForwardingSMTPAddress $usuario.EmailResponsavel -DeliverToMailboxAndForward $true
            
            # Configurar mensagem automática
            Set-MailboxAutoReplyConfiguration -Identity $usuario.EmailUsuario -AutoReplyState Enabled -InternalMessage $mensagem -ExternalMessage $mensagem

            Write-Host "Configuração concluída para $($usuario.EmailUsuario)"
        } catch {
            Write-Host "Erro ao processar $($usuario.EmailUsuario): $_"
        }
    } else {
        Write-Host "Pulando usuário com dados inválidos: $($usuario | Out-String)"
    }
}