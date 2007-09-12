From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue, 11 Sep 2007 22:20:27 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/directfb
Message-ID: <20070912052027.75842A67FF@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-09-11 22:20:26 -0700 (Tue, 11 Sep 2007)
New Revision: 19824

Log:
Remove whitespace

Modified:
   trunk/buildroot/package/directfb/directfb.mk


Changeset:
Modified: trunk/buildroot/package/directfb/directfb.mk
===================================================================
--- trunk/buildroot/package/directfb/directfb.mk	2007-09-12 04:58:33 UTC (rev 19823)
+++ trunk/buildroot/package/directfb/directfb.mk	2007-09-12 05:20:26 UTC (rev 19824)
@@ -19,9 +19,9 @@
 DIRECTFB_FUSION:=
 endif
 ifeq ($(BR2_PACKAGE_XSERVER_none),y)
-DIRECTFB_X:= --disable-x11
+DIRECTFB_X:=--disable-x11
 else
-DIRECTFB_X:= --enable-x11
+DIRECTFB_X:=--enable-x11
 endif
 
 $(DL_DIR)/$(DIRECTFB_SOURCE):
