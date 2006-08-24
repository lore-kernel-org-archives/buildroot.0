From: vapier at uclibc.org <vapier@uclibc.org>
Date: Wed, 23 Aug 2006 20:40:11 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/binutils
Message-ID: <20060824034011.8FF78C80BB@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: vapier
Date: 2006-08-23 20:40:11 -0700 (Wed, 23 Aug 2006)
New Revision: 15968

Log:
add URL for binutils 2.17 #1002

Modified:
   trunk/buildroot/toolchain/binutils/binutils.mk


Changeset:
Modified: trunk/buildroot/toolchain/binutils/binutils.mk
===================================================================
--- trunk/buildroot/toolchain/binutils/binutils.mk	2006-08-24 03:20:06 UTC (rev 15967)
+++ trunk/buildroot/toolchain/binutils/binutils.mk	2006-08-24 03:40:11 UTC (rev 15968)
@@ -8,6 +8,9 @@
 EXTRA_BINUTILS_CONFIG_OPTIONS:=$(strip $(subst ",, $(BR2_EXTRA_BINUTILS_CONFIG_OPTIONS)))
 #"
 BINUTILS_SITE:=ftp://ftp.kernel.org/pub/linux/devel/binutils
+ifeq ($(BINUTILS_VERSION),2.17)
+BINUTILS_SITE:=ftp://ftp.gnu.org/gnu/binutils/
+endif
 ifeq ($(BINUTILS_VERSION),2.16)
 BINUTILS_SITE:=ftp://ftp.gnu.org/gnu/binutils/
 endif
