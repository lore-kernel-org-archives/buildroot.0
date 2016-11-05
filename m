From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Nov 2016 14:36:37 +0100
Subject: [Buildroot] freescale_p2020ds_defconfig fails to build
Message-ID: <20161105143637.0fffe44d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Gustavo,

You are the one who submitted the freescale_p2020ds_defconfig to
Buildroot. However, this defconfig currently fails to build, because
the kernel is too old to build with gcc 5.x. Could you have a look and
propose a patch to fix this defconfig?

See
http://free-electrons.com/~thomas/pub/buildroot-defconfigs/freescale_p2020ds_defconfig.log.FAIL
for the full build log.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
