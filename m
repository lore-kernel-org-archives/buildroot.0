From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 19 Jun 2012 22:48:50 +0000 (UTC)
Subject: [Buildroot] [Bug 5318] New: Grub requires package rxvt to configure
Message-ID: <bug-5318-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5318

           Summary: Grub requires package rxvt to configure
           Product: buildroot
           Version: 2012.02
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: major
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: noel.roberts at brisbane.qld.gov.au
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


It seems package rxvt is required, however the rxvt package has been removed
from Buildroot (according to a one-liner in the CHANGELIST).

Buildroot build completes and doesn't return an error.
However, when attempting to run grub, grub returns:

#grub
Probing device to guess BIOS drives. This may take a long time.
Error opening terminal: rxvt.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
