From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 4 Jul 2017 13:31:41 +0200
Subject: [Buildroot] [git commit] gst1-plugins-bad: explicitly disable new
	msdk plugin
Message-ID: <20170704113142.E403B7FCBD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=84d138ed321af026949f98c9cf37547f192b55ba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As we do not have the needed dependencies packaged.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index f597065..5c8e8f2 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -28,6 +28,7 @@ GST1_PLUGINS_BAD_CONF_OPTS += \
 	--disable-avc \
 	--disable-opensles \
 	--disable-uvch264 \
+	--disable-msdk \
 	--disable-voamrwbenc \
 	--disable-bs2b \
 	--disable-chromaprint \
