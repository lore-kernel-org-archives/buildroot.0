From: nkukard at uclibc.org <nkukard@uclibc.org>
Date: Wed, 31 Dec 2008 18:09:14 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/kernel-headers
Message-ID: <20081231180914.8AFB376FDC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: nkukard
Date: 2008-12-31 18:09:13 +0000 (Wed, 31 Dec 2008)
New Revision: 24627

Log:
* Bump latest 2.6.27 kernel header version to 2.6.27.10


Modified:
   trunk/buildroot/toolchain/kernel-headers/Config.in


Changeset:
Modified: trunk/buildroot/toolchain/kernel-headers/Config.in
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/Config.in	2008-12-31 09:35:21 UTC (rev 24626)
+++ trunk/buildroot/toolchain/kernel-headers/Config.in	2008-12-31 18:09:13 UTC (rev 24627)
@@ -116,7 +116,7 @@
 	default "2.6.24.7"	if BR2_KERNEL_HEADERS_2_6_24
 	default "2.6.25.19"	if BR2_KERNEL_HEADERS_2_6_25
 	default "2.6.26.8"	if BR2_KERNEL_HEADERS_2_6_26
-	default "2.6.27.8"	if BR2_KERNEL_HEADERS_2_6_27
+	default "2.6.27.10"	if BR2_KERNEL_HEADERS_2_6_27
 	default "2.6.28"	if BR2_KERNEL_HEADERS_2_6_28
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 
