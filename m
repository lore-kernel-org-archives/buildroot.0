From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 25 Sep 2018 22:09:04 +0200
Subject: [Buildroot] [PATCH v1 11/14] gst-omx: bump version to 1.14.3
In-Reply-To: <20180925200907.19217-1-ps.report@gmx.net>
References: <20180925200907.19217-1-ps.report@gmx.net>
Message-ID: <20180925200907.19217-11-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/gstreamer1/gst-omx/gst-omx.hash | 4 ++--
 package/gstreamer1/gst-omx/gst-omx.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst-omx/gst-omx.hash b/package/gstreamer1/gst-omx/gst-omx.hash
index 3e94d4eee0..6d4361e6ed 100644
--- a/package/gstreamer1/gst-omx/gst-omx.hash
+++ b/package/gstreamer1/gst-omx/gst-omx.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-1.14.2.tar.xz.sha256sum
-sha256 316dbb13693795383cad6ec4dbebd94a869cd1f9d59a393686cad0b77bf9b5a9 gst-omx-1.14.2.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-1.14.3.tar.xz.sha256sum
+sha256 6ba7dc5caabce092ea645b5c6de1a82d12ee086d18f692a8f31cbc359b708cb1 gst-omx-1.14.3.tar.xz
 sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551 COPYING
diff --git a/package/gstreamer1/gst-omx/gst-omx.mk b/package/gstreamer1/gst-omx/gst-omx.mk
index f70477823e..2c0aec4f1f 100644
--- a/package/gstreamer1/gst-omx/gst-omx.mk
+++ b/package/gstreamer1/gst-omx/gst-omx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST_OMX_VERSION = 1.14.2
+GST_OMX_VERSION = 1.14.3
 GST_OMX_SOURCE = gst-omx-$(GST_OMX_VERSION).tar.xz
 GST_OMX_SITE = https://gstreamer.freedesktop.org/src/gst-omx
 
-- 
2.19.0
