From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Sun, 20 May 2018 13:11:14 -0400
Subject: [Buildroot] [PATCH] gst1-plugins-bad: fix typo preventing use of
 the netsim plugin
Message-ID: <1526836274-2875-1-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index 90e2209..b041014 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -378,7 +378,7 @@ else
 GST1_PLUGINS_BAD_CONF_OPTS += --disable-mxf
 endif
 
-ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_NETSIM),y)
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_NETSIM),y)
 GST1_PLUGINS_BAD_CONF_OPTS += --enable-netsim
 else
 GST1_PLUGINS_BAD_CONF_OPTS += --disable-netsim
-- 
2.7.4
