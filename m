From: Peter Seiderer <ps.report@gmx.net>
Date: Thu,  4 Oct 2018 23:09:18 +0200
Subject: [Buildroot] [PATCH v1 04/11] gst1-plugins-bad: bump version to
 1.14.4
In-Reply-To: <20181004210925.25597-1-ps.report@gmx.net>
References: <20181004210925.25597-1-ps.report@gmx.net>
Message-ID: <20181004210925.25597-4-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash | 4 ++--
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash
index 8904e68518..cb4bf64677 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash
@@ -1,4 +1,4 @@
-# From https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-1.14.3.tar.xz.sha256sum
-sha256 b2224e5d9c1b85ad51233f6135524bb9e16a9172d395edc79c73b89094659fd5 gst-plugins-bad-1.14.3.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-1.14.4.tar.xz.sha256sum
+sha256 910b4e0e2e897e8b6d06767af1779d70057c309f67292f485ff988d087aa0de5 gst-plugins-bad-1.14.4.tar.xz
 sha256 0b12e4d1cd5db5f8a0c04fc98a1d8c3acc533097b6198d6644420da78d460223 COPYING
 sha256 cf9b86bcf2d298e8cf5b9d8982f9dab296465b002fdfa0347357a0732f961e03 COPYING.LIB
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index 1f4ed39eb5..ac39f1e5ce 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_BAD_VERSION = 1.14.3
+GST1_PLUGINS_BAD_VERSION = 1.14.4
 GST1_PLUGINS_BAD_SOURCE = gst-plugins-bad-$(GST1_PLUGINS_BAD_VERSION).tar.xz
 GST1_PLUGINS_BAD_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-bad
 GST1_PLUGINS_BAD_INSTALL_STAGING = YES
-- 
2.19.0
