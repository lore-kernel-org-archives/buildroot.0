From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 10 Mar 2009 08:16:32 +0000 (UTC)
Subject: [Buildroot] [Bug 171] New: xorg-server / kernel headers 2.6.26 -
 vm86.c:225: error: 'IF_MASK' undeclared (first use in this function)
Message-ID: <bug-171-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=171

              Host: Ubuntu 8.10 (64bit)
            Target: i586
             Build: buildroot-2009.02
           Summary: xorg-server / kernel headers 2.6.26 - vm86.c:225: error:
                    'IF_MASK' undeclared (first use in this function)
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P2
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: mathis_w at gmx.net
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created an attachment (id=127)
 --> (https://bugs.busybox.net/attachment.cgi?id=127)
Have vm86.h fall back to X86_EFLAGS_*

Found on http://bugs.gentoo.org/235789


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
