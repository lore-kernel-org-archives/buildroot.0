From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 18 Jun 2008 01:51:04 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/uClibc
Message-ID: <20080618085104.E8001F8007@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-06-18 01:51:00 -0700 (Wed, 18 Jun 2008)
New Revision: 22408

Log:
uclibc: remove obsolete uclibc 0.9.28 handling


Modified:
   trunk/buildroot/toolchain/uClibc/uclibc.mk


Changeset:
Modified: trunk/buildroot/toolchain/uClibc/uclibc.mk
===================================================================
--- trunk/buildroot/toolchain/uClibc/uclibc.mk	2008-06-18 08:45:23 UTC (rev 22407)
+++ trunk/buildroot/toolchain/uClibc/uclibc.mk	2008-06-18 08:51:00 UTC (rev 22408)
@@ -29,9 +29,6 @@
 ifeq ($(BR2_UCLIBC_VERSION_0_9_28_3),y)
 UCLIBC_VER:=0.9.28.3
 endif
-ifeq ($(BR2_UCLIBC_VERSION_0_9_28),y)
-UCLIBC_VER:=0.9.28
-endif
 UCLIBC_SITE:=http://www.uclibc.org/downloads
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_SOURCE),y)
