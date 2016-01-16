From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 16 Jan 2016 12:17:57 +0100
Subject: [Buildroot] [PATCH 1/1] package/ffmpeg: bump version to 2.8.5
Message-ID: <1452943077-18843-1-git-send-email-bernd.kuhls@t-online.de>
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
index 543d65d..5570a57 100644
--- a/package/ffmpeg/ffmpeg.hash
+++ b/package/ffmpeg/ffmpeg.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	8b6380a748fe2e0903d875b30aa613d1057824682d8d52f378d5aa5fc0dd951f	ffmpeg-2.8.4.tar.xz
+sha256	76fb83a267d2d1cb332742dadf28ad8b58af7958165f51bb1a2c226a122f0ac7	ffmpeg-2.8.5.tar.xz
diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 0f8b840..138618d 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FFMPEG_VERSION = 2.8.4
+FFMPEG_VERSION = 2.8.5
 FFMPEG_SOURCE = ffmpeg-$(FFMPEG_VERSION).tar.xz
 FFMPEG_SITE = http://ffmpeg.org/releases
 FFMPEG_INSTALL_STAGING = YES
-- 
2.7.0.rc3
