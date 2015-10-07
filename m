From: Peter Seiderer <ps.report@gmx.net>
Date: Wed,  7 Oct 2015 23:30:03 +0200
Subject: [Buildroot] [PATCH v1 5/7] gst1-plugins-ugly: bump version to 1.6.0
In-Reply-To: <1444253405-3994-1-git-send-email-ps.report@gmx.net>
References: <1444253405-3994-1-git-send-email-ps.report@gmx.net>
Message-ID: <1444253405-3994-5-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash | 4 ++--
 package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash
index a031dc5..d7ca7c3 100644
--- a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash
+++ b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash
@@ -1,2 +1,2 @@
-# From http://lists.freedesktop.org/archives/gstreamer-devel/2014-December/050904.html
-sha256	5cd5e81cf618944f4dc935f1669b2125e8bb2fe9cc7dc8dc15b72237aca49067  gst-plugins-ugly-1.4.5.tar.xz
+# From http://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-1.6.0.tar.xz.sha256sum
+sha256	91178dc0d687a83c083190a905681d3a66901374b1004fc52cd300b7802e5f06  gst-plugins-ugly-1.6.0.tar.xz
diff --git a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
index daa9e3f..6489a02 100644
--- a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
+++ b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_UGLY_VERSION = 1.4.5
+GST1_PLUGINS_UGLY_VERSION = 1.6.0
 GST1_PLUGINS_UGLY_SOURCE = gst-plugins-ugly-$(GST1_PLUGINS_UGLY_VERSION).tar.xz
 GST1_PLUGINS_UGLY_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-ugly
 GST1_PLUGINS_UGLY_LICENSE_FILES = COPYING
-- 
2.1.4
