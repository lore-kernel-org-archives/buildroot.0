From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 27 May 2017 14:50:17 +0200
Subject: [Buildroot] [PATCH/next] package/libv4l: bump version to 1.12.5
Message-ID: <20170527125017.5450-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libv4l/libv4l.hash | 2 +-
 package/libv4l/libv4l.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libv4l/libv4l.hash b/package/libv4l/libv4l.hash
index c02fa0aed..fc7bd1b9a 100644
--- a/package/libv4l/libv4l.hash
+++ b/package/libv4l/libv4l.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	ac9f8c88bfffa3a7e85c0edd04f7d3d54e6a30c214e79f2c6ecc6fbf57cb229d	v4l-utils-1.12.2.tar.bz2
+sha256 0618162ddb0b57fe7c45407d4d66ed79e3a134cdbc9e72598d34e61d3359e20d  v4l-utils-1.12.5.tar.bz2
diff --git a/package/libv4l/libv4l.mk b/package/libv4l/libv4l.mk
index 465f6ccb6..b139fa2fa 100644
--- a/package/libv4l/libv4l.mk
+++ b/package/libv4l/libv4l.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBV4L_VERSION = 1.12.2
+LIBV4L_VERSION = 1.12.5
 LIBV4L_SOURCE = v4l-utils-$(LIBV4L_VERSION).tar.bz2
 LIBV4L_SITE = http://linuxtv.org/downloads/v4l-utils
 LIBV4L_INSTALL_STAGING = YES
-- 
2.11.0
