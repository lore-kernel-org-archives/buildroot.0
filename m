From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 15 Apr 2009 18:22:19 +0000 (UTC)
Subject: [Buildroot] [Bug 275] New: Bump bind package to 9.5.1-P2 (security)
Message-ID: <bug-275-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=275

              Host: i686-linux
            Target: arm-softfloat-linux-uclibcgnueabi
           Summary: Bump bind package to 9.5.1-P2 (security)
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


Created an attachment (id=231)
 --> (https://bugs.busybox.net/attachment.cgi?id=231)
Bump bind package from 9.5.1-P1 to 9.5.1-P2

Trivial enough.
Fixes a security issue with DNSSEC DLV.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
