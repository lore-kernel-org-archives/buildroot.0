From: fritz huber <FritzHuber_mailinglist@gmx.de>
Date: Wed, 16 May 2007 11:59:57 +0200
Subject: [Buildroot] sshd always wants to change password
Message-ID: <20070516095957.296670@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello

I'm working with buildroot from 2006-04-18 and kernel 2.6.12 on a ARM9 system. Now i have a problem with the ssh deamon. I would like to use ssh with classic login. My problem:

When i would like to login with a non-root user:

sshd at 10.0.0.190's password: 
WARNING: Your password has expired.
You must change your password now and login again!
passwd: This applet requires root priviledges!
Connection to 10.0.0.190 closed.

login as root user:

root at 10.0.0.190's password: 
WARNING: Your password has expired.
You must change your password now and login again!
Changing password for root
Enter the new password (minimum of 5, maximum of 8 characters)
Please use a combination of upper and lower case letters and numbers.
Enter new password: 
Bad password: too simple.

Warning: weak password (continuing).
Re-enter new password: 
Password changed.
Connection to 10.0.0.190 closed.


I got no chance to login without changing the password. Any idea? Thanks a lot.

Best regards,
Fritz Huber
-- 
GMX FreeMail: 1 GB Postfach, 5 E-Mail-Adressen, 10 Free SMS.
Alle Infos und kostenlose Anmeldung: http://www.gmx.net/de/go/freemail
