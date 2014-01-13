From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 13 Jan 2014 21:26:15 +0000 (UTC)
Subject: [Buildroot] [Bug 6794] New: Busybox compiled from buildroot hangs
 on pass from intiramfs to init
Message-ID: <bug-6794-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6794

           Summary: Busybox compiled from buildroot hangs on pass from
                    intiramfs to init
           Product: buildroot
           Version: 2013.11
          Platform: Other
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: anthonysepa at yahoo.ca
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


I use the same binary in a initramfs that processes an init script. At the time
that it passes off the processing to the busybox on my rootfs as /sbin/init it
hangs. If I replace the binaries with an "out of tree" compiled version it
works fine.

If I replace the installed binary with the binary in the
output/build/busybox-1.21.1 it works fine also. In trying to track down the
problem I noticed that the installed binary is different from the built binary
and was modified 3 minutes later in the build process.

I am cross compiling on a Ubuntu 64 bit machine for an arm gaming device.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
