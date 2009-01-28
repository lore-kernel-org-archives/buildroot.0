From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 28 Jan 2009 11:39:56 +0000 (UTC)
Subject: [Buildroot] [Bug 77] New: Enable php to build with calendar
	extension
Message-ID: <bug-77-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=77

              Host: i686-linux
            Target: arm-softfloat-linux-uclibcgnueabi
           Summary: Enable php to build with calendar extension
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


Created an attachment (id=45)
 --> (https://bugs.busybox.net/attachment.cgi?id=45)
Patch to add the calendar php option

This patch allows php to be built with the calendar extension as an option, has
no external deps, simple enough.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
