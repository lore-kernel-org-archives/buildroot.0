From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Nov 2016 14:35:16 +0100
Subject: [Buildroot] freescale_imx31_3stack_defconfig fails to build
Message-ID: <20161105143516.00291507@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabio, Vincent,

The freescale_imx31_3stack_defconfig in Buildroot no longer builds,
because the Linux kernel version used in this defconfig is too old, and
doesn't build with gcc 5.x.

Has one of you access to this platform, and be willing to update this
defconfig?

See
http://free-electrons.com/~thomas/pub/buildroot-defconfigs/freescale_imx31_3stack_defconfig.log.FAIL
for the full build log.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
