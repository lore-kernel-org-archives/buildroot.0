From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon,  7 Mar 2011 15:18:37 +0000 (UTC)
Subject: [Buildroot] [Bug 3385] New: New Package: cryptsetup
Message-ID: <bug-3385-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3385

           Summary: New Package: cryptsetup
           Product: buildroot
           Version: unspecified
          Platform: All
        OS/Version: All
            Status: NEW
          Severity: enhancement
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: mort at bork.org
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 3073
  --> https://bugs.busybox.net/attachment.cgi?id=3073
cryptsetup patch

This package provides the userland tools to create and manage encrypted block
devices using dm-crypt and LUKS.

I posted three iterations of the patch, responding to feedback and learning how
dependencies in buildroot function.  The last patch posted by me on Feb 7, 2011
to the list was regarding having to specify a config option to the STAGING_DIR
when I switched to using an external toolchain.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
