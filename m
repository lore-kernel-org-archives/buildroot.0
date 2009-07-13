From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 13 Jul 2009 19:01:11 +0000 (UTC)
Subject: [Buildroot] [Bug 453] New: libglib2 autoreconfigure
Message-ID: <bug-453-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=453

              Host: x86-64
            Target: SH4
           Summary: libglib2 autoreconfigure
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: lionel.landwerlin at openwide.fr
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Hi,

currently it's not possible to reconfigure libglib2.

The main problem is gtk-doc. You can find a patch to fix the problem. Cairo has
a similar patch.

Regards,

Lionel


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
