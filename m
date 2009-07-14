From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 14 Jul 2009 19:59:56 +0000 (UTC)
Subject: [Buildroot] [Bug 463] New: Webkit build with directfb fails
Message-ID: <bug-463-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=463

              Host: x86-64
            Target: SH4
           Summary: Webkit build with directfb fails
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: enhancement
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: lionel.landwerlin at openwide.fr
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Hi,

Webkit must be configured with --with-target=directfb to compile with DirectFB.
Please find a patch as attachment to allow this.

Regards,

Lionel


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
