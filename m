From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 26 Mar 2010 13:30:36 +0000 (UTC)
Subject: [Buildroot] [Bug 1423] New: Bump e2fsprogs to 1.41.11
Message-ID: <bug-1423-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1423

              Host: i686-linux
            Target: arm-softfloat-linux-uclibcgnueabi
           Summary: Bump e2fsprogs to 1.41.11
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: trivial
          Priority: P5
         Component: Outdated package
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: gustavo at zacarias.com.ar
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created an attachment (id=1387)
 --> (https://bugs.busybox.net/attachment.cgi?id=1387)
Bump e2fsprogs to 1.41.11

Lots of bugfixes in 1.41.11 and also new support for BLKDISCARD on mke2fs for
SSD devices.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
