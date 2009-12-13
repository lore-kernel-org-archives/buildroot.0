From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 13 Dec 2009 01:53:47 +0000 (UTC)
Subject: [Buildroot] [Bug 803] New: [PATCH] lua - add shared library patch
 and config option for readline/ncurses support
Message-ID: <bug-803-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=803

           Summary: [PATCH] lua - add shared library patch and config option
                    for readline/ncurses support
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Windows
            Status: NEW
          Severity: enhancement
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: rvpaasen at t3i.nl
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created an attachment (id=831)
 --> (https://bugs.busybox.net/attachment.cgi?id=831)
lua patch

This patch includes a shared library patch (based on a patch from the debian
repository). It also adds a config option to build without readline and
ncurses, and a config option to choose if the compiler and interpreter should
be installed.

It applies to the current git repository.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
