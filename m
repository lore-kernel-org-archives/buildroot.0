From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Oct 2014 14:19:19 +0200
Subject: [Buildroot] [git commit] package/ffmpeg/ffmpeg.mk: Remove tabs
Message-ID: <20141004121927.E00299D821@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=79449c2aecc67d05bba44ccb7ec951f26a00c04e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ffmpeg/ffmpeg.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

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
