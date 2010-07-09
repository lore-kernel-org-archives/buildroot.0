From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri,  9 Jul 2010 06:53:36 +0000 (UTC)
Subject: [Buildroot] [Bug 2197] New: classpath should depends on IPv6
Message-ID: <bug-2197-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2197

           Summary: classpath should depends on IPv6
           Product: buildroot
           Version: 2010.05
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: bourgeois at bertin.fr
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


I built classpath package on my buildroot target but the build failed because
of IPv6 unknown symbol. Complete traces are in the attachment.
I rebuilt my toolchain with IPv6 support to fix the issue.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
