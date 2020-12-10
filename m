From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 10 Dec 2020 22:21:41 +0100
Subject: [Buildroot] [git commit] package/gstreamer1/gst1-devtools: bump
 version to 1.18.2
Message-ID: <20201210210758.E482D8267F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9303dfe732a79aa9ff506282589dd2bd409b96a1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gstreamer1/gst1-devtools/gst1-devtools.hash | 4 ++--
 package/gstreamer1/gst1-devtools/gst1-devtools.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-devtools/gst1-devtools.hash b/package/gstreamer1/gst1-devtools/gst1-devtools.hash
index eea0086d70..c4a9ff61ee 100644
--- a/package/gstreamer1/gst1-devtools/gst1-devtools.hash
+++ b/package/gstreamer1/gst1-devtools/gst1-devtools.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-1.18.1.tar.xz.sha256sum
-sha256  712212babd2238233d55beecfc0fe1ea8db18e8807ac6ab05a64505b2c7ab0df  gst-devtools-1.18.1.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-1.18.2.tar.xz.sha256sum
+sha256  6ea73d718bf1f9692218540ff88479c51d67c0b477fa56d6812fc7b739d30a56  gst-devtools-1.18.2.tar.xz
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  validate/COPYING
diff --git a/package/gstreamer1/gst1-devtools/gst1-devtools.mk b/package/gstreamer1/gst1-devtools/gst1-devtools.mk
index 4b64c85021..a3c6eff187 100644
--- a/package/gstreamer1/gst1-devtools/gst1-devtools.mk
+++ b/package/gstreamer1/gst1-devtools/gst1-devtools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_DEVTOOLS_VERSION = 1.18.1
+GST1_DEVTOOLS_VERSION = 1.18.2
 GST1_DEVTOOLS_SOURCE = gst-devtools-$(GST1_DEVTOOLS_VERSION).tar.xz
 GST1_DEVTOOLS_SITE = https://gstreamer.freedesktop.org/src/gst-devtools
 GST1_DEVTOOLS_LICENSE = LGPL-2.1+
