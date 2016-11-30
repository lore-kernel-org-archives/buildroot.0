From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 30 Nov 2016 11:25:10 +0000
Subject: [Buildroot] [PATCH next 02/10] gstreamer1/gst1-plugins-base: bump
	version to 1.10.2
In-Reply-To: <20161130112518.36300-1-Vincent.Riera@imgtec.com>
References: <20161130112518.36300-1-Vincent.Riera@imgtec.com>
Message-ID: <20161130112518.36300-2-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash | 4 ++--
 package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash
index 70aad4d..3f4d0cd 100644
--- a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash
+++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash
@@ -1,2 +1,2 @@
-# From http://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-1.10.1.tar.xz.sha256sum
-sha256 66cfee294c7aaf9d7867eaba4841ca6254ea74f1a8b53e1289f4d3b9b6c976c9  gst-plugins-base-1.10.1.tar.xz
+# From http://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-1.10.2.tar.xz.sha256sum
+sha256 fbc0d40fcb746d2efe2ea47444674029912f66e6107f232766d33b722b97de20  gst-plugins-base-1.10.2.tar.xz
diff --git a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
index c89c22d..1014bd7 100644
--- a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
+++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_BASE_VERSION = 1.10.1
+GST1_PLUGINS_BASE_VERSION = 1.10.2
 GST1_PLUGINS_BASE_SOURCE = gst-plugins-base-$(GST1_PLUGINS_BASE_VERSION).tar.xz
 GST1_PLUGINS_BASE_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-base
 GST1_PLUGINS_BASE_INSTALL_STAGING = YES
-- 
2.10.1
