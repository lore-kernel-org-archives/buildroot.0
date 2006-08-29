From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue, 29 Aug 2006 09:41:22 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/pkgconfig
Message-ID: <20060829164122.C51324863B@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-08-29 09:41:22 -0700 (Tue, 29 Aug 2006)
New Revision: 16012

Log:
- bump version


Modified:
   trunk/buildroot/package/pkgconfig/configure.patch
   trunk/buildroot/package/pkgconfig/pkgconfig.mk


Changeset:
Modified: trunk/buildroot/package/pkgconfig/configure.patch
===================================================================
--- trunk/buildroot/package/pkgconfig/configure.patch	2006-08-29 16:40:38 UTC (rev 16011)
+++ trunk/buildroot/package/pkgconfig/configure.patch	2006-08-29 16:41:22 UTC (rev 16012)
@@ -16,7 +16,7 @@
  AC_INIT(pkg-config.1)
  
 +AC_CONFIG_AUX_DIR(.)
- AM_INIT_AUTOMAKE(pkg-config, 0.20)
+ AM_INIT_AUTOMAKE(pkg-config, 0.21)
  AM_MAINTAINER_MODE
  
 @@ -92,8 +93,6 @@

Modified: trunk/buildroot/package/pkgconfig/pkgconfig.mk
===================================================================
--- trunk/buildroot/package/pkgconfig/pkgconfig.mk	2006-08-29 16:40:38 UTC (rev 16011)
+++ trunk/buildroot/package/pkgconfig/pkgconfig.mk	2006-08-29 16:41:22 UTC (rev 16012)
@@ -3,7 +3,7 @@
 # pkgconfig
 #
 #############################################################
-PKGCONFIG_VER:=0.20
+PKGCONFIG_VER:=0.21
 PKGCONFIG_SOURCE:=pkg-config-$(PKGCONFIG_VER).tar.gz
 PKGCONFIG_SITE:=http://pkgconfig.freedesktop.org/releases/
 PKGCONFIG_DIR:=$(BUILD_DIR)/pkg-config-$(PKGCONFIG_VER)
