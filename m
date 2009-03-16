From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 16 Mar 2009 20:58:01 +0000 (UTC)
Subject: [Buildroot] svn commit: [25691] trunk/buildroot/package/libgtk2
Message-ID: <20090316205801.544B57649F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-16 20:58:01 +0000 (Mon, 16 Mar 2009)
New Revision: 25691

Log:
libgtk2: small cleanup

Modified:
   trunk/buildroot/package/libgtk2/libgtk2.mk


Changeset:
Modified: trunk/buildroot/package/libgtk2/libgtk2.mk
===================================================================
--- trunk/buildroot/package/libgtk2/libgtk2.mk	2009-03-16 20:57:56 UTC (rev 25690)
+++ trunk/buildroot/package/libgtk2/libgtk2.mk	2009-03-16 20:58:01 UTC (rev 25691)
@@ -3,7 +3,6 @@
 # libgtk2.0
 #
 #############################################################
-#LIBGTK2_VERSION = 2.15.0
 LIBGTK2_VERSION_MAJOR:=2.12
 LIBGTK2_VERSION_MINOR:=12
 LIBGTK2_VERSION = $(LIBGTK2_VERSION_MAJOR).$(LIBGTK2_VERSION_MINOR)
@@ -77,9 +76,7 @@
 		--enable-static \
 		--disable-glibtest \
 		--enable-explicit-deps=no \
-		--disable-debug \
-		$(LIBGTK2_CONF_OPT_X)  \
-		$(LIBGTK2_CONF_OPT_DFB)
+		--disable-debug
 
 LIBGTK2_DEPENDENCIES = pkgconfig libglib2 cairo pango atk
 
