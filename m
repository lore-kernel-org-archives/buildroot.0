From: andersen at uclibc.org <andersen@uclibc.org>
Date: Thu, 11 Jan 2007 00:45:29 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/cairo
Message-ID: <20070111084529.6676348566@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2007-01-11 00:45:28 -0800 (Thu, 11 Jan 2007)
New Revision: 17248

Log:
it seems pdf and ps support are required for gtk2


Modified:
   trunk/buildroot/package/cairo/cairo.mk


Changeset:
Modified: trunk/buildroot/package/cairo/cairo.mk
===================================================================
--- trunk/buildroot/package/cairo/cairo.mk	2007-01-11 08:42:34 UTC (rev 17247)
+++ trunk/buildroot/package/cairo/cairo.mk	2007-01-11 08:45:28 UTC (rev 17248)
@@ -109,8 +109,8 @@
 		--with-x \
 		--x-includes=$(STAGING_DIR)/usr/X11R6/include \
 		--x-libraries=$(STAGING_DIR)/usr/X11R6/lib \
-		--enable-ps=no \
-		--enable-pdf=no \
+		--enable-ps=yes \
+		--enable-pdf=yes \
 		--enable-svg=no \
 		--enable-png=yes \
 		--enable-freetype=yes \
