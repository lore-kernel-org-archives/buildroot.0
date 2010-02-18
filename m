From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 18 Feb 2010 17:55:00 +0000 (UTC)
Subject: [Buildroot] [Bug 1111] New: Bump wget to 1.12 and migrate to
 Makefile.autotools.in
Message-ID: <bug-1111-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1111

              Host: i686-linux
            Target: arm-softfloat-linux-uclibcgnueabi
           Summary: Bump wget to 1.12 and migrate to Makefile.autotools.in
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


Created an attachment (id=1111)
 --> (https://bugs.busybox.net/attachment.cgi?id=1111)
Bump wget to 1.12 and migrate to Makefile.autotools.in

Bump wget from version 1.10.2 to 1.12.
Migrate package to Makefile.autotools.in
Enable ssl support when openssl is installed.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
