function Send-EMAIL
{
    [CmdletBinding()]
    Param (
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [string]$fromAddress = ((Get-CimInstance win32_computersystem).Username.split("\")[1] | Get-ADUser -Properties givenname, surname, mail).mail,
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [ValidatePattern("\w+@\w+\.\w+|\w+\.\w+@\w+\.\w+\.\w+")]
        [string]$SendTo,
        [Parameter()]
        [ValidatePattern("\w+@\w+\.\w+|\w+\.\w+@\w+\.\w+\.\w+")]
        [string[]]$CC,
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [string]$Subject,
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [string]$emailBody,
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [string]$SMTPServer = "yourmail-Server1.Fully.QualifiedDomain.com" 
        ) 

	#################################### 
	
	$message = new-object System.Net.Mail.MailMessage
	$message.From = $fromAddress
	$message.To.Add($SendTo)
	$message.To.Add($fromAddress)
	$message.IsBodyHtml = $True
	$message.Subject = $Subject
	$message.body = $emailBody
	$smtp = new-object Net.Mail.SmtpClient($SMTPServer)
	$smtp.Send($message)
	
	$message.Dispose();
	$smtp.Dispose()
}


Export-ModuleMember -Function Send-EMAIL
