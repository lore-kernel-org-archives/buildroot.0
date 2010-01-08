From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri,  8 Jan 2010 17:17:46 +0000 (UTC)
Subject: [Buildroot] [Bug 847] New: Compiling target-gcc v4.4 fails with
 "libc.so.0: cannot open shared object file: No such file or directory"
Message-ID: <bug-847-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=847

              Host: Linux xxxxxxxx 2.6.32-gentoo-r1 #5 SMP PREEMPT Tue Jan 5
                    11:39:06 CET 2010 i686 Intel(R) Pentium(R) 4 CPU 3.00GHz
                    GenuineIntel GNU/Linux
            Target: 686 + uClib
           Summary: Compiling target-gcc v4.4 fails with "libc.so.0: cannot
                    open shared object file: No such file or directory"
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: blocker
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: belef at risx.net
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created an attachment (id=883)
 --> (https://bugs.busybox.net/attachment.cgi?id=883)
output of target gcc(4.4) before stop

Something seems to go wrong in the depth of relative paths?

I could not find out, where the various Variations of relative paths is
generated.

BTW: uClibc-snapshot.tar.bz2 has no directory "uClibc-snapshot" in it, so I had
to repack/retar with link to uClibc ...
No way to find out, where this path "uClibc-snapshot/.unpacked" is really
generated.

wbr belef

att


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
