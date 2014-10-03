From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri,  3 Oct 2014 11:50:46 +0200
Subject: [Buildroot] [PATCH 1/1] package/ffmpeg/ffmpeg.mk: Remove tabs
Message-ID: <1412329846-4805-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/ffmpeg/ffmpeg.mk |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 5b7fa20..4466339 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -17,7 +17,7 @@ FFMPEG_LICENSE_FILES += COPYING.GPLv2
 endif
 
 FFMPEG_CONF_OPT = \
-	--prefix=/usr		\
+	--prefix=/usr \
 	--enable-avfilter \
 	--disable-version3 \
 	--enable-logging \
@@ -340,7 +340,7 @@ define FFMPEG_CONFIGURE_CMDS
 	$(TARGET_CONFIGURE_ARGS) \
 	$(FFMPEG_CONF_ENV) \
 	./configure \
-		--enable-cross-compile	\
+		--enable-cross-compile \
 		--cross-prefix=$(TARGET_CROSS) \
 		--sysroot=$(STAGING_DIR) \
 		--host-cc="$(HOSTCC)" \
-- 
1.7.10.4
