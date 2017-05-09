From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 9 May 2017 18:21:12 +0100
Subject: [Buildroot] [PATCH next 04/11] gst1-libav: bump version to 1.12.0
In-Reply-To: <20170509172119.33642-1-Vincent.Riera@imgtec.com>
References: <20170509172119.33642-1-Vincent.Riera@imgtec.com>
Message-ID: <20170509172119.33642-4-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/gstreamer1/gst1-libav/gst1-libav.hash | 4 ++--
 package/gstreamer1/gst1-libav/gst1-libav.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-libav/gst1-libav.hash b/package/gstreamer1/gst1-libav/gst1-libav.hash
index cc83429..d88fe07 100644
--- a/package/gstreamer1/gst1-libav/gst1-libav.hash
+++ b/package/gstreamer1/gst1-libav/gst1-libav.hash
@@ -1,2 +1,2 @@
-# From http://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.10.4.tar.xz.sha256sum
-sha256 6ca0feca75e3d48315e07f20ec37cf6260ed1e9dde58df355febd5016246268b  gst-libav-1.10.4.tar.xz
+# From http://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.12.0.tar.xz.sha256sum
+sha256 39d1477f642ee980b008e78d716b16801eec9a6e5958c5a6cdc0cb04ab0750c4  gst-libav-1.12.0.tar.xz
diff --git a/package/gstreamer1/gst1-libav/gst1-libav.mk b/package/gstreamer1/gst1-libav/gst1-libav.mk
index 41c19d1..b834c73 100644
--- a/package/gstreamer1/gst1-libav/gst1-libav.mk
+++ b/package/gstreamer1/gst1-libav/gst1-libav.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_LIBAV_VERSION = 1.10.4
+GST1_LIBAV_VERSION = 1.12.0
 GST1_LIBAV_SOURCE = gst-libav-$(GST1_LIBAV_VERSION).tar.xz
 GST1_LIBAV_SITE = https://gstreamer.freedesktop.org/src/gst-libav
 GST1_LIBAV_CONF_OPTS = --with-system-libav
-- 
2.10.2
