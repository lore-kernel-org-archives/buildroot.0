From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Tue, 11 Mar 2008 11:26:07 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target: device/Atmel
	device/Atmel/u-boot u-boot
Message-ID: <20080311182607.F0650120135@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-03-11 11:26:07 -0700 (Tue, 11 Mar 2008)
New Revision: 21303

Log:
separate u-boot for at91 arm and everything else

Added:
   trunk/buildroot/target/u-boot/
   trunk/buildroot/target/u-boot/Config.in
   trunk/buildroot/target/u-boot/Makefile.in
   trunk/buildroot/target/u-boot/u-boot-1.3.0-avr32-100-atmel.2.patch

Removed:
   trunk/buildroot/target/device/Atmel/u-boot/u-boot-1.3.0-100-atmel.2.patch.bad
   trunk/buildroot/target/device/Atmel/u-boot/u-boot-1.3.0.mk.bad

Modified:
   trunk/buildroot/target/Config.in
   trunk/buildroot/target/Makefile.in
   trunk/buildroot/target/device/Atmel/Makefile.in
   trunk/buildroot/target/device/Atmel/u-boot/Config.in
   trunk/buildroot/target/device/Atmel/u-boot/u-boot.mk


Changeset:

Sorry, the patch is too large to include (6902 lines).
Please use ViewCVS to see it!

http://uclibc.org/cgi-bin/viewcvs.cgi?view=rev&root=svn&rev=21303
