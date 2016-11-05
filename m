From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Nov 2016 14:57:35 +0100
Subject: [Buildroot] minnowboard_defconfig fails to build
Message-ID: <20161105145735.6a941b3a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ezequiel,

The minnowboard_defconfig fails to build (but minnowboard_max_defconfig
is OK), due to the use of a Linux kernel version that is too old to
build with gcc 5.x.

Do you have access to the Minnowboard (not MAX) ? If so, would you be
willing to look into this issue, and provide an updated defconfig ?

See the full build log at
http://free-electrons.com/~thomas/pub/buildroot-defconfigs/minnowboard_defconfig.log.FAIL.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
