From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue,  6 Jan 2009 23:00:24 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
Message-ID: <20090106230025.0B75476CB5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-06 23:00:24 +0000 (Tue, 06 Jan 2009)
New Revision: 24713

Log:
Remove incorrrect dependency on latest minor kernel patch

Modified:
   trunk/buildroot/target/linux/Config.in.advanced


Changeset:
Modified: trunk/buildroot/target/linux/Config.in.advanced
===================================================================
--- trunk/buildroot/target/linux/Config.in.advanced	2009-01-06 21:42:43 UTC (rev 24712)
+++ trunk/buildroot/target/linux/Config.in.advanced	2009-01-06 23:00:24 UTC (rev 24713)
@@ -373,7 +373,7 @@
 	default "2.6.21.7" if BR2_LINUX_2_6_21_7
 	default "2.6.22.1" if BR2_LINUX_2_6_22_1
 	default "2.6.22.10" if BR2_LINUX_2_6_22_10
-	default "$(BR2_KERNEL_CURRENT_VERSION)"if BR2_LINUX_2_6_STABLE || BR2_KERNEL_ADD_LATEST_MINORPATCH
+	default "$(BR2_KERNEL_CURRENT_VERSION)"if BR2_LINUX_2_6_STABLE
 	default $(BR2_CUSTOM_LINUX26_VERSION) if BR2_LINUX26_CUSTOM
 
 menu "Linux Kernel Configuration"
