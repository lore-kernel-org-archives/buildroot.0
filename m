From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Nov 2016 15:20:13 +0100
Subject: [Buildroot] telit_evk_pro3_defconfig fails to build
Message-ID: <20161105152013.615d71d7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabio,

Back in 2013, you contributed telit_evk_pro3_defconfig to Buildroot.
Unfortunately, this defconfig no longer builds: the Linux kernel
version used is too old to build with gcc 5.x.

Do you still have access to this HW platform? If so, can you contribute
a patch to update the defconfig? If you're no longer interested by this
platform, we can also decide to remove its defconfig.

You can see the full build log at
http://free-electrons.com/~thomas/pub/buildroot-defconfigs/telit_evk_pro3_defconfig.log.FAIL.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
