From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 20 Jan 2009 09:11:58 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/multimedia/mplayer
Message-ID: <20090120091158.3EFD7770F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-20 09:11:57 +0000 (Tue, 20 Jan 2009)
New Revision: 24920

Log:
mplayer: force cross-compile mode

Modified:
   trunk/buildroot/package/multimedia/mplayer/mplayer.mk


Changeset:
Modified: trunk/buildroot/package/multimedia/mplayer/mplayer.mk
===================================================================
--- trunk/buildroot/package/multimedia/mplayer/mplayer.mk	2009-01-20 08:51:15 UTC (rev 24919)
+++ trunk/buildroot/package/multimedia/mplayer/mplayer.mk	2009-01-20 09:11:57 UTC (rev 24920)
@@ -45,6 +45,7 @@
 		--enable-mad \
 		--enable-fbdev \
 		$(MPLAYER_ENDIAN) \
+		--enable-cross-compile \
 		--disable-mpdvdkit \
 		--disable-ivtv \
 		--disable-tv \
