From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat,  5 May 2012 14:44:23 +0000 (UTC)
Subject: [Buildroot] [Bug 5180] New: External toolchain path should accept
	relative paths
Message-ID: <bug-5180-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5180

           Summary: External toolchain path should accept relative paths
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: enhancement
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: bos at je-eigen-domein.nl
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 4334
  --> https://bugs.busybox.net/attachment.cgi?id=4334
Patch for supporting relative toolchain path

It would be nice if it was possible to enter paths relative to the buildroot
directory for things like the external toolchain path.
So one could create an archive of toolchain+buildroot+.config file, transfer
that to a different computer, and have "make" just work without having to
change settings.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
