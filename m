From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Jul 2018 00:04:51 +0200
Subject: [Buildroot] [git commit] gst1-plugins-good: remove consecutive
 empty lines
Message-ID: <20180630220216.87EF883996@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=872474624f3c29a17ce88bec4034ffd89c9746e0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following check-package warning:

package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk:193: consecutive empty lines

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
index 26ea8a961a..6fa989d6bd 100644
--- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
+++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
@@ -190,7 +190,6 @@ else
 GST1_PLUGINS_GOOD_CONF_OPTS += --disable-mpg123
 endif
 
-
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_LAW),y)
 GST1_PLUGINS_GOOD_CONF_OPTS += --enable-law
 else
