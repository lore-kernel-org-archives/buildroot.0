From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon,  8 Nov 2010 15:54:16 +0000 (UTC)
Subject: [Buildroot] [Bug 2785] New: mtd-utils build fails due to missing
	libmtd
Message-ID: <bug-2785-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2785

           Summary: mtd-utils build fails due to missing libmtd
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: patrick.ziegler at fh-kl.de
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


When I try to compile ubiattach, ubidetach, ubiformat, ubimkvol, ubinize from
mtd utils (1.4.1), the link process fails with the following error:

[...]"arm-unknown-linux-uclibcgnueabi/bin/ld: cannot find -lmtd collect2: ld
returned 1 exit status"

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
