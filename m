From: nkukard at uclibc.org <nkukard@uclibc.org>
Date: Thu,  1 Jan 2009 19:41:53 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/bootutils
Message-ID: <20090101194153.56A7076C21@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: nkukard
Date: 2009-01-01 19:41:52 +0000 (Thu, 01 Jan 2009)
New Revision: 24640

Log:
* Bump release of bootutils to 0.0.9


Modified:
   trunk/buildroot/package/bootutils/bootutils.mk


Changeset:
Modified: trunk/buildroot/package/bootutils/bootutils.mk
===================================================================
--- trunk/buildroot/package/bootutils/bootutils.mk	2009-01-01 19:30:55 UTC (rev 24639)
+++ trunk/buildroot/package/bootutils/bootutils.mk	2009-01-01 19:41:52 UTC (rev 24640)
@@ -3,7 +3,7 @@
 # bootutils
 #
 #############################################################
-BOOTUTILS_VERSION = 0.0.8
+BOOTUTILS_VERSION = 0.0.9
 BOOTUTILS_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/bootutils
 
 BOOTUTILS_CONF_ENV = ac_cv_func_malloc_0_nonnull=yes
