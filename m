From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Nov 2016 15:00:07 +0100
Subject: [Buildroot] olimex_a20_olinuxino_lime2_defconfig fails to build
Message-ID: <20161105150007.4a4f8622@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Jan,

Last year, you contributed the olimex_a20_olinuxino_lime2_defconfig to
Buildroot. Unfortunately, this defconfig now fails to build, due to a
U-Boot version that is too old to build with gcc 5.x.

Since it's using a mainline version of U-Boot, could you have a look at
bumping the U-Boot version to fix this problem, if you still have
access to this HW ?

See
http://free-electrons.com/~thomas/pub/buildroot-defconfigs/olimex_a20_olinuxino_lime2_defconfig.log.FAIL
for the full build log.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
