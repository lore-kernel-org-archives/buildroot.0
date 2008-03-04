From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue,  4 Mar 2008 04:19:19 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot
Message-ID: <20080304121919.3D76F12C85D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-03-04 04:19:19 -0800 (Tue, 04 Mar 2008)
New Revision: 21163

Log:
buildroot: add kernel-headers to base targets so it gets handled by external-deps



Modified:
   trunk/buildroot/Makefile


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2008-03-04 12:19:16 UTC (rev 21162)
+++ trunk/buildroot/Makefile	2008-03-04 12:19:19 UTC (rev 21163)
@@ -187,7 +187,7 @@
 #
 ##############################################################
 ifeq ($(BR2_TOOLCHAIN_SOURCE),y)
-BASE_TARGETS:=uclibc-configured binutils cross_compiler uclibc-target-utils
+BASE_TARGETS:=uclibc-configured binutils cross_compiler uclibc-target-utils kernel-headers
 else
 BASE_TARGETS:=uclibc
 endif
