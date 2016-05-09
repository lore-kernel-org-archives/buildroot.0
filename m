From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon,  9 May 2016 18:29:20 +0200
Subject: [Buildroot] [PATCH 1/1] package/ffmpeg: bump version to 2.8.7
Message-ID: <1462811360-3563-1-git-send-email-bernd.kuhls@t-online.de>
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
index 8643bff..3120a7a 100644
--- a/package/ffmpeg/ffmpeg.hash
+++ b/package/ffmpeg/ffmpeg.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	25bcedbdafadac3d09c325c1d46a51f53d858b26a260d5aed6b4f17fea6e07fa	ffmpeg-2.8.6.tar.xz
+sha256	97be8a6c1cab2c52015544f76d40f6fd0babcb1b40cf601b4e57fb818564157c	ffmpeg-2.8.7.tar.xz
diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index ddfac20..a2026dc 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FFMPEG_VERSION = 2.8.6
+FFMPEG_VERSION = 2.8.7
 FFMPEG_SOURCE = ffmpeg-$(FFMPEG_VERSION).tar.xz
 FFMPEG_SITE = http://ffmpeg.org/releases
 FFMPEG_INSTALL_STAGING = YES
-- 
2.8.1
