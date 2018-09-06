From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 06 Sep 2018 21:09:07 +0000
Subject: [Buildroot] [Bug 11286] python-rpi-gpio only should depend on
 BR2_arm || BR2_aarch64
In-Reply-To: <bug-11286-163@https.bugs.busybox.net/>
References: <bug-11286-163@https.bugs.busybox.net/>
Message-ID: <bug-11286-163-BTsD78GVdU@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11286

--- Comment #1 from Yuntian Zhang <yuntian.zh@gmail.com> ---
After testing with this dependency the python-rpi-gpio is included in the
sdcard.img for 3_64_defconfig. However /proc/cpuinfo doesn't match the output
of 3_defconfig, which fails rpi.gpio/source/cpuinfo.c:get_rpi_info() test.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
