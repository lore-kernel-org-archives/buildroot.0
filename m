From: ulf at uclibc.org <ulf@uclibc.org>
Date: Wed, 22 Aug 2007 14:47:57 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device/Atmel
Message-ID: <20070822214757.01786A48D7@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-22 14:47:56 -0700 (Wed, 22 Aug 2007)
New Revision: 19661

Log:
Remove whitespace damage

Modified:
   trunk/buildroot/target/device/Atmel/Mirrors.in


Changeset:
Modified: trunk/buildroot/target/device/Atmel/Mirrors.in
===================================================================
--- trunk/buildroot/target/device/Atmel/Mirrors.in	2007-08-22 19:31:43 UTC (rev 19660)
+++ trunk/buildroot/target/device/Atmel/Mirrors.in	2007-08-22 21:47:56 UTC (rev 19661)
@@ -1,4 +1,4 @@
-menu	"Atmel Mirrors"
+menu "Atmel Mirrors"
 
 config BR2_ATMEL_MIRROR
 	string "Atmel AVR32/AT91 download site"
