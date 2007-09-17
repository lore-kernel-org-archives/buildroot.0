From: aldot at uclibc.org <aldot@uclibc.org>
Date: Mon, 17 Sep 2007 04:20:32 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/gmp
Message-ID: <20070917112032.9DE7C30056@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-17 04:20:32 -0700 (Mon, 17 Sep 2007)
New Revision: 19866

Log:
- bump version


Modified:
   trunk/buildroot/package/gmp/gmp.mk


Changeset:
Modified: trunk/buildroot/package/gmp/gmp.mk
===================================================================
--- trunk/buildroot/package/gmp/gmp.mk	2007-09-17 11:20:14 UTC (rev 19865)
+++ trunk/buildroot/package/gmp/gmp.mk	2007-09-17 11:20:32 UTC (rev 19866)
@@ -3,7 +3,7 @@
 # gmp
 #
 #############################################################
-GMP_VERSION:=4.2.1
+GMP_VERSION:=4.2.2
 GMP_SOURCE:=gmp-$(GMP_VERSION).tar.bz2
 GMP_SITE:=http://ftp.sunet.se/pub/gnu/gmp/
 GMP_CAT:=$(BZCAT)
