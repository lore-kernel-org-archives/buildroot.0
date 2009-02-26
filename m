From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 26 Feb 2009 08:05:08 +0000 (UTC)
Subject: [Buildroot] svn commit:
	trunk/buildroot/package/multimedia/gst-plugins-good
Message-ID: <20090226080509.7960A764B9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-02-26 08:05:07 +0000 (Thu, 26 Feb 2009)
New Revision: 25457

Log:
gst-plugins-good: add missing FLAC dependency

Signed-off-by: Markus Heidelberg <markus.heidelberg@web.de>

Modified:
   trunk/buildroot/package/multimedia/gst-plugins-good/gst-plugins-good.mk


Changeset:
Modified: trunk/buildroot/package/multimedia/gst-plugins-good/gst-plugins-good.mk
===================================================================
--- trunk/buildroot/package/multimedia/gst-plugins-good/gst-plugins-good.mk	2009-02-25 19:51:46 UTC (rev 25456)
+++ trunk/buildroot/package/multimedia/gst-plugins-good/gst-plugins-good.mk	2009-02-26 08:05:07 UTC (rev 25457)
@@ -275,6 +275,7 @@
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_FLAC),y)
 GST_PLUGINS_GOOD_CONF_OPT += --enable-flac
+GST_PLUGINS_GOOD_DEPENDENCIES += flac
 else
 GST_PLUGINS_GOOD_CONF_OPT += --disable-flac
 endif
