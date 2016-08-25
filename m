From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 25 Aug 2016 23:28:21 +0000
Subject: [Buildroot] [Bug 9196] New: raspberry pi 3 default build seem broken
Message-ID: <bug-9196-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9196

            Bug ID: 9196
           Summary: raspberry pi 3 default build seem broken
           Product: buildroot
           Version: 2016.05
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: mikhail_tchernychev at yahoo.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Created attachment 6626
  --> https://bugs.busybox.net/attachment.cgi?id=6626&action=edit
config file

Hi,

I was able to compile build root for RPi 3 default configuration and it
apparently boots but when I enter login "root" and blank password id does
allow me to login. So far whatever I did I was not able to login, even 
I specified "root" password in the configuration.   My .config file is
attached.

Also I tried to compile systemd for RPi3 but I even did not get login screen
(I had to disable post-build script because it was not finding inittab)

I am willing to troubleshoot, but don't know how :(

thank you

Mikhail

-- 
You are receiving this mail because:
You are on the CC list for the bug.
