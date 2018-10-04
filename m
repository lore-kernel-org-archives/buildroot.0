From: Peter Seiderer <ps.report@gmx.net>
Date: Thu,  4 Oct 2018 23:09:17 +0200
Subject: [Buildroot] [PATCH v1 03/11] gst1-plugins-good: bump version to
 1.14.4
In-Reply-To: <20181004210925.25597-1-ps.report@gmx.net>
References: <20181004210925.25597-1-ps.report@gmx.net>
Message-ID: <20181004210925.25597-3-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash | 4 ++--
 package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
index 663dab3932..1d08938e09 100644
--- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
+++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.14.3.tar.xz.sha256sum
-sha256 5112bce6af0be62760687ca47873c90ce4d65d3fe920a3adf8145db7b07bff5d gst-plugins-good-1.14.3.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.14.4.tar.xz.sha256sum
+sha256 5f8b553260cb0aac56890053d8511db1528d53cae10f0287cfce2cb2acc70979 gst-plugins-good-1.14.4.tar.xz
 sha256 6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3 COPYING
diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
index 9ad7cc4470..2e6ac6dbb3 100644
--- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
+++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_GOOD_VERSION = 1.14.3
+GST1_PLUGINS_GOOD_VERSION = 1.14.4
 GST1_PLUGINS_GOOD_SOURCE = gst-plugins-good-$(GST1_PLUGINS_GOOD_VERSION).tar.xz
 GST1_PLUGINS_GOOD_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-good
 GST1_PLUGINS_GOOD_LICENSE_FILES = COPYING
-- 
2.19.0
