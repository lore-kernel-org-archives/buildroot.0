From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 30 Nov 2009 15:59:57 +0000 (UTC)
Subject: [Buildroot] [Bug 749] New: Bump usbutils package to version 0.86
Message-ID: <bug-749-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=749

              Host: i686-linux
            Target: arm-softfloat-linux-uclibcgnueabi
           Summary: Bump usbutils package to version 0.86
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: enhancement
          Priority: P5
         Component: Outdated package
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: gustavo at zacarias.com.ar
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created an attachment (id=779)
 --> (https://bugs.busybox.net/attachment.cgi?id=779)
Bump usbutils package to 0.86

Bump usbutils to version 0.86 and migrate to Makefile.autotools.in infra.
Introduces new option to use zlib-compressed data files (default=N).
Good: Smaller data file if you're not using a compressed filesystem.
Bad: Slower since it has to decompress it every time it runs.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
