From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 17 Jul 2013 06:34:51 +0000 (UTC)
Subject: [Buildroot] [Bug 6392] New: Extended ARM uImage kernel options
Message-ID: <bug-6392-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6392

           Summary: Extended ARM uImage kernel options
           Product: buildroot
           Version: 2013.05
          Platform: Other
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: philipp.rahns at meinberg.de
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


In same cases, and especially for self hosted Linux kernels and ARM projects,
you need additional kernel compiling options. This is what the patch does
including making life easier to use the "native" kernel config used in its
source tree.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
