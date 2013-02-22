From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 22 Feb 2013 11:54:21 +0000 (UTC)
Subject: [Buildroot] [Bug 5960] New: fusion.ko driver does not install to
	target rootfs
Message-ID: <bug-5960-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5960

           Summary: fusion.ko driver does not install to target rootfs
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: trivial
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: broot at monkster.hopto.org
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


fusion.o is copied to
target/lib/modules/drivers/(kernel-ver)/drivers/char/fusion
instead of fusion.ko

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
