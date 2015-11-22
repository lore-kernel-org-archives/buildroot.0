From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Nov 2015 15:35:35 +0100
Subject: [Buildroot] Update of Buildroot toolchains in the autobuilders
Message-ID: <20151122153535.663fba33@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

For your information, the pre-built Buildroot toolchains in the
autobuilders have seen some changes:

 * They have all been rebuilt with Buildroot 2015.11-rc1-71-g90d1299.
   This means that uClibc-ng 1.0.9 is used for the uClibc based
   toolchains.

 * Since mips64/uclibc support has been enabled, the br-mips64-n64-full
   toolchain is now uClibc-ng based instead of glibc based.

 * As requested by Vicente, two new toolchains have been added:
   mips32r6 and mips64r6-n64 (both little endian, hard float).

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
