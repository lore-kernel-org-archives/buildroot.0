From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 15 Jan 2021 23:54:01 +0100
Subject: [Buildroot] [PATCH v1 06/12] package/gst1-devtools: bump version to
 1.18.3
In-Reply-To: <20210115225407.2350-1-ps.report@gmx.net>
References: <20210115225407.2350-1-ps.report@gmx.net>
Message-ID: <20210115225407.2350-6-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/gstreamer1/gst1-devtools/gst1-devtools.hash | 4 ++--
 package/gstreamer1/gst1-devtools/gst1-devtools.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-devtools/gst1-devtools.hash b/package/gstreamer1/gst1-devtools/gst1-devtools.hash
index c4a9ff61ee..bfed3570f7 100644
--- a/package/gstreamer1/gst1-devtools/gst1-devtools.hash
+++ b/package/gstreamer1/gst1-devtools/gst1-devtools.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-1.18.2.tar.xz.sha256sum
-sha256  6ea73d718bf1f9692218540ff88479c51d67c0b477fa56d6812fc7b739d30a56  gst-devtools-1.18.2.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-1.18.3.tar.xz.sha256sum
+sha256  3025fee3607caf5069154c099533785675916e044ee92c936bbeacdda3750f26  gst-devtools-1.18.3.tar.xz
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  validate/COPYING
diff --git a/package/gstreamer1/gst1-devtools/gst1-devtools.mk b/package/gstreamer1/gst1-devtools/gst1-devtools.mk
index a3c6eff187..5e1f0110ee 100644
--- a/package/gstreamer1/gst1-devtools/gst1-devtools.mk
+++ b/package/gstreamer1/gst1-devtools/gst1-devtools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_DEVTOOLS_VERSION = 1.18.2
+GST1_DEVTOOLS_VERSION = 1.18.3
 GST1_DEVTOOLS_SOURCE = gst-devtools-$(GST1_DEVTOOLS_VERSION).tar.xz
 GST1_DEVTOOLS_SITE = https://gstreamer.freedesktop.org/src/gst-devtools
 GST1_DEVTOOLS_LICENSE = LGPL-2.1+
-- 
2.29.2
