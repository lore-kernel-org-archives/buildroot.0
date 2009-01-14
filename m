From: laird at uclibc.org <laird@uclibc.org>
Date: Wed, 14 Jan 2009 16:52:11 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/multimedia/gstreamer
Message-ID: <20090114165211.F26A3769A1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: laird
Date: 2009-01-14 16:52:10 +0000 (Wed, 14 Jan 2009)
New Revision: 24841

Log:
package/multimedia/gstreamer/gstreamer.mk: Fix missing \

Fix stupid typo.

Signed-off-by: Daniel Laird <daniel.j.laird@nxp.com>



Modified:
   trunk/buildroot/package/multimedia/gstreamer/gstreamer.mk


Changeset:
Modified: trunk/buildroot/package/multimedia/gstreamer/gstreamer.mk
===================================================================
--- trunk/buildroot/package/multimedia/gstreamer/gstreamer.mk	2009-01-14 16:04:05 UTC (rev 24840)
+++ trunk/buildroot/package/multimedia/gstreamer/gstreamer.mk	2009-01-14 16:52:10 UTC (rev 24841)
@@ -23,7 +23,7 @@
 		$(DISABLE_LARGEFILE) \
 		--disable-examples \
 		--disable-tests \
-		--disable-failing-tests
+		--disable-failing-tests \
 		--disable-gtk-doc \
 		--without-html-dir
 
