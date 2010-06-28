From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 28 Jun 2010 16:41:47 +0000 (UTC)
Subject: [Buildroot] [Bug 2131] New: Add OpenMP support to the toolchain
Message-ID: <bug-2131-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2131

           Summary: Add OpenMP support to the toolchain
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: enhancement
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: will.newton at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


gcc 4 can be built with OpenMP support. This requires a configure switch to gcc
and that the libgomp library be installed on the target.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
