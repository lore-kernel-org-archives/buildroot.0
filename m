From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu,  8 Apr 2010 02:05:45 +0000 (UTC)
Subject: [Buildroot] [Bug 1513] New: Enable powerpc e300c2,
 e300c3 and e500mc optimization
Message-ID: <bug-1513-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1513

              Host: i686-linux
            Target: powerpc-linux
           Summary: Enable powerpc e300c2, e300c3 and e500mc optimization
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


Created an attachment (id=1489)
 --> (https://bugs.busybox.net/attachment.cgi?id=1489)
Enable powerpc e300c2, e300c3 and e500mc optimization

This patch enables e300c2, e300c3 and e500mc powerpc gcc optimizations.
These cores are present in some PowerQUICC and QorIQ processors from Freescale.
Tested with e300c3 and a mpc8315e-rdba eval board.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
