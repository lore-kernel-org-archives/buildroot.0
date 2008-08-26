From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 26 Aug 2008 14:05:01 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/popt
Message-ID: <20080826210501.AAC853C89F@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-26 14:05:01 -0700 (Tue, 26 Aug 2008)
New Revision: 23223

Log:
popt: cleanup redundant configure args

Modified:
   trunk/buildroot/package/popt/popt.mk


Changeset:
Modified: trunk/buildroot/package/popt/popt.mk
===================================================================
--- trunk/buildroot/package/popt/popt.mk	2008-08-26 20:47:23 UTC (rev 23222)
+++ trunk/buildroot/package/popt/popt.mk	2008-08-26 21:05:01 UTC (rev 23223)
@@ -7,13 +7,8 @@
 POPT_SITE = http://rpm5.org/files/popt
 POPT_INSTALL_STAGING = YES
 
-
 POPT_CONF_ENV = ac_cv_va_copy=yes
 
-
-POPT_CONF_OPT = --target=$(GNU_TARGET_NAME) --host=$(REAL_GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) --prefix=/usr
-
 POPT_INSTALL_TARGET_OPT=DESTDIR=$(TARGET_DIR) install
 
 
