From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri,  4 Sep 2009 18:22:59 +0000 (UTC)
Subject: [Buildroot] [Bug 593] New: Missing early check for patch(1)
Message-ID: <bug-593-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=593

           Summary: Missing early check for patch(1)
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: enhancement
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: felix.nawothnig at drdannenberg.de
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


I'm preparing a tool-chain inside a fresh virtual machine and although the
process pretty quickly informed me about the missing bison and flex binaries it
was just when it was trying to patch the kernel sources (I believe) when it
realized I didn't have a patch binary installed.

I realize you might never early-check all dependencies for what-ever weird
configuration options the user might have chosen, but as this is a pretty basic
one I'm filing this as an enhancement.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
