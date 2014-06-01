From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun,  1 Jun 2014 17:13:42 +0000 (UTC)
Subject: [Buildroot] [Bug 7136] New: ecryptfs-utils needs gettext to run
 when glibc/eglibc is used
Message-ID: <bug-7136-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7136

           Summary: ecryptfs-utils needs gettext to run when glibc/eglibc
                    is used
           Product: buildroot
           Version: 2014.05
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: xxiao8 at fosiao.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


gettext package is disabled by default when glibc/eglibc is chosen, this should
be enabled at least for package such as ecryptfs, there might be other packages
that need gettext as well. gettext should not depend on BR2_NEEDS_GETTEXT which
is uClibc only.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
