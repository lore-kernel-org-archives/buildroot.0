From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 29 Sep 2014 17:01:32 +0200
Subject: [Buildroot] [git commit] gst1-plugins-ugly: bump version
Message-ID: <20140929153251.C21CE9D535@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d096bf0143d51798f0c221ea3f382367cd3f6561
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And add tarball hash from release announcement.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../gst1-plugins-ugly/gst1-plugins-ugly.hash       |    2 ++
 .../gst1-plugins-ugly/gst1-plugins-ugly.mk         |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash
new file mode 100644
index 0000000..575336e
--- /dev/null
+++ b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash
@@ -0,0 +1,2 @@
+# From http://lists.freedesktop.org/archives/gstreamer-announce/2014-September/000329.html
+sha256	d581592a82cf3930361430d38436c30a58d8b6c249cad18f7f213b203e206d46	gst-plugins-ugly-1.4.3.tar.xz
diff --git a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
index c5b86f0..34aafc6 100644
--- a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
+++ b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_UGLY_VERSION = 1.4.1
+GST1_PLUGINS_UGLY_VERSION = 1.4.3
 GST1_PLUGINS_UGLY_SOURCE = gst-plugins-ugly-$(GST1_PLUGINS_UGLY_VERSION).tar.xz
 GST1_PLUGINS_UGLY_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-ugly
 GST1_PLUGINS_UGLY_LICENSE_FILES = COPYING
