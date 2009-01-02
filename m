From: ulf at uclibc.org <ulf@uclibc.org>
Date: Fri,  2 Jan 2009 11:18:10 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/target: device/Atmel
	device/Atmel/at91rm9200df d etc...
Message-ID: <20090102111810.44103769FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-02 11:18:09 +0000 (Fri, 02 Jan 2009)
New Revision: 24646

Log:
Support AT91 in vanilla U-Boot

Added:
   trunk/buildroot/target/u-boot/1.3.4/
   trunk/buildroot/target/u-boot/2008.10/
   trunk/buildroot/target/u-boot/2009.01-rc1/
   trunk/buildroot/target/u-boot/2009.01-rc1/u-boot-2009.01-rc1-001-at91rm9200.patch
   trunk/buildroot/target/u-boot/2009.01-rc1/u-boot-2009.01-rc1-002-at91rm9200dk.h.patch
   trunk/buildroot/target/u-boot/2009.01-rc1/u-boot-2009.01-rc1-003-at91rm9200dk.patch
   trunk/buildroot/target/u-boot/2009.01-rc1/u-boot-2009.01-rc1-004-at91rm9200ek.patch
   trunk/buildroot/target/u-boot/2009.01/

Modified:
   trunk/buildroot/target/device/Atmel/AT91_Config.in
   trunk/buildroot/target/device/Atmel/Makefile.in
   trunk/buildroot/target/device/Atmel/at91rm9200df/Makefile.in
   trunk/buildroot/target/device/Atmel/at91sam9260dfc/Makefile.in
   trunk/buildroot/target/device/Atmel/at91sam9261ek/Makefile.in
   trunk/buildroot/target/device/Atmel/at91sam9263ek/Makefile.in
   trunk/buildroot/target/device/Atmel/at91sam9g20dfc/Makefile.in
   trunk/buildroot/target/device/Atmel/u-boot/Config.in
   trunk/buildroot/target/u-boot/Config.in
   trunk/buildroot/target/u-boot/Makefile.in


Changeset:

Sorry, the patch is too large to include (2477 lines).
Please use ViewCVS to see it!

http://uclibc.org/cgi-bin/viewcvs.cgi?view=rev&root=svn&rev=24646
