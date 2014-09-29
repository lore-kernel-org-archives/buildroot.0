From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 29 Sep 2014 16:55:46 +0200
Subject: [Buildroot] [git commit] gst1-plugins-bad: bump version
Message-ID: <20140929153251.B93419D535@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1632be8e0d245f97252e6336f889b606566da887
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And add tarball hash from release announcement.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../gst1-plugins-bad/gst1-plugins-bad.hash         |    2 ++
 .../gst1-plugins-bad/gst1-plugins-bad.mk           |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash
new file mode 100644
index 0000000..cbae6e6
--- /dev/null
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash
@@ -0,0 +1,2 @@
+# From http://lists.freedesktop.org/archives/gstreamer-announce/2014-September/000329.html
+sha256	a6840080c469d0db51d6d4d0f7c42c97b3c8c01942f24401c61b1ad36726b97c	gst-plugins-bad-1.4.3.tar.xz
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index 0e3e64b..63167bc 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_BAD_VERSION = 1.4.1
+GST1_PLUGINS_BAD_VERSION = 1.4.3
 GST1_PLUGINS_BAD_SOURCE = gst-plugins-bad-$(GST1_PLUGINS_BAD_VERSION).tar.xz
 GST1_PLUGINS_BAD_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-bad
 GST1_PLUGINS_BAD_LICENSE_FILES = COPYING COPYING.LIB
