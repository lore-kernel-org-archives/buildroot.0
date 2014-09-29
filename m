From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 29 Sep 2014 17:32:28 +0200
Subject: [Buildroot] [git commit] gst1-libav: bump version
Message-ID: <20140929153251.CE78A9D535@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=248e0f1c4602af534bb3ef66b997d60f79811461
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And add tarball hash from release announcement.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst1-libav/gst1-libav.hash |    2 ++
 package/gstreamer1/gst1-libav/gst1-libav.mk   |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/gstreamer1/gst1-libav/gst1-libav.hash b/package/gstreamer1/gst1-libav/gst1-libav.hash
new file mode 100644
index 0000000..957db83
--- /dev/null
+++ b/package/gstreamer1/gst1-libav/gst1-libav.hash
@@ -0,0 +1,2 @@
+# From http://lists.freedesktop.org/archives/gstreamer-announce/2014-September/000329.html
+sha256	833229d2b1aad6549ad0297435516508cc3ac47b166d6393ecdffc34c31a01d3	gst-libav-1.4.3.tar.xz
diff --git a/package/gstreamer1/gst1-libav/gst1-libav.mk b/package/gstreamer1/gst1-libav/gst1-libav.mk
index 7276aeb..1d04c2c 100644
--- a/package/gstreamer1/gst1-libav/gst1-libav.mk
+++ b/package/gstreamer1/gst1-libav/gst1-libav.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_LIBAV_VERSION = 1.4.1
+GST1_LIBAV_VERSION = 1.4.3
 GST1_LIBAV_SOURCE = gst-libav-$(GST1_LIBAV_VERSION).tar.xz
 GST1_LIBAV_SITE = http://gstreamer.freedesktop.org/src/gst-libav
 
