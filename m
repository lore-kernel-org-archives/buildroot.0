From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 31 Oct 2015 15:48:31 +0100
Subject: [Buildroot] [git commit] gst1-plugins-ugly: bump to version 1.6.1
Message-ID: <20151031145505.57A007FF39@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e1bba3ce0561a7374d4f887a383e6b3f653f9f37
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../gst1-plugins-ugly/gst1-plugins-ugly.hash       |    4 ++--
 .../gst1-plugins-ugly/gst1-plugins-ugly.mk         |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash
index d7ca7c3..7b418e4 100644
--- a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash
+++ b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash
@@ -1,2 +1,2 @@
-# From http://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-1.6.0.tar.xz.sha256sum
-sha256	91178dc0d687a83c083190a905681d3a66901374b1004fc52cd300b7802e5f06  gst-plugins-ugly-1.6.0.tar.xz
+# From http://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-1.6.1.tar.xz.sha256sum
+sha256	0cc3f90e4322efe1f774272e8fe5c185be37cf7999cd5ca7e0e0607e03d56a57  gst-plugins-ugly-1.6.1.tar.xz
diff --git a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
index 6489a02..3e02586 100644
--- a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
+++ b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_UGLY_VERSION = 1.6.0
+GST1_PLUGINS_UGLY_VERSION = 1.6.1
 GST1_PLUGINS_UGLY_SOURCE = gst-plugins-ugly-$(GST1_PLUGINS_UGLY_VERSION).tar.xz
 GST1_PLUGINS_UGLY_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-ugly
 GST1_PLUGINS_UGLY_LICENSE_FILES = COPYING
