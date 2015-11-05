From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu,  5 Nov 2015 21:04:32 +0000 (UTC)
Subject: [Buildroot] [Bug 8446] New: rpi-userland failed to build with glibc
	2.22
Message-ID: <bug-8446-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8446

           Summary: rpi-userland failed to build with glibc 2.22
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: gamadril.dev at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


I tried to compile the current git state
(1daa4c95a4bb93621292dd5c9d24285fcddb4026) for raspberry pi board with glibc2.2
as c lib. But the build fails on the rpi-userland package. Seems that the issue
was already fixed
(https://github.com/raspberrypi/userland/commit/34f02079dcb4602e86c578958eddf5ec072f85ea).
Changing the value manually in containers/CMakeLists.txt makes the build go on.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
