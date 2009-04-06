From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon,  6 Apr 2009 15:39:13 +0000 (UTC)
Subject: [Buildroot] [Bug 267] New: The make target: cross fails because
 toolchain_build_<arch>/bin/sed not found
Message-ID: <bug-267-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=267

              Host: x86
             Build: 2009.02
           Summary: The make target: cross fails because
                    toolchain_build_<arch>/bin/sed not found
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: enhancement
          Priority: P5
         Component: Other
        AssignedTo: dwatkins at tranzeo.com
        ReportedBy: dwatkins at tranzeo.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Note: This is from email sent to the list earlier...
http://lists.busybox.net/pipermail/buildroot/2009-April/026913.html

In the toplevel Makefile is a target 'cross' that appears to be intended
to allow you to build the cross toolchain without building everything
else.  Unfortunately it doesn't work from a clean extract of the
tarball.

If you invoke 'make cross' an error happens because sed is missing.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
