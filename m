From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 27 Sep 2013 17:59:48 +0200
Subject: [Buildroot] [PATCH] package/gst1-plugins-good: remove duplicate VPX
	entry
Message-ID: <1380297588-29775-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/gstreamer1/gst1-plugins-good/Config.in | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-good/Config.in b/package/gstreamer1/gst1-plugins-good/Config.in
index 8031a63..ac05d66 100644
--- a/package/gstreamer1/gst1-plugins-good/Config.in
+++ b/package/gstreamer1/gst1-plugins-good/Config.in
@@ -327,10 +327,6 @@ config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_VPX
 	help
 	  VP8 plugin
 
-config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_VPX
-	bool "vpx (webm)"
-	select BR2_PACKAGE_LIBVPX
-
 config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_WAVPACK
 	bool "wavpack (*.wv audio)"
 	select BR2_PACKAGE_WAVPACK
-- 
1.8.1.2
