From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 11 Jan 2009 21:42:07 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/target:
	device/Atmel/arch-arm device/Atmel/arch- etc...
Message-ID: <20090111214207.B6A7676736@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-11 21:42:07 +0000 (Sun, 11 Jan 2009)
New Revision: 24771

Log:
Move AT91 patches for u-boot-2009.01-rc1 to device/Atmel/arch-arm/u-boot/2009.01-rc1

Added:
   trunk/buildroot/target/device/Atmel/arch-arm/u-boot/
   trunk/buildroot/target/device/Atmel/arch-arm/u-boot/2009.01-rc1/
   trunk/buildroot/target/device/Atmel/arch-arm/u-boot/2009.01-rc1/u-boot-2009.01-rc1-001-at91rm9200.patch
   trunk/buildroot/target/device/Atmel/arch-arm/u-boot/2009.01-rc1/u-boot-2009.01-rc1-002-at91rm9200dk.h.patch
   trunk/buildroot/target/device/Atmel/arch-arm/u-boot/2009.01-rc1/u-boot-2009.01-rc1-003-at91rm9200dk.patch
   trunk/buildroot/target/device/Atmel/arch-arm/u-boot/2009.01-rc1/u-boot-2009.01-rc1-004-at91rm9200ek.patch
   trunk/buildroot/target/device/Atmel/arch-arm/u-boot/2009.01-rc1/u-boot-2009.01-rc1-005-at91sam9g20ek.patch
   trunk/buildroot/target/device/Atmel/arch-arm/u-boot/2009.01-rc1/u-boot-2009.01-rc1-006-drivers-net-macb.c.patch
   trunk/buildroot/target/device/Atmel/arch-arm/u-boot/2009.01-rc1/u-boot-2009.01-rc1-007-tools.patch
   trunk/buildroot/target/device/Atmel/arch-arm/u-boot/2009.01-rc1/u-boot-2009.01-rc1-008-Makefile.patch
   trunk/buildroot/target/device/Atmel/arch-arm/u-boot/2009.01-rc1/u-boot-2009.01-rc1-009-factory.patch
   trunk/buildroot/target/device/Atmel/arch-arm/u-boot/2009.01-rc1/u-boot-2009.01-rc1-010-coloured_led.patch
   trunk/buildroot/target/device/Atmel/arch-arm/u-boot/2009.01-rc1/u-boot-2009.01-rc1-011-spimux.patch
   trunk/buildroot/target/device/Atmel/arch-arm/u-boot/2009.01-rc1/u-boot-2009.01-rc1-012-ethinit.patch
   trunk/buildroot/target/device/Atmel/arch-arm/u-boot/2009.01-rc1/u-boot-2009.01-rc1-013-configs.patch

Removed:
   trunk/buildroot/target/u-boot/2009.01-rc1/u-boot-2009.01-rc1-001-at91rm9200.patch
   trunk/buildroot/target/u-boot/2009.01-rc1/u-boot-2009.01-rc1-002-at91rm9200dk.h.patch
   trunk/buildroot/target/u-boot/2009.01-rc1/u-boot-2009.01-rc1-003-at91rm9200dk.patch
   trunk/buildroot/target/u-boot/2009.01-rc1/u-boot-2009.01-rc1-004-at91rm9200ek.patch
   trunk/buildroot/target/u-boot/2009.01-rc1/u-boot-2009.01-rc1-005-at91sam9g20ek.patch
   trunk/buildroot/target/u-boot/2009.01-rc1/u-boot-2009.01-rc1-006-drivers-net-macb.c.patch
   trunk/buildroot/target/u-boot/2009.01-rc1/u-boot-2009.01-rc1-007-tools.patch
   trunk/buildroot/target/u-boot/2009.01-rc1/u-boot-2009.01-rc1-008-Makefile.patch
   trunk/buildroot/target/u-boot/2009.01-rc1/u-boot-2009.01-rc1-009-factory.patch
   trunk/buildroot/target/u-boot/2009.01-rc1/u-boot-2009.01-rc1-010-coloured_led.patch
   trunk/buildroot/target/u-boot/2009.01-rc1/u-boot-2009.01-rc1-011-spimux.patch
   trunk/buildroot/target/u-boot/2009.01-rc1/u-boot-2009.01-rc1-012-ethinit.patch
   trunk/buildroot/target/u-boot/2009.01-rc1/u-boot-2009.01-rc1-013-configs.patch


Changeset:

Sorry, the patch is too large to include (8593 lines).
Please use ViewCVS to see it!

http://uclibc.org/cgi-bin/viewcvs.cgi?view=rev&root=svn&rev=24771
