From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 19 Jul 2012 12:21:34 +0000 (UTC)
Subject: [Buildroot] [Bug 5378] New: dropbear Makefile broken
Message-ID: <bug-5378-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5378

           Summary: dropbear Makefile broken
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: arved at arved.at
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Under some circumstances dropbear 2012.55 adds -lcrypt to the OBJS variable

Instead -lcrypt should be added to LIBS

Patch attached

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
