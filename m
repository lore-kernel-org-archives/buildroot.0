From: Peter Seiderer <ps.report@gmx.net>
Date: Thu,  3 Oct 2019 16:48:32 +0200
Subject: [Buildroot] [PATCH v1 05/11] gst1-plugins-ugly: bump version to
 1.16.1
In-Reply-To: <20191003144838.22437-1-ps.report@gmx.net>
References: <20191003144838.22437-1-ps.report@gmx.net>
Message-ID: <20191003144838.22437-5-ps.report@gmx.net>
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
index b80887a0cc..c9a7d9da10 100644
--- a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash
+++ b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-1.16.0.tar.xz.sha256sum
-sha256 e30964c5f031c32289e0b25e176c3c95a5737f2052dfc81d0f7427ef0233a4c2 gst-plugins-ugly-1.16.0.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-1.16.1.tar.xz.sha256sum
+sha256 4bf913b2ca5195ac3b53b5e3ade2dc7c45d2258507552ddc850c5fa425968a1d gst-plugins-ugly-1.16.1.tar.xz
 sha256 6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3 COPYING
diff --git a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
index f3ac2f79d3..be40a86793 100644
--- a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
+++ b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################

-GST1_PLUGINS_UGLY_VERSION = 1.16.0
+GST1_PLUGINS_UGLY_VERSION = 1.16.1
 GST1_PLUGINS_UGLY_SOURCE = gst-plugins-ugly-$(GST1_PLUGINS_UGLY_VERSION).tar.xz
 GST1_PLUGINS_UGLY_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-ugly
 GST1_PLUGINS_UGLY_LICENSE_FILES = COPYING
--
2.23.0
