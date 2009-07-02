From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu,  2 Jul 2009 15:55:59 +0000 (UTC)
Subject: [Buildroot] [Bug 437] New: ltp-testsuite: Bump version to 20090630.
Message-ID: <bug-437-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=437

           Summary: ltp-testsuite: Bump version to 20090630.
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: enhancement
          Priority: P5
         Component: Outdated package
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: will.newton at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created an attachment (id=437)
 --> (https://bugs.busybox.net/attachment.cgi?id=437)
Bump ltp version to 20090630.

- Remove a few obsolete patches.
 - Add a patch to disbale syscall tests unsupported by uClibc.
 - Add a patch to fix sched_getaffinity build.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
