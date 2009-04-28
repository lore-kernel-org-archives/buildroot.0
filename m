From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 28 Apr 2009 14:55:27 +0000 (UTC)
Subject: [Buildroot] [Bug 307] New: make openssl package respect build flags
Message-ID: <bug-307-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=307

              Host: i686-linux
            Target: arm-softfloat-linux-uclibcgnueabi
           Summary: make openssl package respect build flags
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: enhancement
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: gustavo at zacarias.com.ar
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created an attachment (id=281)
 --> (https://bugs.busybox.net/attachment.cgi?id=281)
Make openssl package respect build flags

This patch makes the openssl package respect build flags.
It probably solves issues with external toolchain (i don't use that myself) and
allows it to be built using size optimization for example (important size
gains).


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
