From: aldot at uclibc.org <aldot@uclibc.org>
Date: Thu, 21 Dec 2006 09:20:42 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/mpfr
Message-ID: <20061221172042.BF505C8020@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-12-21 09:20:42 -0800 (Thu, 21 Dec 2006)
New Revision: 17035

Log:
- forgot to bump the libversion


Modified:
   trunk/buildroot/package/mpfr/mpfr.mk


Changeset:
Modified: trunk/buildroot/package/mpfr/mpfr.mk
===================================================================
--- trunk/buildroot/package/mpfr/mpfr.mk	2006-12-21 17:03:20 UTC (rev 17034)
+++ trunk/buildroot/package/mpfr/mpfr.mk	2006-12-21 17:20:42 UTC (rev 17035)
@@ -10,7 +10,7 @@
 MPFR_SITE:=http://www.mpfr.org/mpfr-current/
 MPFR_DIR:=$(BUILD_DIR)/mpfr-$(MPFR_VERSION)
 MPFR_BINARY:=libmpfr.a
-MPFR_LIBVERSION:=1.0.0
+MPFR_LIBVERSION:=1.0.1
 
 ifeq ($(BR2_ENDIAN),"BIG")
 MPFR_BE:=yes
