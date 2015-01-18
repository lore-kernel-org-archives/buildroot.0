From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 18 Jan 2015 13:16:43 +0100
Subject: [Buildroot] [PATCH 3/4] package/kodi-audioencoder-lame: bump version
In-Reply-To: <1421583404-25251-1-git-send-email-bernd.kuhls@t-online.de>
References: <1421583404-25251-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1421583404-25251-3-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-audioencoder-lame/kodi-audioencoder-lame.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/kodi-audioencoder-lame/kodi-audioencoder-lame.mk b/package/kodi-audioencoder-lame/kodi-audioencoder-lame.mk
index a890f64..8a4a28c 100644
--- a/package/kodi-audioencoder-lame/kodi-audioencoder-lame.mk
+++ b/package/kodi-audioencoder-lame/kodi-audioencoder-lame.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_AUDIOENCODER_LAME_VERSION = 6f8384f0d003faf7b91dcd38357ea0ecf9030cce
+KODI_AUDIOENCODER_LAME_VERSION = 3eb59de951996659c143faaabacc5f34ee9a0b81
 KODI_AUDIOENCODER_LAME_SITE = $(call github,xbmc,audioencoder.lame,$(KODI_AUDIOENCODER_LAME_VERSION))
 KODI_AUDIOENCODER_LAME_LICENSE = GPLv2+
 KODI_AUDIOENCODER_LAME_LICENSE_FILES = src/EncoderLame.cpp
-- 
1.7.10.4
