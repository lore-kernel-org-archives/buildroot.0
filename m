From: Adam Duskett <aduskett@gmail.com>
Date: Mon,  9 Oct 2017 14:56:52 -0400
Subject: [Buildroot] [PATCH 03/10] gst1-plugins-good: bump to 1.12.3
In-Reply-To: <20171009185659.7631-1-Adamduskett@outlook.com>
References: <20171009185659.7631-1-Adamduskett@outlook.com>
Message-ID: <20171009185659.7631-3-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
 package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash | 4 ++--
 package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
index 881f9ed910..0d4b70b7bc 100644
--- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
+++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
@@ -1,2 +1,2 @@
-From https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.12.2.tar.xz.sha256sum
-sha256 5591ee7208ab30289a30658a82b76bf87169c927572d9b794f3a41ed48e1ee96 gst-plugins-good-1.12.2.tar.xz
+From https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.12.3.tar.xz.sha256sum
+sha256 13e7f479296891fef5a686438f20ba7d534680becf2269ecc5ee24aa83b45f03 gst-plugins-good-1.12.3.tar.xz
diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
index 1b02f8092d..379fef6531 100644
--- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
+++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_GOOD_VERSION = 1.12.2
+GST1_PLUGINS_GOOD_VERSION = 1.12.3
 GST1_PLUGINS_GOOD_SOURCE = gst-plugins-good-$(GST1_PLUGINS_GOOD_VERSION).tar.xz
 GST1_PLUGINS_GOOD_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-good
 GST1_PLUGINS_GOOD_LICENSE_FILES = COPYING
-- 
2.13.6
