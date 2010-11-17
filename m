From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 17 Nov 2010 22:48:36 +0000 (UTC)
Subject: [Buildroot] [Bug 2845] New: dialog 1.1 needs libtinfo from ncurses
Message-ID: <bug-2845-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2845

           Summary: dialog 1.1 needs libtinfo from ncurses
           Product: buildroot
           Version: 2009.08
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: sergio at sergiomb.no-ip.org
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


>>> dialog 1.1-20100428 Building
buildroot-2010.08/output/staging/usr/bin/mipsel-unknown-linux-uclibc-gcc
--sysroot=/buildroot-2010.08/output/staging -o dialog dialog.o -L. -ldialog
-Lbuildroot-2010.08/output/staging/lib
-Lbuildroot-2010.08/output/staging/usr/lib -lncurses -ltinfo -lm 
buildroot-2010.08/output/staging/usr/lib/gcc/mipsel-unknown-linux-uclibc/4.3.5
/../../../../mipsel-unknown-linux-uclibc/bin/ld: cannot find -ltinfo
collect2: ld returned 1 exit status

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
