From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri,  9 Feb 2007 06:05:53 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
Message-ID: <20070209140553.532024864D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-02-09 06:05:51 -0800 (Fri, 09 Feb 2007)
New Revision: 17838

Log:
- new prerelease


Modified:
   trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk


Changeset:
Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk
===================================================================
--- trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2007-02-09 13:56:01 UTC (rev 17837)
+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2007-02-09 14:05:51 UTC (rev 17838)
@@ -28,7 +28,7 @@
 
 # Temporary for 4.1.2-RC1
 ifeq ($(BR2_GCC_VERSION_4_1_2),y)
-GCC_SNAP_DATE:=20070128
+GCC_SNAP_DATE:=20070208
 GCC_OFFICIAL_VER:=$(GCC_VERSION)-$(GCC_SNAP_DATE)
 GCC_SITE:=ftp://gcc.gnu.org/pub/gcc/prerelease-$(GCC_OFFICIAL_VER)/
 endif
