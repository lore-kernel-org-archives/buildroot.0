From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 18 Jan 2016 22:48:02 +0100
Subject: [Buildroot] [git commit] gst1-plugins-ugly: fix variable name typo
Message-ID: <20160118214846.A1E3D82759@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=edbc21d2706842a38c08f0ae389f043b990e34cd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The wrong variable name was used for the configure options.

Reported-by: Vincent Dehors <vincent.dehors@openwide.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
index 4d13b7b..0831539 100644
--- a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
+++ b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
@@ -13,7 +13,7 @@ GST1_PLUGINS_UGLY_LICENSE = LGPLv2.1+
 
 GST1_PLUGINS_UGLY_CONF_OPTS = --disable-examples --disable-valgrind
 
-GST_PLUGINS_BAD1_CONF_OPTS += \
+GST1_PLUGINS_UGLY_CONF_OPTS += \
 	--disable-a52dec \
 	--disable-amrnb \
 	--disable-amrwb \
