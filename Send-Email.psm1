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
        [string]$SMTPServer = "yourmail-Server1.Fully.QualifiedDomain.com",
        [parameter()]
        [AllowNull()]
        [String[]]$EmailAttachment
    ) 

    #################################### 
	
    $message = new-object System.Net.Mail.MailMessage
    $message.From = $fromAddress
    $message.To.Add($SendTo)
    $message.IsBodyHtml = $True
    $message.Subject = $Subject
    $message.body = $emailBody
    if ($CC)
    {
        $message.To.Add($CC)
    }
    if ($EmailAttachment)
    {
        $Attachment = new-object Net.Mail.Attachment($EmailAttachment)
        $message.Attachments.Add($Attachment)
    }

    $smtp = new-object Net.Mail.SmtpClient($SMTPServer)
    $smtp.Send($message)
	
    $message.Dispose();
    $smtp.Dispose()
}


Export-ModuleMember -Function Send-EMAIL
