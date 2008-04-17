From: nkukard at uclibc.org <nkukard@uclibc.org>
Date: Thu, 17 Apr 2008 11:00:15 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/bootutils
Message-ID: <20080417180015.1AA113C320@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: nkukard
Date: 2008-04-17 11:00:14 -0700 (Thu, 17 Apr 2008)
New Revision: 21759

Log:
* Updated bootutils to new release


Modified:
   trunk/buildroot/package/bootutils/bootutils.mk


Changeset:
Modified: trunk/buildroot/package/bootutils/bootutils.mk
===================================================================
--- trunk/buildroot/package/bootutils/bootutils.mk	2008-04-17 13:47:29 UTC (rev 21758)
+++ trunk/buildroot/package/bootutils/bootutils.mk	2008-04-17 18:00:14 UTC (rev 21759)
@@ -3,7 +3,7 @@
 # bootutils
 #
 #############################################################
-BOOTUTILS_VERSION = 0.0.7
+BOOTUTILS_VERSION = 0.0.8
 BOOTUTILS_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/bootutils
 
 BOOTUTILS_CONF_ENV = ac_cv_func_malloc_0_nonnull=yes
