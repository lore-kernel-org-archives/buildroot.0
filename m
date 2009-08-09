From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun,  9 Aug 2009 01:01:07 +0000 (UTC)
Subject: [Buildroot] [Bug 553] New: Wrong DirectFB ps2mouse limitation
Message-ID: <bug-553-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=553

              Host: x86-64
            Target: sh4
           Summary: Wrong DirectFB ps2mouse limitation
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: enhancement
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: lionel.landwerlin at openwide.fr
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


In Config.in of DirectFB, ps2mouse is only limited to x86 and x86-64. But the
ps2mouse driver also works with usb mouses and so is not only limited to PC
architecture.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
