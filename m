From: hamish at uclibc.org <hamish@uclibc.org>
Date: Wed, 10 Sep 2008 18:59:05 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/python
Message-ID: <20080911015905.1BC303C632@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: hamish
Date: 2008-09-10 18:59:04 -0700 (Wed, 10 Sep 2008)
New Revision: 23372

Log:
Export site package directory location for use by other packages

Modified:
   trunk/buildroot/package/python/python.mk


Changeset:
Modified: trunk/buildroot/package/python/python.mk
===================================================================
--- trunk/buildroot/package/python/python.mk	2008-09-10 13:16:23 UTC (rev 23371)
+++ trunk/buildroot/package/python/python.mk	2008-09-11 01:59:04 UTC (rev 23372)
@@ -12,6 +12,7 @@
 PYTHON_BINARY:=python
 PYTHON_TARGET_BINARY:=usr/bin/python
 PYTHON_DEPS:=
+PYTHON_SITE_PACKAGE_DIR=$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_SHORT)/site-packages
 
 BR2_PYTHON_DISABLED_MODULES=dbm zipfile
 
