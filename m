From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 29 Sep 2014 16:47:10 +0200
Subject: [Buildroot] [git commit] gst1-plugins-base: bump version
Message-ID: <20140929153251.A57849D535@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a5e912cd8b2369a9e26b1f339dc940ee98526891
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And add tarball hash from release announcement.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../gst1-plugins-base/gst1-plugins-base.hash       |    2 ++
 .../gst1-plugins-base/gst1-plugins-base.mk         |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash
new file mode 100644
index 0000000..0c8bdad
--- /dev/null
+++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash
@@ -0,0 +1,2 @@
+# From http://lists.freedesktop.org/archives/gstreamer-announce/2014-September/000329.html
+sha256	f7b4d2b3ba2bcac485896e2c1c36459cb091ebe8b49e91635c27d40f66792d9d	gst-plugins-base-1.4.3.tar.xz
diff --git a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
index 65f093f..99a50f3 100644
--- a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
+++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_BASE_VERSION = 1.4.1
+GST1_PLUGINS_BASE_VERSION = 1.4.3
 GST1_PLUGINS_BASE_SOURCE = gst-plugins-base-$(GST1_PLUGINS_BASE_VERSION).tar.xz
 GST1_PLUGINS_BASE_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-base
 GST1_PLUGINS_BASE_INSTALL_STAGING = YES
