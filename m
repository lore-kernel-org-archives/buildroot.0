From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue,  3 Mar 2009 16:39:19 +0000 (UTC)
Subject: [Buildroot] [Bug 139] New: Bump sqlite to 3.6.11 and convert to
 Makefile.autotools.in
Message-ID: <bug-139-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=139

              Host: i686-linux
            Target: arm-softfloat-linux-uclibcgnueabi
           Summary: Bump sqlite to 3.6.11 and convert to
                    Makefile.autotools.in
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


Created an attachment (id=93)
 --> (https://bugs.busybox.net/attachment.cgi?id=93)
Bump sqlite to 3.6.11, convert to Makefile.autotools.in

Bump sqlite package from version 3.6.10 to 3.6.11, minor improvements including
backup/restore functionality in the CLI.
Also convert package to Makefile.autotools.in
Make readline support an option, it's just used for command-line editing of the
CLI and a big space saver (since it needs ncurses too).
The old version failed to properly build with support for readline/ncurses, so
it brought in both libraries for nothing :-)


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
