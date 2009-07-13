From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 13 Jul 2009 19:12:33 +0000 (UTC)
Subject: [Buildroot] [Bug 457] New: e2fsprogs link problem
Message-ID: <bug-457-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=457

              Host: x86-64
            Target: SH4
           Summary: e2fsprogs link problem
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

when link e2fsck from the e2fsprogs package, you might experience a problem at
the link. e2fsck is looking for -lintl.

Please find a fix as attachment.

Regards,

Lionel


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
