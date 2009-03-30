From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 30 Mar 2009 10:00:48 +0000 (UTC)
Subject: [Buildroot] svn commit: [25890] trunk/buildroot/target
Message-ID: <20090330100048.D6DF2775EC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-30 10:00:48 +0000 (Mon, 30 Mar 2009)
New Revision: 25890

Log:
target/Config.in.arch: really provide correct --with-arch= for ARM targets

The ARM arch names are armVx, not armX

Modified:
   trunk/buildroot/target/Config.in.arch


Changeset:
Modified: trunk/buildroot/target/Config.in.arch
===================================================================
--- trunk/buildroot/target/Config.in.arch	2009-03-30 08:42:08 UTC (rev 25889)
+++ trunk/buildroot/target/Config.in.arch	2009-03-30 10:00:48 UTC (rev 25890)
@@ -656,19 +656,19 @@
 	default c3		if BR2_x86_c3
 	default geode		if BR2_x86_geode
 	default armv4t		if BR2_arm7tdmi
-	default arm3		if BR2_arm610
-	default arm3		if BR2_arm710
-	default arm4t		if BR2_arm720t
-	default arm4t		if BR2_arm920t
-	default arm4t		if BR2_arm922t
-	default arm4t		if BR2_arm926t
-	default arm5t		if BR2_arm10t
-	default arm6j		if BR2_arm1136jf_s
-	default arm6zk		if BR2_arm1176jz_s
-	default arm6zk		if BR2_arm1176jzf_s
-	default arm4		if BR2_sa110
-	default arm4		if BR2_sa1100
-	default arm5te		if BR2_xscale
+	default armv3		if BR2_arm610
+	default armv3		if BR2_arm710
+	default armv4t		if BR2_arm720t
+	default armv4t		if BR2_arm920t
+	default armv4t		if BR2_arm922t
+	default armv4t		if BR2_arm926t
+	default armv5t		if BR2_arm10t
+	default armv6j		if BR2_arm1136jf_s
+	default armv6zk		if BR2_arm1176jz_s
+	default armv6zk		if BR2_arm1176jzf_s
+	default armv4		if BR2_sa110
+	default armv4		if BR2_sa1100
+	default armv5te		if BR2_xscale
 	default iwmmxt		if BR2_iwmmxt
 	default v0		if BR2_cris_unknown
 	default v10		if BR2_cris_generic
