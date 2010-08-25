From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 25 Aug 2010 01:58:58 +0000 (UTC)
Subject: [Buildroot] [Bug 2437] New: TCL build fails due to missing -lm flag
Message-ID: <bug-2437-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2437

           Summary: TCL build fails due to missing -lm flag
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: spargue at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


When make runs tcl's configure it misses out the MATH_LIBS="-lm" variable

run:
make MATH_LIBS="-lm" as a quick fix.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
