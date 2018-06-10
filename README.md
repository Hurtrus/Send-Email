# Send-EMAIL

## SYNOPSIS
Function used to send emails from PowerShell Scripts. Set the ($SendTo, $CC, $fromAddress,$Subject, and $emailBody) variables within your script or function then call this function to send an email.

## SYNTAX

```
Send-EMAIL [[-fromAddress] <String>] [[-SendTo] <String[]>] [[-CC] <String[]>] [[-Subject] <String>]
 [[-emailBody] <String>] [[-SMTPServer] <String>] [<CommonParameters>]
```

## DESCRIPTION
Use the Send-Email function from with in your script. 
You will need to supply the $SendTo, $CC, $Subject, $Email Body
There are two full use examples. Depending on how you include the function, you will need to use the correct method.

## EXAMPLES
### Example $SMTPServer
```powershell
$SMTPServer = "yourmail-Server1.Fully.QualifiedDomain.com"

```

Knowing this setting is a prerequisite to using this function. 
You will need to define values for the $SMTPServer variable each time you use the function. 
If you hard set the $SMTPServer value in the Param block, you will not need to define values when using the function. To hard set the value in the Param block:

        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$SMTPServer,
		
 to

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [string]$SMTPServer = "yourmail-Server1.Fully.QualifiedDomain.com",


If you hard set the $SMTPServer value in the Param block, you will not need to specify it again when using the function.


### Example $fromAddress
```powershell
$fromAddress = "sender@email.com"
-or-
$fromAddress = "My Groups Name <sender@email.com>"
```

Create the variable $fromAddress with a valid email address of the person or team from whom this is being sent. 
*If* a variable is not specified it will default to the executor of the script's normal account.


### Example $SendTo
```powershell
$SendTo = "recipient@email.com"
```

Create the variable $SendTo with a valid email address of recipients. Place this before the line calling Send-Email
Minimum of one $SendTo email address is required.

### Example $CC
```powershell
$CC = "recipiantcc1@email.com"

-or-

$CC = "ccrecipiant1@email.com","ccrecipiant2@email.com"

```

Not required, accepts $null, single, or multiple Carbon Copy recipients.

### Example $Subject
```powershell
$Subject = "Account Details"
```

Create the variable $Subject with the Subject line you with to send with the email

### Example if you are importing the module
```powershell
Import-Module Send-Email

$EmailProperties = @{
'SMTPServer' = "yourmail-Server1.Fully.QualifiedDomain.com"
'fromAddress' = "scott@Hurtrus.systems"
'SendTo' = "scott@Hurtrus.systems"
#'CC' = "ccrecipiant1@email.com","ccrecipiant2@email.com"
$Subject = "Account Details"
'emailbody' = "     
<h1> Good Music Systems </h1><br>
<h2>New User Account Request </h2><br>
####################################<br><br>

<u>User Name</u>:<b> Emenem </b><br>
<u>Password</u>:<b> Standing_Here_Watching_U_Burn  </b><br>
<br>
Name: Marshall Bruce Mathers III <br>
Manager: Dr.Dre <br>
Home: Detroit, Michigan <br>
Interactive Mode: InteractiveModeName is DISABLED <br>
Password Expiration Mode: Never Fools - I am gonna live foreva <br>"
}

Send-EMAIL @EmailProperties

```

### Example if the module is included in your script
```powershell

$SMTPServer = "yourmail-Server1.Fully.QualifiedDomain.com"
$fromAddress = "My Groups Name <sender@email.com>"
$SendTo = "recipient@email.com"
$CC = "ccrecipiant1@email.com","ccrecipiant2@email.com"
$Subject = "Account Details"
$emailbody = "    
<h1> Good Music Systems </h1><br>
<h2>New User Account Request </h2><br>
####################################<br><br>

<u>User Name</u>:<b> Snoop Dogg </b><br>
<u>Password</u>:<b> Nuthin_but_a_GThang </b><br>
<br>
Name: Calvin Cordozar Broadus, Jr. <br>
Manager: Dr.Dre <br>
Home: Long Beach, California <br>
Interactive Mode: Drop it like its hot <br>
Password Expiration Mode: Through the clouds <br>"


Send-EMAIL

```

## PARAMETERS

### -fromAddress
Not required, but available to be defined

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SendTo
Required variable, must be a valid email address

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -CC
Create the variable $CC with a valid email address of Carbon Copy recipients.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Subject
Create the variable $Subject with the Subject line you with to send with the email

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -emailBody
Accepts HTML input for body of email

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SMTPServer
Pre-populate with the current send server for your email system. Override only if necessary.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).


## NOTES
I use this to send emails to users when I have created them a Service Account or Super User Account. It contains the username, password, and instructions on how to log into the new account. Also could be used for Password resets when you need to send the user information on the Password Reset details.

If you copy/paste the function into your script/function you can set variables and it will work by just calling the function.
If you import the function into your script/function you will need to use the Splatting method and then call the " Send-Email @Parameters " method


