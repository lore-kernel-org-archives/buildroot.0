From: ulf at uclibc.org <ulf@uclibc.org>
Date: Thu, 10 Jul 2008 09:12:37 -0700 (PDT)
Subject: [Buildroot] svn commit:
	trunk/buildroot/target/device/Atmel/arch-avr32/kernel-patches-2.6.25.10
Message-ID: <20080710161237.B4EDD3C642@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-07-10 09:12:36 -0700 (Thu, 10 Jul 2008)
New Revision: 22766

Log:
Do not use a localversion of kernel, to allow modules to be installed in the correct directory

Added:
   trunk/buildroot/target/device/Atmel/arch-avr32/kernel-patches-2.6.25.10/linux-2.6.25.10-no-localversion.patch


Changeset:
Added: trunk/buildroot/target/device/Atmel/arch-avr32/kernel-patches-2.6.25.10/linux-2.6.25.10-no-localversion.patch
===================================================================
--- trunk/buildroot/target/device/Atmel/arch-avr32/kernel-patches-2.6.25.10/linux-2.6.25.10-no-localversion.patch	                        (rev 0)
+++ trunk/buildroot/target/device/Atmel/arch-avr32/kernel-patches-2.6.25.10/linux-2.6.25.10-no-localversion.patch	2008-07-10 16:12:36 UTC (rev 22766)
@@ -0,0 +1,5 @@
+diff -urN linux-2.6.25.10-0rig/localversion-atmel linux-2.6.25.10/localversion-atmel
+--- linux-2.6.25.10-0rig/localversion-atmel	2008-07-10 16:57:33.000000000 +0200
++++ linux-2.6.25.10/localversion-atmel	1970-01-01 01:00:00.000000000 +0100
+@@ -1 +0,0 @@
+-.atmel.2
