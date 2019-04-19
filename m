From: aduskett at gmail.com <aduskett@gmail.com>
Date: Fri, 19 Apr 2019 17:15:52 -0400
Subject: [Buildroot] [PATCH 01/10] package/gstreamer1/gst1-plugins-ugly: fix
 typo in mk file
Message-ID: <20190419211601.53431-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

BR2_PACKAGE_GST_PLUGINS_UGL1_PLUGIN_XINGMUX needs to be
BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_XINGMUX

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
index 2f9b204e9b..25546258cd 100644
--- a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
+++ b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
@@ -46,7 +46,7 @@ else
 GST1_PLUGINS_UGLY_CONF_OPTS += --disable-dvdsub
 endif
 
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_UGL1_PLUGIN_XINGMUX),y)
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_XINGMUX),y)
 GST1_PLUGINS_UGLY_CONF_OPTS += --enable-xingmux
 else
 GST1_PLUGINS_UGLY_CONF_OPTS += --disable-xingmux
-- 
2.20.1
