From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 17 Jan 2007 05:54:14 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot
Message-ID: <20070117135414.48E88485BC@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-01-17 05:54:12 -0800 (Wed, 17 Jan 2007)
New Revision: 17344

Log:
- convert to lowercase to match the other sub-arches


Modified:
   trunk/buildroot/Config.in


Changeset:
Modified: trunk/buildroot/Config.in
===================================================================
--- trunk/buildroot/Config.in	2007-01-17 13:49:35 UTC (rev 17343)
+++ trunk/buildroot/Config.in	2007-01-17 13:54:12 UTC (rev 17344)
@@ -74,7 +74,7 @@
 	bool "sa1100"
 config BR2_xscale
 	bool "xscale"
-config BR2_IWMMXT
+config BR2_iwmmxt
 	bool "iwmmxt"
 endchoice
 
@@ -90,7 +90,7 @@
 	default ARM_SA110	if BR2_sa110
 	default ARM_SA1100	if BR2_sa1100
 	default ARM_XSCALE	if BR2_xscale
-	default ARM_IWMMXT	if BR2_IWMMXT
+	default ARM_IWMMXT	if BR2_iwmmxt
 	default GENERIC_ARM	if BR2_generic_arm
 
 choice
