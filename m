From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Sun, 19 Oct 2014 15:33:22 -0400
Subject: [Buildroot] [PATCH v4 4/4] gst-ffmpeg: change config to menuconfig,
	like other gst plugins
In-Reply-To: <1413747202-8919-1-git-send-email-danomimanchego123@gmail.com>
References: <1413747202-8919-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <1413747202-8919-4-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 package/gstreamer/gst-ffmpeg/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gstreamer/gst-ffmpeg/Config.in b/package/gstreamer/gst-ffmpeg/Config.in
index ab80ef8..10e51b3 100644
--- a/package/gstreamer/gst-ffmpeg/Config.in
+++ b/package/gstreamer/gst-ffmpeg/Config.in
@@ -1,4 +1,4 @@
-config BR2_PACKAGE_GST_FFMPEG
+menuconfig BR2_PACKAGE_GST_FFMPEG
 	bool "gst-ffmpeg"
 	select BR2_PACKAGE_GST_PLUGINS_BASE
 	depends on BR2_LARGEFILE
-- 
1.9.1
