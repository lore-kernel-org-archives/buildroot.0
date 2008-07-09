From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed,  9 Jul 2008 00:14:57 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/gperf
Message-ID: <20080709071457.905E3F8007@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-07-09 00:14:57 -0700 (Wed, 09 Jul 2008)
New Revision: 22698

Log:
gperf: remove trailing spaces

Modified:
   trunk/buildroot/package/gperf/gperf.mk


Changeset:
Modified: trunk/buildroot/package/gperf/gperf.mk
===================================================================
--- trunk/buildroot/package/gperf/gperf.mk	2008-07-09 07:14:54 UTC (rev 22697)
+++ trunk/buildroot/package/gperf/gperf.mk	2008-07-09 07:14:57 UTC (rev 22698)
@@ -9,12 +9,12 @@
 GPERF_AUTORECONF = NO
 GPERF_INSTALL_STAGING = YES
 GPERF_INSTALL_TARGET = YES
-GPERF_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) install 
-GPERF_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install 
+GPERF_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) install
+GPERF_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
-GPERF_CONF_ENV = 
+GPERF_CONF_ENV =
 
-GPERF_CONF_OPT = 
+GPERF_CONF_OPT =
 
 GPERF_DEPENDENCIES = uclibc
 
