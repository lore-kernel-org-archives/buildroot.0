From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 30 Aug 2019 10:16:08 +0000
Subject: [Buildroot] [Bug 12156] buildroot-2019.08-rc3 does not build for Pi
 Zero W
In-Reply-To: <bug-12156-163@https.bugs.busybox.net/>
References: <bug-12156-163@https.bugs.busybox.net/>
Message-ID: <bug-12156-163-BIQ3zqP45q@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12156

--- Comment #2 from Peter Korsgaard <jacmet@uclibc.org> ---
(In reply to info from comment #0)
But the defconfig USES bcm2708-rpi-0-w.dtb:

grep DTS_NAME configs/raspberrypi0w_defconfig                                   
BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2708-rpi-0-w"

Did you perhaps edit raspberrypi0w_defconfig locally?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
