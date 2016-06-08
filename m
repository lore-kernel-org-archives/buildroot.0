From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Jun 2016 22:01:52 +0200
Subject: [Buildroot] Update of Buildroot toolchains on autobuild.b.o
Message-ID: <20160608220152.5b54ea7d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

For information, I have updated the toolchains on autobuild.b.o. Here
are the changes:

 * All existing Buildroot pre-build toolchains have been rebuilt with
   Buildroot 2016.05.

 * Addition of a ARM Cortex-M4 noMMU toolchain.

 * Addition of a m68k 5208 noMMU toolchain.

 * Addition of a m68k 68040 toolchain.

Due to the addition of those new toolchains, for fairly specific
architecture, I'm expecting to see a pretty significant increase in
build failures.

Let me know if there are other toolchain combinations that you would
like to see tested on autobuild.b.o.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
