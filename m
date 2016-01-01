From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 1 Jan 2016 21:53:28 +0100
Subject: [Buildroot] [git commit] gst1-plugins-good: fix v4l2 toolchain
	comment
Message-ID: <20160101205622.52D478010A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b819ad4f3ed8b4958ecd5e9bf11afc6c7f6da497
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Documented syntax is '.. needs A toolchain ..'

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst1-plugins-good/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gstreamer1/gst1-plugins-good/Config.in b/package/gstreamer1/gst1-plugins-good/Config.in
index 6216c7f..a8cdde2 100644
--- a/package/gstreamer1/gst1-plugins-good/Config.in
+++ b/package/gstreamer1/gst1-plugins-good/Config.in
@@ -276,7 +276,7 @@ config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_V4L2
 	help
 	  elements for Video 4 Linux
 
-comment "v4l2 needs toolchain w/ headers >= 3.0"
+comment "v4l2 needs a toolchain w/ headers >= 3.0"
 	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
 
 config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_CAIRO
