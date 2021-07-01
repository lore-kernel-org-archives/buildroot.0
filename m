From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 01 Jul 2021 10:24:19 +0000
Subject: [Buildroot] [Bug 13886] New: How To Set Up Suddenlink Email
 Settings On Android?
Message-ID: <bug-13886-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13886

            Bug ID: 13886
           Summary: How To Set Up Suddenlink Email Settings On Android?
           Product: buildroot
           Version: 2021.02.3
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: smith8395john at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Setting up Suddenlink.net email manually on Android can seem a bit daunting.
But with the help of the below steps, you can get done with it without any
trouble.
Open Mail app on your Android.
Select Add Account and Enter your email credentials.
Now click on the Manual Setup option.
You need to select IMAP as your account type.
Enter the Suddenlink email settings for IMAP in the given fields.
Incoming Server: imap.suddenlink.net
Security type: SSL/TLS (Accept all certificates)
Port: 993
Once you have entered all the IMAP settings correctly, hit the Next button.
On the next page, you need to configure Suddenlink Outgoing server settings as
follows:
Outgoing (SMTP) server: smtp.suddenlink.net
Security Type: SSL/TLS (Accept all certificates)
Port: 465
Outgoing (SMTP) Roaming Server - Security Type: SSL/TLS, Port:587
Verify the outgoing server settings and hit the Next button.
At last, click on Done to finish the setup.

https://www.emailsupport.us/blog/suddenlink-email-settings/

-- 
You are receiving this mail because:
You are on the CC list for the bug.
