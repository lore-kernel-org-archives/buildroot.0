From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon,  7 Mar 2011 16:06:13 +0000 (UTC)
Subject: [Buildroot] [Bug 3397] New: New Package: cryptsetup
Message-ID: <bug-3397-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3397

           Summary: New Package: cryptsetup
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: info at daccii.it
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 3085
  --> https://bugs.busybox.net/attachment.cgi?id=3085
Patch to add cryptsetup support

This package adds cryptsetup support to buildroot.

NOTE:
i've seen that there is an opened bug (#3385) that add a cryptsetup package but
mine handle more stuff (disable selinux, copy only needed stuff, check for udev
and has libgpg-error in deps) so i've opened a new bug

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
