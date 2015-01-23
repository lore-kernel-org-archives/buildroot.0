From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 23 Jan 2015 17:00:50 +0000 (UTC)
Subject: [Buildroot] [Bug 7826] New: Building of cdparanoia
Message-ID: <bug-7826-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7826

           Summary: Building of cdparanoia
           Product: buildroot
           Version: unspecified
          Platform: All
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: mistepien at wp.pl
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


I tried to package cdparanoia by myself. This is what I get:

checking for grep that handles long lines and -e... /bin/grep
checking for egrep... /bin/grep -E
checking for ANSI C header files... no
checking for sys/types.h... no
checking for sys/stat.h... no
checking for stdlib.h... no
checking for string.h... no
checking for memory.h... no
checking for strings.h... no
checking for inttypes.h... no
checking for stdint.h... no
checking for unistd.h... no
checking size of short... 0
checking size of int... 0
checking size of long... 0
checking size of long long... 0
checking for int16_t... no
checking for int32_t... no
configure: error: No 16 bit type found on this platform!

Libc is uclibc.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
