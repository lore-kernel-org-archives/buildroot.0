From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 30 Nov 2016 13:53:01 +0100
Subject: [Buildroot] [git commit] gstreamer1/gst1-libav: bump version to
	1.10.2
Message-ID: <20161201222141.5986F8026C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4c4f58edfb28cba186da55ac24069d9ef2b4a336
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst1-libav/gst1-libav.hash | 4 ++--
 package/gstreamer1/gst1-libav/gst1-libav.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-libav/gst1-libav.hash b/package/gstreamer1/gst1-libav/gst1-libav.hash
index 1bb714f..8cda287 100644
--- a/package/gstreamer1/gst1-libav/gst1-libav.hash
+++ b/package/gstreamer1/gst1-libav/gst1-libav.hash
@@ -1,2 +1,2 @@
-# From http://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.10.1.tar.xz.sha256sum
-sha256 27b28b8de0e6dff1e3952428e8ed8ba4a12f452f789ac0ae9bbe50f00a5c72c7  gst-libav-1.10.1.tar.xz
+# From http://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.10.2.tar.xz.sha256sum
+sha256 a3dd7036211f061e1eda04f985b7a9dd1a91b754f767ff2587eb6ec28f44e73c  gst-libav-1.10.2.tar.xz
diff --git a/package/gstreamer1/gst1-libav/gst1-libav.mk b/package/gstreamer1/gst1-libav/gst1-libav.mk
index eec6303..8687ac6 100644
--- a/package/gstreamer1/gst1-libav/gst1-libav.mk
+++ b/package/gstreamer1/gst1-libav/gst1-libav.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_LIBAV_VERSION = 1.10.1
+GST1_LIBAV_VERSION = 1.10.2
 GST1_LIBAV_SOURCE = gst-libav-$(GST1_LIBAV_VERSION).tar.xz
 GST1_LIBAV_SITE = https://gstreamer.freedesktop.org/src/gst-libav
 GST1_LIBAV_CONF_OPTS = --with-system-libav
