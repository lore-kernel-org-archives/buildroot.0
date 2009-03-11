From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 11 Mar 2009 13:56:15 +0000 (UTC)
Subject: [Buildroot] [Bug 179] New: Upgrade dropbear to Makefile.autotools.in
Message-ID: <bug-179-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=179

              Host: i686-linux
            Target: arm-softfloat-linux-uclibcgnueabi
           Summary: Upgrade dropbear to Makefile.autotools.in
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: enhancement
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: gustavo at zacarias.com.ar
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created an attachment (id=141)
 --> (https://bugs.busybox.net/attachment.cgi?id=141)
Upgrade dropbear to Makefile.autotools.in

This patch upgrades dropbear to Makefile.autotools.in
It also avoids installing the initscript if there was one before.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
