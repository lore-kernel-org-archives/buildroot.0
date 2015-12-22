From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 22 Dec 2015 23:30:29 +0000
Subject: [Buildroot] [Bug 8546] build instructions for raspberry pi don't
	work
In-Reply-To: <bug-8546-163@https.bugs.busybox.net/>
References: <bug-8546-163@https.bugs.busybox.net/>
Message-ID: <bug-8546-163-kCugz4HxW8@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8546

--- Comment #1 from craigswank at gmail.com ---
I pasted the error output wrong, it is more like:

$ make raspberrypi_defconfig
$ make 
linux/linux.mk:409: *** No kernel defconfig name specified, check your
BR2_LINUX_KERNEL_DEFCONFIG setting.  Stop.
Makefile:36: recipe for target '_all' failed
make: *** [_all] Error 2

-- 
You are receiving this mail because:
You are on the CC list for the bug.
