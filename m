From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 31 Oct 2020 01:10:01 +0100
Subject: [Buildroot] [PATCH v1 06/11] package/gst1-devtools: bump version to
 1.18.1
In-Reply-To: <20201031001006.21829-1-ps.report@gmx.net>
References: <20201031001006.21829-1-ps.report@gmx.net>
Message-ID: <20201031001006.21829-6-ps.report@gmx.net>
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
index 8d26e200ad..eea0086d70 100644
--- a/package/gstreamer1/gst1-devtools/gst1-devtools.hash
+++ b/package/gstreamer1/gst1-devtools/gst1-devtools.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-1.18.0.tar.xz.sha256sum
-sha256  82337141b5654f11c440f783892ba9d9498b3b6b98c2286b000f96dce6945f16  gst-devtools-1.18.0.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-1.18.1.tar.xz.sha256sum
+sha256  712212babd2238233d55beecfc0fe1ea8db18e8807ac6ab05a64505b2c7ab0df  gst-devtools-1.18.1.tar.xz
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  validate/COPYING
diff --git a/package/gstreamer1/gst1-devtools/gst1-devtools.mk b/package/gstreamer1/gst1-devtools/gst1-devtools.mk
index 65c9bd4914..4b64c85021 100644
--- a/package/gstreamer1/gst1-devtools/gst1-devtools.mk
+++ b/package/gstreamer1/gst1-devtools/gst1-devtools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_DEVTOOLS_VERSION = 1.18.0
+GST1_DEVTOOLS_VERSION = 1.18.1
 GST1_DEVTOOLS_SOURCE = gst-devtools-$(GST1_DEVTOOLS_VERSION).tar.xz
 GST1_DEVTOOLS_SITE = https://gstreamer.freedesktop.org/src/gst-devtools
 GST1_DEVTOOLS_LICENSE = LGPL-2.1+
-- 
2.29.0
