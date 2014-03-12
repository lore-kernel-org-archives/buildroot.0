From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 12 Mar 2014 10:50:21 +0000 (UTC)
Subject: [Buildroot] [Bug 6950] New: Full unicode support in ncurses
Message-ID: <bug-6950-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6950

           Summary: Full unicode support in ncurses
           Product: buildroot
           Version: 2014.02
          Platform: All
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: prezi77 at wp.pl
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


On one hand there is a general switch WIDE_CHAR but it has no influence on
building ncursesw instead of ncurses. Thus there is no real unicode support for
such programs like dialog.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
