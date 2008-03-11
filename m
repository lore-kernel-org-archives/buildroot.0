From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Tue, 11 Mar 2008 08:49:10 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/binutils
Message-ID: <20080311154910.4CAEC120137@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-03-11 08:49:09 -0700 (Tue, 11 Mar 2008)
New Revision: 21293

Log:
fixed path problem

Modified:
   trunk/buildroot/toolchain/binutils/binutils.mk


Changeset:
Modified: trunk/buildroot/toolchain/binutils/binutils.mk
===================================================================
--- trunk/buildroot/toolchain/binutils/binutils.mk	2008-03-11 13:32:27 UTC (rev 21292)
+++ trunk/buildroot/toolchain/binutils/binutils.mk	2008-03-11 15:49:09 UTC (rev 21293)
@@ -10,29 +10,29 @@
 #"))
 BINUTILS_SITE:=ftp://ftp.kernel.org/pub/linux/devel/binutils
 ifeq ($(BINUTILS_VERSION),2.18)
-BINUTILS_SITE:=$(BR2_GNU_MIRROR)/gnu/binutils/
+BINUTILS_SITE:=$(BR2_GNU_MIRROR)/binutils/
 endif
 ifeq ($(BINUTILS_VERSION),2.17)
-BINUTILS_SITE:=$(BR2_GNU_MIRROR)/gnu/binutils/
+BINUTILS_SITE:=$(BR2_GNU_MIRROR)/binutils/
 endif
 ifeq ($(BINUTILS_VERSION),2.16)
-BINUTILS_SITE:=$(BR2_GNU_MIRROR)/gnu/binutils/
+BINUTILS_SITE:=$(BR2_GNU_MIRROR)/binutils/
 BINUTILS_NO_MPFR:=y
 endif
 ifeq ($(BINUTILS_VERSION),2.16.1)
-BINUTILS_SITE:=$(BR2_GNU_MIRROR)/gnu/binutils/
+BINUTILS_SITE:=$(BR2_GNU_MIRROR)/binutils/
 BINUTILS_NO_MPFR:=y
 endif
 ifeq ($(BINUTILS_VERSION),2.15)
-BINUTILS_SITE:=$(BR2_GNU_MIRROR)/gnu/binutils/
+BINUTILS_SITE:=$(BR2_GNU_MIRROR)/binutils/
 BINUTILS_NO_MPFR:=y
 endif
 ifeq ($(BINUTILS_VERSION),2.14)
-BINUTILS_SITE:=$(BR2_GNU_MIRROR)/gnu/binutils/
+BINUTILS_SITE:=$(BR2_GNU_MIRROR)/binutils/
 BINUTILS_NO_MPFR:=y
 endif
 ifeq ($(BINUTILS_VERSION),2.13)
-BINUTILS_SITE:=$(BR2_GNU_MIRROR)/gnu/binutils/
+BINUTILS_SITE:=$(BR2_GNU_MIRROR)/binutils/
 BINUTILS_NO_MPFR:=y
 endif
 ifeq ($(BINUTILS_VERSION),2.15.97)
