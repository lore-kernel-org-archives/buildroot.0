From: aldot at uclibc.org <aldot@uclibc.org>
Date: Mon, 19 Mar 2007 07:16:10 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/mpfr
Message-ID: <20070319141610.DDDFF485B9@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-03-19 07:16:10 -0700 (Mon, 19 Mar 2007)
New Revision: 18159

Log:
- apply bugfixes ontop of 2.2.1


Modified:
   trunk/buildroot/package/mpfr/mpfr.mk


Changeset:
Modified: trunk/buildroot/package/mpfr/mpfr.mk
===================================================================
--- trunk/buildroot/package/mpfr/mpfr.mk	2007-03-19 13:44:18 UTC (rev 18158)
+++ trunk/buildroot/package/mpfr/mpfr.mk	2007-03-19 14:16:10 UTC (rev 18159)
@@ -4,7 +4,7 @@
 #
 #############################################################
 MPFR_VERSION:=2.2.1
-#MPFR_PATCH:=patches
+MPFR_PATCH:=patches
 MPFR_SOURCE:=mpfr-$(MPFR_VERSION).tar.bz2
 MPFR_CAT:=$(BZCAT)
 MPFR_SITE:=http://www.mpfr.org/mpfr-current/
