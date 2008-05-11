From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat, 10 May 2008 23:47:14 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package: libeXosip2 libosip2
Message-ID: <20080511064714.F2CA73C86B@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-05-10 23:47:14 -0700 (Sat, 10 May 2008)
New Revision: 21970

Log:
Bump sip lib versions

Modified:
   trunk/buildroot/package/libeXosip2/libeXosip2.mk
   trunk/buildroot/package/libosip2/libosip2.mk


Changeset:
Modified: trunk/buildroot/package/libeXosip2/libeXosip2.mk
===================================================================
--- trunk/buildroot/package/libeXosip2/libeXosip2.mk	2008-05-11 06:46:20 UTC (rev 21969)
+++ trunk/buildroot/package/libeXosip2/libeXosip2.mk	2008-05-11 06:47:14 UTC (rev 21970)
@@ -4,9 +4,9 @@
 #
 #############################################################
 
-LIBEXOSIP2_VERSION=3.0.1
+LIBEXOSIP2_VERSION=3.1.0
 LIBEXOSIP2_SOURCE=libeXosip2-$(LIBEXOSIP2_VERSION).tar.gz
-LIBEXOSIP2_SITE=http://www.antisip.com/download/
+LIBEXOSIP2_SITE=http://www.antisip.com/download/exosip2
 LIBEXOSIP2_DIR=$(BUILD_DIR)/libeXosip2-$(LIBEXOSIP2_VERSION)
 LIBEXOSIP2_CAT:=$(ZCAT)
 

Modified: trunk/buildroot/package/libosip2/libosip2.mk
===================================================================
--- trunk/buildroot/package/libosip2/libosip2.mk	2008-05-11 06:46:20 UTC (rev 21969)
+++ trunk/buildroot/package/libosip2/libosip2.mk	2008-05-11 06:47:14 UTC (rev 21970)
@@ -4,9 +4,9 @@
 #
 #############################################################
 
-LIBOSIP2_VERSION=3.0.1
+LIBOSIP2_VERSION=3.1.0
 LIBOSIP2_SOURCE=libosip2-$(LIBOSIP2_VERSION).tar.gz
-LIBOSIP2_SITE=http://www.antisip.com/download/
+LIBOSIP2_SITE=http://www.antisip.com/download/exosip2
 LIBOSIP2_DIR=$(BUILD_DIR)/libosip2-$(LIBOSIP2_VERSION)
 LIBOSIP2_CAT:=$(ZCAT)
 
