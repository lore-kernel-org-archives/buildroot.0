From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 22 Sep 2014 17:17:16 +0200
Subject: [Buildroot] [PATCH 2/2] package/ffmpeg: Bump version to 2.4.1
In-Reply-To: <1411399036-11888-1-git-send-email-bernd.kuhls@t-online.de>
References: <1411399036-11888-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1411399036-11888-2-git-send-email-bernd.kuhls@t-online.de>
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
index e429b35..ae3d4c3 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FFMPEG_VERSION = 2.4
+FFMPEG_VERSION = 2.4.1
 FFMPEG_SOURCE = ffmpeg-$(FFMPEG_VERSION).tar.bz2
 FFMPEG_SITE = http://ffmpeg.org/releases
 FFMPEG_INSTALL_STAGING = YES
-- 
1.7.10.4
