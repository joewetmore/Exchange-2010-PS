You can use the GUI to add Full Access, or the powershell command for exch2007, add-permission can be used to update mailbox perms.
 
Example:
 
Add-MailboxPermission -Identity "John Doe" -User yli -Accessright Fullaccess
Add-MailboxPermission -Identity craig -User ivwsus.riva.svc -Accessright Fullaccess
Add-MailboxPermission -Identity bryan -User ivwsus.riva.svc -Accessright Fullaccess
Add-MailboxPermission -Identity sean -User ivwsus.riva.svc -Accessright Fullaccess
Add-MailboxPermission -Identity thomas -User ivwsus.riva.svc -Accessright Fullaccess



 
 
A command that added the account to all mailboxes would look like:
 
Get-mailboxdatabase -server "ivmbx01" | Add-MailboxPermission -user SERVICEACCTNAME -accessright fullaccess
