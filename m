From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 12 Oct 2019 00:54:44 +0200
Subject: [Buildroot] [git commit] package/gstreamer1/gst1-plugins-good:
 remove trailing backslash
Message-ID: <20191011225024.A02D28D596@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c7244eeabff3c1ea553e70d0b51634cffb0a2da9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

... introduced due to a merge conflict in dc7ca780a017. Detected by
check-package.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
index 9812ab07fe..bb2daccc0a 100644
--- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
+++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
@@ -25,7 +25,7 @@ GST1_PLUGINS_GOOD_CONF_OPTS = \
 # Options which require currently unpackaged libraries
 GST1_PLUGINS_GOOD_CONF_OPTS += \
 	-Ddv=disabled \
-	-Ddv1394=disabled \
+	-Ddv1394=disabled
 
 GST1_PLUGINS_GOOD_DEPENDENCIES = gstreamer1 gst1-plugins-base
 
