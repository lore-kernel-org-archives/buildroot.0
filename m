From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 30 Nov 2016 11:25:12 +0000
Subject: [Buildroot] [PATCH next 04/10] gstreamer1/gst1-plugins-bad: bump
	version to 1.10.2
In-Reply-To: <20161130112518.36300-1-Vincent.Riera@imgtec.com>
References: <20161130112518.36300-1-Vincent.Riera@imgtec.com>
Message-ID: <20161130112518.36300-4-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash | 4 ++--
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash
index 3b14e29..999a4e8 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash
@@ -1,2 +1,2 @@
-# From http://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-1.10.1.tar.xz.sha256sum
-sha256 133e0ed9fe21011b15d3898e3d3a9d17ab74eed31996da2e353353e688ca921d  gst-plugins-bad-1.10.1.tar.xz
+# From http://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-1.10.2.tar.xz.sha256sum
+sha256 0795ca9303a99cc7e44dda0e6e18524de02b39892e4b68eaba488f7b9db53a3a  gst-plugins-bad-1.10.2.tar.xz
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index 3172489..ba9f305 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_BAD_VERSION = 1.10.1
+GST1_PLUGINS_BAD_VERSION = 1.10.2
 GST1_PLUGINS_BAD_SOURCE = gst-plugins-bad-$(GST1_PLUGINS_BAD_VERSION).tar.xz
 GST1_PLUGINS_BAD_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-bad
 GST1_PLUGINS_BAD_INSTALL_STAGING = YES
-- 
2.10.1
