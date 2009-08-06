From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu,  6 Aug 2009 20:54:47 +0000 (UTC)
Subject: [Buildroot] [Bug 543] New: ATK requires X11 on DirectFB target
Message-ID: <bug-543-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=543

              Host: i386-pc-linux-gnu
            Target: i386-pc-linux-uclibc
             Build: i386-pc-linux-gnu
           Summary: ATK requires X11 on DirectFB target
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: major
          Priority: P2
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: dandart at googlemail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Once Midori is set up to use DirectFB, it includes gtk which includes ATK. ATK
requires X11 but Midori isn't supposed to use X11. ATK should not require X11
or a similar program should be used instead.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
