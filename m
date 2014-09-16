From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Tue, 16 Sep 2014 21:48:52 +0200
Subject: [Buildroot] [PATCH] gst-plugins-bad-plugin-sndfile: Fix comment
	display
Message-ID: <1410896932-7483-1-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 package/gstreamer1/gst1-plugins-bad/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index 816de35..fd37dc7 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -480,6 +480,7 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SNDFILE
 	depends on BR2_LARGEFILE
 
 comment "gst-plugins-bad-plugin-sndfile needs a toolchain w/ largefile"
+	depends on !BR2_LARGEFILE
 
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DVB
 	bool "dvb"
-- 
1.9.1
