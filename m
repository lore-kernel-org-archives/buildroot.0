From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 17 Nov 2016 17:09:04 +0000
Subject: [Buildroot] [PATCH next 8/9] gstreamer1/gst1-validate: bump version
	to 1.10.1
In-Reply-To: <20161117170905.4691-1-Vincent.Riera@imgtec.com>
References: <20161117170905.4691-1-Vincent.Riera@imgtec.com>
Message-ID: <20161117170905.4691-8-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes:
  https://gstreamer.freedesktop.org/releases/gst-validate/1.10.1.html

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/gstreamer1/gst1-validate/gst1-validate.hash | 4 ++--
 package/gstreamer1/gst1-validate/gst1-validate.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-validate/gst1-validate.hash b/package/gstreamer1/gst1-validate/gst1-validate.hash
index f08e1b7..adfb2fa 100644
--- a/package/gstreamer1/gst1-validate/gst1-validate.hash
+++ b/package/gstreamer1/gst1-validate/gst1-validate.hash
@@ -1,2 +1,2 @@
-# From http://gstreamer.freedesktop.org/src/gst-validate/gst-validate-1.10.0.tar.xz.sha256sum
-sha256 a99a5cd1dfa5d021dd0197b32b04a20348479c097ebeb1f4c36161d70048a176  gst-validate-1.10.0.tar.xz
+# From http://gstreamer.freedesktop.org/src/gst-validate/gst-validate-1.10.1.tar.xz.sha256sum
+sha256 07ae671a3e77c5480d2c1732175dd3b3255b6937ac55d4b3e69a90f8e3043f75  gst-validate-1.10.1.tar.xz
diff --git a/package/gstreamer1/gst1-validate/gst1-validate.mk b/package/gstreamer1/gst1-validate/gst1-validate.mk
index 94595a6..cb857d0 100644
--- a/package/gstreamer1/gst1-validate/gst1-validate.mk
+++ b/package/gstreamer1/gst1-validate/gst1-validate.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_VALIDATE_VERSION = 1.10.0
+GST1_VALIDATE_VERSION = 1.10.1
 GST1_VALIDATE_SOURCE = gst-validate-$(GST1_VALIDATE_VERSION).tar.xz
 GST1_VALIDATE_SITE = https://gstreamer.freedesktop.org/src/gst-validate
 GST1_VALIDATE_LICENSE = LGPLv2.1+
-- 
2.10.1
