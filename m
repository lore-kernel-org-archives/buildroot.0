From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri,  2 Aug 2013 13:37:05 +0000 (UTC)
Subject: [Buildroot] [Bug 6416] New: Xenomai package, patch alternative
Message-ID: <bug-6416-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6416

           Summary: Xenomai package, patch alternative
           Product: buildroot
           Version: 2013.05
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: gpontis at spamcop.net
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


The Xenomai package directory includes a xenomai-do-not-install-devices.patch.
It makes "install-exec-local" not depend on "devices". The same effect is
implemented by the existing target "install-user".

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
