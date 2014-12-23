From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 23 Dec 2014 18:46:24 +0100
Subject: [Buildroot] [PATCH v9 01/18] package/ffmpeg: bump version to 2.5.2
In-Reply-To: <1419356801-31525-1-git-send-email-bernd.kuhls@t-online.de>
References: <1419356801-31525-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1419356801-31525-2-git-send-email-bernd.kuhls@t-online.de>
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
index 12f546d..b74a59a 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FFMPEG_VERSION = 2.5.1
+FFMPEG_VERSION = 2.5.2
 FFMPEG_SOURCE = ffmpeg-$(FFMPEG_VERSION).tar.bz2
 FFMPEG_SITE = http://ffmpeg.org/releases
 FFMPEG_INSTALL_STAGING = YES
-- 
1.7.10.4
