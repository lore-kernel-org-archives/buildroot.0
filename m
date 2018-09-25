From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 25 Sep 2018 22:08:55 +0200
Subject: [Buildroot] [PATCH v1 02/14] gst1-plugins-base: bump version to
 1.14.3
In-Reply-To: <20180925200907.19217-1-ps.report@gmx.net>
References: <20180925200907.19217-1-ps.report@gmx.net>
Message-ID: <20180925200907.19217-2-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash | 4 ++--
 package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash
index 6e13f97a9f..a98abdf38b 100644
--- a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash
+++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-1.14.2.tar.xz.sha256sum
-sha256 a4b7e80ba869f599307449b17c9e00b5d1e94d3ba1d8a1a386b8770b2ef01c7c gst-plugins-base-1.14.2.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-1.14.3.tar.xz.sha256sum
+sha256 f0b319c36be0ffc2a00380c77ba269cdf04e2b39bbc49d30b641fc35aa0b7952 gst-plugins-base-1.14.3.tar.xz
 sha256 78fb5977f177ab71cba77a4a127d29b93cb1ca5c25962204b31f183a20cf5c7a COPYING
diff --git a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
index 10b1fec439..862ae5e6e8 100644
--- a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
+++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_BASE_VERSION = 1.14.2
+GST1_PLUGINS_BASE_VERSION = 1.14.3
 GST1_PLUGINS_BASE_SOURCE = gst-plugins-base-$(GST1_PLUGINS_BASE_VERSION).tar.xz
 GST1_PLUGINS_BASE_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-base
 GST1_PLUGINS_BASE_INSTALL_STAGING = YES
-- 
2.19.0
