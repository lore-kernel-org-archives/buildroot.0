From: Peter Seiderer <ps.report@gmx.net>
Date: Wed,  9 Dec 2020 22:27:13 +0100
Subject: [Buildroot] [PATCH v1 11/14] package/gst-omx: bump version to 1.18.2
In-Reply-To: <20201209212716.15472-1-ps.report@gmx.net>
References: <20201209212716.15472-1-ps.report@gmx.net>
Message-ID: <20201209212716.15472-11-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/gstreamer1/gst-omx/gst-omx.hash | 4 ++--
 package/gstreamer1/gst-omx/gst-omx.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst-omx/gst-omx.hash b/package/gstreamer1/gst-omx/gst-omx.hash
index e4dfe61fa8..117165866f 100644
--- a/package/gstreamer1/gst-omx/gst-omx.hash
+++ b/package/gstreamer1/gst-omx/gst-omx.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-1.18.1.tar.xz.sha256sum
-sha256  42a8e0f9518b94655981ede441638f9f9395f4b1b9a4b329f068ee793975a965  gst-omx-1.18.1.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-1.18.2.tar.xz.sha256sum
+sha256  4c05d64544eecf4aaf5b337789916c67ed720317dfb2c8c8c335720fcc5c7cf4  gst-omx-1.18.2.tar.xz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/gstreamer1/gst-omx/gst-omx.mk b/package/gstreamer1/gst-omx/gst-omx.mk
index 2a9f7b6b15..f5392391de 100644
--- a/package/gstreamer1/gst-omx/gst-omx.mk
+++ b/package/gstreamer1/gst-omx/gst-omx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST_OMX_VERSION = 1.18.1
+GST_OMX_VERSION = 1.18.2
 GST_OMX_SOURCE = gst-omx-$(GST_OMX_VERSION).tar.xz
 GST_OMX_SITE = https://gstreamer.freedesktop.org/src/gst-omx
 
-- 
2.29.2
