From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 17 Sep 2010 13:33:13 +0000 (UTC)
Subject: [Buildroot] [Bug 2581] New: [PATCH] libmms: Update to 0.6,
 and patch to work on architectures without unaligned data access
Message-ID: <bug-2581-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2581

           Summary: [PATCH] libmms: Update to 0.6, and patch to work on
                    architectures without unaligned data access
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: enhancement
          Priority: P5
         Component: Outdated package
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: Paul.Burton at imgtec.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 2479
  --> https://bugs.busybox.net/attachment.cgi?id=2479
Updates libmms, fixes unaligned data accesses

This patch updates libmms to it's current release, and applies a patch which
allows it to function on architectures which don't support unaligned data
accesses.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
