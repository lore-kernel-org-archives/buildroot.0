From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 29 Nov 2015 20:36:23 +0000 (UTC)
Subject: [Buildroot] [Bug 8496] New: Toolchain -> Target Optimizations
 ignored & not applied.
Message-ID: <bug-8496-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8496

           Summary: Toolchain -> Target Optimizations ignored & not
                    applied.
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: major
          Priority: P2
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: brandurs at yahoo.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


With the entry "(-mtune=xscale) Target Optimizations" for arm926ej-s
The package configuration ignores "Target Optimizations" settings

CFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -O2 "
CXXFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -O2
"

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
