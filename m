From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 17 Mar 2015 23:35:20 +0000 (UTC)
Subject: [Buildroot] [Bug 7946] New: libglib2-2.42.2 fails to build for
 sparc-buildroot-linux-gnu
Message-ID: <bug-7946-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7946

              Host: x86_64
            Target: sparc-buildroot-linux-gnu
           Summary: libglib2-2.42.2 fails to build for
                    sparc-buildroot-linux-gnu
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: uwe at hermann-uwe.de
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


This is buildroot git HEAD as of today, with glibc 2.21 and gcc-4.8.

make[5]: Entering directory
'/home/jenkins_slave/buildroot-sparc-buildroot-linux-gnu/output/build/libglib2-2.42.2/glib'
  CCLD     gtester
./.libs/libglib-2.0.so: undefined reference to `__atomic_compare_exchange_4'
collect2: error: ld returned 1 exit status
Makefile:1446: recipe for target 'gtester' failed
make[5]: *** [gtester] Error 1

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
