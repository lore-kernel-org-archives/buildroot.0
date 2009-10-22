From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 22 Oct 2009 16:09:57 +0000 (UTC)
Subject: [Buildroot] [Bug 679] New: Autoconf cannot find M4
Message-ID: <bug-679-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=679

              Host: 586
            Target: 386
           Summary: Autoconf cannot find M4
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: opalenzuela at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


There is a m4 installed in my platform (Ubuntu) with the version, while there
is one installed in the system:

checking for GNU M4 that supports accurate traces... configure: error: no
acceptable m4 could be found in $PATH.
GNU M4 1.4.6 or later is required; 1.4.13 is recommended

# m4 --version
m4 (GNU M4) 1.4.11
Copyright (C) 2008 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
