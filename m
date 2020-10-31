From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 31 Oct 2020 16:08:49 +0100
Subject: [Buildroot] [git commit] package/gstreamer1/gst-omx: bump version
 to 1.18.1
Message-ID: <20201031145618.A55F4840DF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8487001ef2a5efaa1f2cb63d173cc870cbc0207a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gstreamer1/gst-omx/gst-omx.hash | 4 ++--
 package/gstreamer1/gst-omx/gst-omx.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst-omx/gst-omx.hash b/package/gstreamer1/gst-omx/gst-omx.hash
index 9cd1b49a33..e4dfe61fa8 100644
--- a/package/gstreamer1/gst-omx/gst-omx.hash
+++ b/package/gstreamer1/gst-omx/gst-omx.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-1.18.0.tar.xz.sha256sum
-sha256  302c65e04578991364f7605e04cfb54dfd75268d51080d35f221ee1a8b341fad  gst-omx-1.18.0.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-1.18.1.tar.xz.sha256sum
+sha256  42a8e0f9518b94655981ede441638f9f9395f4b1b9a4b329f068ee793975a965  gst-omx-1.18.1.tar.xz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/gstreamer1/gst-omx/gst-omx.mk b/package/gstreamer1/gst-omx/gst-omx.mk
index 9e35ff3d04..2a9f7b6b15 100644
--- a/package/gstreamer1/gst-omx/gst-omx.mk
+++ b/package/gstreamer1/gst-omx/gst-omx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST_OMX_VERSION = 1.18.0
+GST_OMX_VERSION = 1.18.1
 GST_OMX_SOURCE = gst-omx-$(GST_OMX_VERSION).tar.xz
 GST_OMX_SITE = https://gstreamer.freedesktop.org/src/gst-omx
 
