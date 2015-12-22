From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 22 Dec 2015 23:29:22 +0000
Subject: [Buildroot] [Bug 8546] New: build instructions for raspberry pi
	don't work
Message-ID: <bug-8546-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8546

            Bug ID: 8546
           Summary: build instructions for raspberry pi don't work
           Product: buildroot
           Version: 2015.11
          Hardware: PC
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: craigswank at gmail.com
                CC: buildroot at uclibc.org

When trying to build for raspberry pi, I follow the instructions from
"board/raspberrypi/readme.txt":

$ make raspberrypi_defconfig
$ make linux/linux.mk:409: *** No kernel defconfig name specified, check your
BR2_LINUX_KERNEL_DEFCONFIG setting.  Stop.
Makefile:36: recipe for target '_all' failed
make: *** [_all] Error 2

-- 
You are receiving this mail because:
You are on the CC list for the bug.
