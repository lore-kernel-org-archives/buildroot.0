From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 18 Mar 2021 20:47:42 +0100
Subject: [Buildroot] [PATCH v1 11/12] package/gst-omx: bump version to 1.18.4
In-Reply-To: <20210318194743.30623-1-ps.report@gmx.net>
References: <20210318194743.30623-1-ps.report@gmx.net>
Message-ID: <20210318194743.30623-12-ps.report@gmx.net>
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
index 0615e06a87..ceeaf4e57f 100644
--- a/package/gstreamer1/gst-omx/gst-omx.hash
+++ b/package/gstreamer1/gst-omx/gst-omx.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-1.18.3.tar.xz.sha256sum
-sha256  ed0f26504e9a60e15055134410f156e40952336410f2a59bdbbda45e61e8b93f  gst-omx-1.18.3.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-1.18.4.tar.xz.sha256sum
+sha256  e35051cf891eb2f31d6fcf176ff37d985f97f33874ac31b0b3ad3b5b95035043  gst-omx-1.18.4.tar.xz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/gstreamer1/gst-omx/gst-omx.mk b/package/gstreamer1/gst-omx/gst-omx.mk
index bd40452931..36a05be6b6 100644
--- a/package/gstreamer1/gst-omx/gst-omx.mk
+++ b/package/gstreamer1/gst-omx/gst-omx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST_OMX_VERSION = 1.18.3
+GST_OMX_VERSION = 1.18.4
 GST_OMX_SOURCE = gst-omx-$(GST_OMX_VERSION).tar.xz
 GST_OMX_SITE = https://gstreamer.freedesktop.org/src/gst-omx
 
-- 
2.30.2
