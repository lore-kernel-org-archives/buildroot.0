From: Karoly Kasza <kaszak@gmail.com>
Date: Fri,  7 Nov 2014 09:44:16 +0100
Subject: [Buildroot] [PATCH] ffmpeg: typo fix
Message-ID: <1415349856-4470-1-git-send-email-kaszak@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add missing bracket.

Signed-off-by: Karoly Kasza <kaszak@gmail.com>
---
 package/ffmpeg/ffmpeg.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 287f5e4..1a68fa0 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -342,7 +342,7 @@ FFMPEG_CONF_OPTS += $(call qstrip,$(BR2_PACKAGE_FFMPEG_EXTRACONF))
 
 ifneq ($(call qstrip,$(BR2_GCC_TARGET_CPU)),)
 FFMPEG_CONF_OPTS += --cpu=$(BR2_GCC_TARGET_CPU)
-else ifneq ($(call qstrip,$(BR2_GCC_TARGET_ARCH),)
+else ifneq ($(call qstrip,$(BR2_GCC_TARGET_ARCH)),)
 FFMPEG_CONF_OPTS += --cpu=$(BR2_GCC_TARGET_ARCH)
 endif
 
-- 
1.7.10.4
