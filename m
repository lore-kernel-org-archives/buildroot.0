From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 28 Apr 2009 07:07:12 +0000 (UTC)
Subject: [Buildroot] svn commit: [26224]
	trunk/buildroot/toolchain/kernel-headers
Message-ID: <20090428070712.A062C766D5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-04-28 07:07:11 +0000 (Tue, 28 Apr 2009)
New Revision: 26224

Log:
toolchain/kernel-headers: bump 2.6.29 version

Modified:
   trunk/buildroot/toolchain/kernel-headers/Config.in


Changeset:
Modified: trunk/buildroot/toolchain/kernel-headers/Config.in
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/Config.in	2009-04-27 23:29:14 UTC (rev 26223)
+++ trunk/buildroot/toolchain/kernel-headers/Config.in	2009-04-28 07:07:11 UTC (rev 26224)
@@ -62,6 +62,6 @@
 	default "2.6.26.8"	if BR2_KERNEL_HEADERS_2_6_26
 	default "2.6.27.21"	if BR2_KERNEL_HEADERS_2_6_27
 	default "2.6.28.9"	if BR2_KERNEL_HEADERS_2_6_28
-	default "2.6.29.1"	if BR2_KERNEL_HEADERS_2_6_29
+	default "2.6.29.2"	if BR2_KERNEL_HEADERS_2_6_29
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 
