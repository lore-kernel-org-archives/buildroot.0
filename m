From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 10 Sep 2010 15:21:07 +0000 (UTC)
Subject: [Buildroot] [Bug 2557] New: [PATCH] mkfs.xfs complains about
	missing libxfs.so.0
Message-ID: <bug-2557-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2557

           Summary: [PATCH] mkfs.xfs complains about missing libxfs.so.0
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: arpinf at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 2455
  --> https://bugs.busybox.net/attachment.cgi?id=2455
Fixes missing libs with xfsprogs

Buildroot version: 2010.08
Host: x86_64
Target: i686

When compling xfsprogs the xfs libs are not copied by the make install target.

Added the copy comand to the package/xfsprogs/xfsprogs.mk file.

See attached patch.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
