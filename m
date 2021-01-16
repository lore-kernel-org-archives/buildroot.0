From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 16 Jan 2021 21:43:48 +0100
Subject: [Buildroot] [git commit] package/gst-omx: bump version to 1.18.3
Message-ID: <20210116203504.8CCB087892@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=54ecd36d2ba76893a9a42699e60b6fe55f2cfa82
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gstreamer1/gst-omx/gst-omx.hash | 4 ++--
 package/gstreamer1/gst-omx/gst-omx.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst-omx/gst-omx.hash b/package/gstreamer1/gst-omx/gst-omx.hash
index 117165866f..0615e06a87 100644
--- a/package/gstreamer1/gst-omx/gst-omx.hash
+++ b/package/gstreamer1/gst-omx/gst-omx.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-1.18.2.tar.xz.sha256sum
-sha256  4c05d64544eecf4aaf5b337789916c67ed720317dfb2c8c8c335720fcc5c7cf4  gst-omx-1.18.2.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-1.18.3.tar.xz.sha256sum
+sha256  ed0f26504e9a60e15055134410f156e40952336410f2a59bdbbda45e61e8b93f  gst-omx-1.18.3.tar.xz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/gstreamer1/gst-omx/gst-omx.mk b/package/gstreamer1/gst-omx/gst-omx.mk
index f5392391de..bd40452931 100644
--- a/package/gstreamer1/gst-omx/gst-omx.mk
+++ b/package/gstreamer1/gst-omx/gst-omx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST_OMX_VERSION = 1.18.2
+GST_OMX_VERSION = 1.18.3
 GST_OMX_SOURCE = gst-omx-$(GST_OMX_VERSION).tar.xz
 GST_OMX_SITE = https://gstreamer.freedesktop.org/src/gst-omx
 
