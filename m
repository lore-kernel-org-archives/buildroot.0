From: Markus Heidelberg <markus.heidelberg@web.de>
Date: Thu, 26 Feb 2009 02:05:56 +0100
Subject: [Buildroot] [PATCH] gst-plugins-good: add missing FLAC dependency
In-Reply-To: <20090225195146.D3F0F7669C@busybox.osuosl.org>
References: <20090225195146.D3F0F7669C@busybox.osuosl.org>
Message-ID: <200902260205.56349.markus.heidelberg@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Markus Heidelberg <markus.heidelberg@web.de>
---
 .../gst-plugins-good/gst-plugins-good.mk           |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/multimedia/gst-plugins-good/gst-plugins-good.mk b/package/multimedia/gst-plugins-good/gst-plugins-good.mk
index abeb3ba..99fea7b 100644
--- a/package/multimedia/gst-plugins-good/gst-plugins-good.mk
+++ b/package/multimedia/gst-plugins-good/gst-plugins-good.mk
@@ -275,6 +275,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_FLAC),y)
 GST_PLUGINS_GOOD_CONF_OPT += --enable-flac
+GST_PLUGINS_GOOD_DEPENDENCIES += flac
 else
 GST_PLUGINS_GOOD_CONF_OPT += --disable-flac
 endif
-- 
1.6.2.rc1.34.g8925
