From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue,  9 Feb 2010 22:26:02 +0000 (UTC)
Subject: [Buildroot] [Bug 1069] New: The AT91BOOTSTRAP makefile contains a
	typo
Message-ID: <bug-1069-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1069

              Host: Ubuntu 9.10
            Target: AT91SAM9G20-EK
             Build: 2010.02
           Summary: The AT91BOOTSTRAP makefile contains a typo
           Product: buildroot
           Version: 2009.11
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: Rob.Alley at navmanwireless.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created an attachment (id=1087)
 --> (https://bugs.busybox.net/attachment.cgi?id=1087)
Patch to correct makefile typo

The rule to copy the resulting binary file into the binary directory had a typo
in the line continuation character that results in a spurious error message
being produced.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
