From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon,  1 Feb 2016 23:12:30 +0100
Subject: [Buildroot] [PATCH 1/1] package/ffmpeg: bump version to 2.8.6
Message-ID: <1454364750-20925-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/ffmpeg/ffmpeg.hash | 2 +-
 package/ffmpeg/ffmpeg.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ffmpeg/ffmpeg.hash b/package/ffmpeg/ffmpeg.hash
index 5570a57..8643bff 100644
--- a/package/ffmpeg/ffmpeg.hash
+++ b/package/ffmpeg/ffmpeg.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	76fb83a267d2d1cb332742dadf28ad8b58af7958165f51bb1a2c226a122f0ac7	ffmpeg-2.8.5.tar.xz
+sha256	25bcedbdafadac3d09c325c1d46a51f53d858b26a260d5aed6b4f17fea6e07fa	ffmpeg-2.8.6.tar.xz
diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 138618d..ddfac20 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FFMPEG_VERSION = 2.8.5
+FFMPEG_VERSION = 2.8.6
 FFMPEG_SOURCE = ffmpeg-$(FFMPEG_VERSION).tar.xz
 FFMPEG_SITE = http://ffmpeg.org/releases
 FFMPEG_INSTALL_STAGING = YES
-- 
2.7.0
