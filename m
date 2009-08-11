From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 11 Aug 2009 13:46:55 +0000 (UTC)
Subject: [Buildroot] [Bug 563] New: compiling Linux 2.30.2 for ARM with
	Atmel support
Message-ID: <bug-563-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=563

              Host: Mandriva Linux 32bit
            Target: arm_generic
           Summary: compiling Linux 2.30.2 for ARM with Atmel support
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: major
          Priority: P2
         Component: Outdated package
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: oduclos at mandriva.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


I tried to compile Linux 2.30.2 for ARM with the Atmel devices support but it
failed.

The patch "linux-2.6.28-at91.patch.bz2" only works with linux 2.6.28 and should
not be used with other kernels.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
