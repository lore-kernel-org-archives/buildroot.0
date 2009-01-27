From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 27 Jan 2009 15:02:43 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/webkit
Message-ID: <20090127150243.7B29A7709E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-27 15:02:40 +0000 (Tue, 27 Jan 2009)
New Revision: 25080

Log:
webkit: don't depend on X server

Modified:
   trunk/buildroot/package/webkit/webkit.mk


Changeset:
Modified: trunk/buildroot/package/webkit/webkit.mk
===================================================================
--- trunk/buildroot/package/webkit/webkit.mk	2009-01-27 15:02:34 UTC (rev 25079)
+++ trunk/buildroot/package/webkit/webkit.mk	2009-01-27 15:02:40 UTC (rev 25080)
@@ -12,7 +12,7 @@
 WEBKIT_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) install
 
 WEBKIT_AUTORECONF = YES
-WEBKIT_DEPENDENCIES = icu curl libxml2 libxslt xserver_xorg-server libgtk2 sqlite
+WEBKIT_DEPENDENCIES = icu curl libxml2 libxslt libgtk2 sqlite
 WEBKIT_MAKE_OPT = GLIB_GENMARSHAL=$(HOST_GLIB)/bin/glib-genmarshal GLIB_MKENUMS=$(HOST_GLIB)/bin/glib-mkenums
 
 $(eval $(call AUTOTARGETS,package,webkit))
