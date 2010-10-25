From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 25 Oct 2010 13:37:17 +0000 (UTC)
Subject: [Buildroot] [Bug 2731] New: Build order
Message-ID: <bug-2731-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2731

           Summary: Build order
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: chromy at asix.cz
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Kernel shall be built _before_ running BR2_ROOTFS_POST_BUILD_SCRIPT,
otherwise this script cannot be used e.g. for building custom (non-stock)
kernel modules and placing updating target filesystem accordingly before
it gets packed.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
