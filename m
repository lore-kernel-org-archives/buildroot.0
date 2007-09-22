From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sat, 22 Sep 2007 09:42:26 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/kernel-headers
Message-ID: <20070922164226.344EB30065@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-22 09:42:25 -0700 (Sat, 22 Sep 2007)
New Revision: 19943

Log:
- bump version (forgot this hunk for r19941)


Modified:
   trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile


Changeset:
Modified: trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile	2007-09-22 16:40:08 UTC (rev 19942)
+++ trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile	2007-09-22 16:42:25 UTC (rev 19943)
@@ -4,11 +4,11 @@
 #
 #############################################################
 
-ifeq ("$(DEFAULT_KERNEL_HEADERS)","2.6.22.6")
+ifeq ("$(DEFAULT_KERNEL_HEADERS)","2.6.22.7")
 VERSION:=2
 PATCHLEVEL:=6
 SUBLEVEL:=22
-EXTRAVERSION:=.6
+EXTRAVERSION:=.7
 LOCALVERSION:=
 LINUX_HEADERS_VERSION:=$(VERSION).$(PATCHLEVEL).$(SUBLEVEL)$(EXTRAVERSION)
 LINUX_HEADERS_SITE:=http://www.kernel.org/pub/linux/kernel/v2.6/
