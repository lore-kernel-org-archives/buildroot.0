From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 27 Sep 2013 22:09:50 +0200
Subject: [Buildroot] [git commit] package/gst1-plugins-good: remove
	duplicate VPX entry
Message-ID: <20130927201422.99D189B8AB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=231f95a94b7251d6b17e4c0bb91c1f48e84f4db1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gstreamer1/gst1-plugins-good/Config.in |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

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
