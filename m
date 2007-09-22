From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sat, 22 Sep 2007 09:37:04 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/kernel-headers
Message-ID: <20070922163704.C49C3A612B@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-22 09:37:00 -0700 (Sat, 22 Sep 2007)
New Revision: 19941

Log:
- bump version


Modified:
   trunk/buildroot/toolchain/kernel-headers/Config.in


Changeset:
Modified: trunk/buildroot/toolchain/kernel-headers/Config.in
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/Config.in	2007-09-22 14:53:38 UTC (rev 19940)
+++ trunk/buildroot/toolchain/kernel-headers/Config.in	2007-09-22 16:37:00 UTC (rev 19941)
@@ -111,5 +111,5 @@
 	default "2.6.21.5"  if BR2_KERNEL_HEADERS_2_6_21_5
 	default "2.6.21.7"  if BR2_KERNEL_HEADERS_2_6_21
 	default "2.6.22.1"  if BR2_KERNEL_HEADERS_2_6_22_1
-	default "2.6.22.6"  if BR2_KERNEL_HEADERS_2_6_22
+	default "2.6.22.7"  if BR2_KERNEL_HEADERS_2_6_22
 
