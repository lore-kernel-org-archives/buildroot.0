From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 16 May 2015 03:48:03 +0000 (UTC)
Subject: [Buildroot] [Bug 8111] New: 2015.05.rc2 LIBFOO_CONF_OPTS not working
Message-ID: <bug-8111-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8111

           Summary: 2015.05.rc2 LIBFOO_CONF_OPTS not working
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: albert.david at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


in 2015.05.rc2, for host-cmake-package following line has no effect
LIBFOO_CONF_OPTS = -DBUILD_DEMOS=ON

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
