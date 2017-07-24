From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 24 Jul 2017 22:26:39 +0200
Subject: [Buildroot] [PATCH v2 03/10] gst1-plugins-good: bump version to
	1.12.2
In-Reply-To: <20170724202646.28628-1-ps.report@gmx.net>
References: <20170724202646.28628-1-ps.report@gmx.net>
Message-ID: <20170724202646.28628-3-ps.report@gmx.net>
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
 package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash | 4 ++--
 package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
index 54ad40de48..881f9ed910 100644
--- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
+++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
@@ -1,2 +1,2 @@
-# From https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.12.1.tar.xz.sha256sum
-sha256 121e8e46a7f0e622f09ec9be012607b89d737dd72d48b0f2f0680821ae2cf54b  gst-plugins-good-1.12.1.tar.xz
+From https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.12.2.tar.xz.sha256sum
+sha256 5591ee7208ab30289a30658a82b76bf87169c927572d9b794f3a41ed48e1ee96 gst-plugins-good-1.12.2.tar.xz
diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
index bd56628911..1b02f8092d 100644
--- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
+++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_GOOD_VERSION = 1.12.1
+GST1_PLUGINS_GOOD_VERSION = 1.12.2
 GST1_PLUGINS_GOOD_SOURCE = gst-plugins-good-$(GST1_PLUGINS_GOOD_VERSION).tar.xz
 GST1_PLUGINS_GOOD_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-good
 GST1_PLUGINS_GOOD_LICENSE_FILES = COPYING
-- 
2.11.0
