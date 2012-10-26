From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 26 Oct 2012 19:23:50 +0000 (UTC)
Subject: [Buildroot] [Bug 5630] New: makefile error with toolchain helpers.mk
Message-ID: <bug-5630-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5630

           Summary: makefile error with toolchain helpers.mk
           Product: buildroot
           Version: 2012.08
          Platform: All
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: gunslnger_ at hotmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


There are a couple errors in toolchain/helpers.mk in the check_glibc function. 
First, the strip $1 appears to remove everything, not just the trailing '/'. 
Second, the test command has a typo; it references SYSDROOT_DIR instead of
SYSROOT_DIR.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
