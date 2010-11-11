From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 11 Nov 2010 11:23:56 +0000 (UTC)
Subject: [Buildroot] [Bug 2797] New: pciutils dependencies on zlib not taken
	into account
Message-ID: <bug-2797-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2797

           Summary: pciutils dependencies on zlib not taken into account
           Product: buildroot
           Version: unspecified
          Platform: All
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: realloc at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Compilation of pciutils with zlib enabled fails.
The patch attached fixes this issue.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
