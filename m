From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 21 Oct 2007 13:13:41 -0700 (PDT)
Subject: [Buildroot] svn commit:
	trunk/buildroot/target/device/Atmel/at91bootstrap
Message-ID: <20071021201341.3351DA67FF@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-10-21 13:13:40 -0700 (Sun, 21 Oct 2007)
New Revision: 20314

Log:
Comment should depend on AT91 bootstrap beeing built

Modified:
   trunk/buildroot/target/device/Atmel/at91bootstrap/Config.in


Changeset:
Modified: trunk/buildroot/target/device/Atmel/at91bootstrap/Config.in
===================================================================
--- trunk/buildroot/target/device/Atmel/at91bootstrap/Config.in	2007-10-21 20:09:22 UTC (rev 20313)
+++ trunk/buildroot/target/device/Atmel/at91bootstrap/Config.in	2007-10-21 20:13:40 UTC (rev 20314)
@@ -80,4 +80,5 @@
 	depends on BR2_TARGET_AT91BOOTSTRAP
 
 comment "It will be copied to $(BR2_AT91BOOTSTRAP_JUMP_ADDR)"
+	depends on BR2_TARGET_AT91BOOTSTRAP
 
