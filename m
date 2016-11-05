From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Nov 2016 15:22:08 +0100
Subject: [Buildroot] via_imx6_vab820_defconfig fails to build
Message-ID: <20161105152208.70041169@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Gergely,

Last year, you contributed the via_imx6_vab820_defconfig to Buildroot
to add support for this HW platform from VIA.

Unfortunately, this defconfig no longer builds, because the U-Boot
version used is too old to build with gcc 5.x.

If you still have access to this HW platform, could you submit a patch
that updates the defconfig to use a newer U-Boot version, which
builds properly with gcc 5.x ?

See
http://free-electrons.com/~thomas/pub/buildroot-defconfigs/via_imx6_vab820_defconfig.log.FAIL
for the full build log.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
