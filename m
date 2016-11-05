From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Nov 2016 15:01:26 +0100
Subject: [Buildroot] olimex_a20_olinuxino_lime_mali_defconfig fails to build
Message-ID: <20161105150126.6847fcd3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fran?ois,

Last year, you contributed the olimex_a20_olinuxino_lime_mali_defconfig
to Buildroot. Unfortunately, this defconfig currently fails to build,
due to the use of a U-Boot version that is too old to build with gcc
5.x.

Since it's using a mainline U-Boot version, could you have a look at
updating the defconfig to use a newer U-Boot version, if you still have
access to this HW platform ?

See the full build log at
http://free-electrons.com/~thomas/pub/buildroot-defconfigs/olimex_a20_olinuxino_lime_mali_defconfig.log.FAIL

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
