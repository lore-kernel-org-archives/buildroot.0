From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 20 May 2018 19:23:24 +0200
Subject: [Buildroot] [git commit] gst1-plugins-bad: fix typo preventing use
 of the netsim plugin
Message-ID: <20180520172232.C2ECC815EC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=384c1559c08ee4ffd46a0ea2f8df07b9dcd5effa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index 90e2209a99..b041014f81 100644
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
