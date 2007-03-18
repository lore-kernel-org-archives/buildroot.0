From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sun, 18 Mar 2007 04:53:18 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device
Message-ID: <20070318115318.AE3B348704@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-03-18 04:53:16 -0700 (Sun, 18 Mar 2007)
New Revision: 18135

Log:
- note which kernel-headers are required.
  PS: kernel-headers-old.mk would need to provide stuff for downloading the full version, in case anybody would care about such ancient stuff..


Modified:
   trunk/buildroot/target/device/Config.in


Changeset:
Modified: trunk/buildroot/target/device/Config.in
===================================================================
--- trunk/buildroot/target/device/Config.in	2007-03-18 00:57:15 UTC (rev 18134)
+++ trunk/buildroot/target/device/Config.in	2007-03-18 11:53:16 UTC (rev 18135)
@@ -7,6 +7,10 @@
 	  The Linux kernel.
 	  http://www.kernel.org/
 
+	  Note: Requires kernel-headers >= 2.6.19 since the other
+	        kernel headers are just that (headers) and not full
+		kernels. This is a feature.
+
 source "target/device/AMD/Config.in"
 source "target/device/Arm/Config.in"
 source "target/device/Atmel/Config.in"
