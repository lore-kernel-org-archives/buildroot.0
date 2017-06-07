From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed,  7 Jun 2017 06:47:25 +0200
Subject: [Buildroot] [PATCH 1/1] package/ffmpeg: bump version to 3.3.2
Message-ID: <20170607044725.1363-1-bernd.kuhls@t-online.de>
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
index ab7ba5eee..b0556fe3d 100644
--- a/package/ffmpeg/ffmpeg.hash
+++ b/package/ffmpeg/ffmpeg.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 b702a7fc656ac23e276b8c823a2f646e4e6f6309bb2788435a708e69bea98f2f  ffmpeg-3.3.1.tar.xz
+sha256 1998de1ab32616cbf2ff86efc3f1f26e76805ec5dc51e24c041c79edd8262785  ffmpeg-3.3.2.tar.xz
diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 86bf5458c..d41670dec 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FFMPEG_VERSION = 3.3.1
+FFMPEG_VERSION = 3.3.2
 FFMPEG_SOURCE = ffmpeg-$(FFMPEG_VERSION).tar.xz
 FFMPEG_SITE = http://ffmpeg.org/releases
 FFMPEG_INSTALL_STAGING = YES
-- 
2.11.0
