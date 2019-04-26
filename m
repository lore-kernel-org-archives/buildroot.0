From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 26 Apr 2019 14:29:16 +0200
Subject: [Buildroot] [git commit branch/2019.02.x]
 package/gstreamer1/gst1-plugins-ugly: fix typo in mk file
Message-ID: <20190426130222.CD49E80163@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4c47bf893267d1ff171d6133e21c69898c20cf6c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

BR2_PACKAGE_GST_PLUGINS_UGL1_PLUGIN_XINGMUX needs to be
BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_XINGMUX

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit d2ada4d7045ba8b23824e10c59bb662c1cfd901c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
