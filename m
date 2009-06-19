From: Markus Heidelberg <markus.heidelberg@web.de>
Date: Fri, 19 Jun 2009 16:34:15 +0200
Subject: [Buildroot] [git commit] gst-plugins-bad: use "select" for
	dependencies
Message-ID: <20090620051954.2BB63777D2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a8fbfdff29e464d65653599003d390be6079b796
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master


Signed-off-by: Markus Heidelberg <markus.heidelberg@web.de>
---
 package/multimedia/gst-plugins-bad/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/multimedia/gst-plugins-bad/Config.in b/package/multimedia/gst-plugins-bad/Config.in
index 16ce4b3..8601cf4 100644
--- a/package/multimedia/gst-plugins-bad/Config.in
+++ b/package/multimedia/gst-plugins-bad/Config.in
@@ -1,7 +1,7 @@
 menuconfig BR2_PACKAGE_GST_PLUGINS_BAD
 	bool "gst-plugins-bad"
 	depends on BR2_PACKAGE_GSTREAMER
-	depends on BR2_PACKAGE_GST_PLUGINS_BASE
+	select BR2_PACKAGE_GST_PLUGINS_BASE
 	help
 	  A set of plug-ins for GStreamer that may be of poor quality or
 	  lacking some features.
-- 
1.6.0.6
