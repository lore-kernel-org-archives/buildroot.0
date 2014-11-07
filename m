From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 7 Nov 2014 09:50:54 +0100
Subject: [Buildroot] [git commit] ffmpeg: typo fix
Message-ID: <20141107085112.EA1D0B2079@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d402daaeaef5be2574768c1e2c495ed38a190cea
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add missing bracket.

Signed-off-by: Karoly Kasza <kaszak@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ffmpeg/ffmpeg.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
 
