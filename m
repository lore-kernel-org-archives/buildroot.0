From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  2 Nov 2014 22:45:22 +0100
Subject: [Buildroot] [PATCH 1/1] package/ffmpeg: bump version to 2.4.3
In-Reply-To: <1414964722-7224-1-git-send-email-bernd.kuhls@t-online.de>
References: <1414964722-7224-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1414964722-7224-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/ffmpeg/ffmpeg.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 686f50d..233797c 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FFMPEG_VERSION = 2.4.2
+FFMPEG_VERSION = 2.4.3
 FFMPEG_SOURCE = ffmpeg-$(FFMPEG_VERSION).tar.bz2
 FFMPEG_SITE = http://ffmpeg.org/releases
 FFMPEG_INSTALL_STAGING = YES
-- 
1.7.10.4
