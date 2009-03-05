From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu,  5 Mar 2009 12:38:53 +0000 (UTC)
Subject: [Buildroot] [Bug 147] New: buildroot toolchain fails to build
	w/binutils-2.19.1
Message-ID: <bug-147-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=147

              Host: i686-linux
            Target: arm-softfloat-linux-uclibcgnueabi
           Summary: buildroot toolchain fails to build w/binutils-2.19.1
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: trivial
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: gustavo at zacarias.com.ar
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


It fails in the patch stage since there's no toolchain/binutils/2.19.1
directory.
Solution: create an empty directory.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
