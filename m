From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 25 Sep 2018 22:08:56 +0200
Subject: [Buildroot] [PATCH v1 03/14] gst1-plugins-good: bump version to
 1.14.3
In-Reply-To: <20180925200907.19217-1-ps.report@gmx.net>
References: <20180925200907.19217-1-ps.report@gmx.net>
Message-ID: <20180925200907.19217-3-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash | 4 ++--
 package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
index 65750fa5a4..663dab3932 100644
--- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
+++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.14.2.tar.xz.sha256sum
-sha256 c0575e2811860bfff59b865b8d125153859a01f0615fa41e279b64d88d25caad gst-plugins-good-1.14.2.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.14.3.tar.xz.sha256sum
+sha256 5112bce6af0be62760687ca47873c90ce4d65d3fe920a3adf8145db7b07bff5d gst-plugins-good-1.14.3.tar.xz
 sha256 6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3 COPYING
diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
index 21a7668c65..9ad7cc4470 100644
--- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
+++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_GOOD_VERSION = 1.14.2
+GST1_PLUGINS_GOOD_VERSION = 1.14.3
 GST1_PLUGINS_GOOD_SOURCE = gst-plugins-good-$(GST1_PLUGINS_GOOD_VERSION).tar.xz
 GST1_PLUGINS_GOOD_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-good
 GST1_PLUGINS_GOOD_LICENSE_FILES = COPYING
-- 
2.19.0
