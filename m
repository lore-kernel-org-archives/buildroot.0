From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 24 Jul 2017 22:26:40 +0200
Subject: [Buildroot] [PATCH v2 04/10] gst1-plugins-bad: bump version to
	1.12.2
In-Reply-To: <20170724202646.28628-1-ps.report@gmx.net>
References: <20170724202646.28628-1-ps.report@gmx.net>
Message-ID: <20170724202646.28628-4-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v1 -> v2:
  - add missing SOB line
---
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash | 4 ++--
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash
index c572d3e0ef..b34fb02b5e 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash
@@ -1,2 +1,2 @@
-# From https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-1.12.1.tar.xz.sha256sum
-sha256 7def8049d1c44e50199023159dfada60af58fd503ef58a020b79044bda705b97  gst-plugins-bad-1.12.1.tar.xz
+From https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-1.12.2.tar.xz.sha256sum
+sha256 9c2c7edde4f59d74eb414e0701c55131f562e5c605a3ce9b091754f106c09e37 gst-plugins-bad-1.12.2.tar.xz
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index 2e9e6f11da..7a32689b85 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_BAD_VERSION = 1.12.1
+GST1_PLUGINS_BAD_VERSION = 1.12.2
 GST1_PLUGINS_BAD_SOURCE = gst-plugins-bad-$(GST1_PLUGINS_BAD_VERSION).tar.xz
 GST1_PLUGINS_BAD_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-bad
 GST1_PLUGINS_BAD_INSTALL_STAGING = YES
-- 
2.11.0
