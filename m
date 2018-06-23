From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 24 Jun 2018 00:35:23 +0200
Subject: [Buildroot] [PATCH v6 3/9] gst-omx: bump to 1.14.1
In-Reply-To: <20180623223529.13629-1-ps.report@gmx.net>
References: <20180623223529.13629-1-ps.report@gmx.net>
Message-ID: <20180623223529.13629-4-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <aduskett@gmail.com>

Also add hash for license file.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
[Update to 1.14.1]
Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v5 -> v6:
  - update to 1.14.1
---
 package/gstreamer1/gst-omx/gst-omx.hash | 5 +++--
 package/gstreamer1/gst-omx/gst-omx.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst-omx/gst-omx.hash b/package/gstreamer1/gst-omx/gst-omx.hash
index c4f8b10bce..5535a75812 100644
--- a/package/gstreamer1/gst-omx/gst-omx.hash
+++ b/package/gstreamer1/gst-omx/gst-omx.hash
@@ -1,2 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-1.12.4.tar.xz.sha256sum
-sha256 a025fa24242ec868fe0ff1e66d806a1070bcbc7c14a987a89cdc3395d0d56d5f gst-omx-1.12.4.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-1.14.1.tar.xz.sha256sum
+sha256 7cb6c39301dfa3960abce195305c7cf431736bf6b47bde1fd4412c81c3e75cd8 gst-omx-1.14.1.tar.xz
+sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551 COPYING
diff --git a/package/gstreamer1/gst-omx/gst-omx.mk b/package/gstreamer1/gst-omx/gst-omx.mk
index 68cb7f6696..8242d24a1f 100644
--- a/package/gstreamer1/gst-omx/gst-omx.mk
+++ b/package/gstreamer1/gst-omx/gst-omx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST_OMX_VERSION = 1.12.4
+GST_OMX_VERSION = 1.14.1
 GST_OMX_SOURCE = gst-omx-$(GST_OMX_VERSION).tar.xz
 GST_OMX_SITE = https://gstreamer.freedesktop.org/src/gst-omx
 
-- 
2.17.1
