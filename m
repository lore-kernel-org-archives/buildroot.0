From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 16 Sep 2014 23:03:26 +0200
Subject: [Buildroot] [git commit] gst-plugins-bad-plugin-sndfile: Fix
	comment display
Message-ID: <20140916210716.1B8789D6B9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1f54420bdcba23a4f5d9c1fd29121f36d742c543
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: J??r??me Pouiller <jezz@sysmic.org>
Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst1-plugins-bad/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

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
