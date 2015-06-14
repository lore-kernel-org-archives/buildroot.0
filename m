From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 14 Jun 2015 16:36:09 +0200
Subject: [Buildroot] [PATCH/RFC v2 10/44] package/kodi-audioencoder-wav:
	bump version
In-Reply-To: <1434292603-12052-1-git-send-email-bernd.kuhls@t-online.de>
References: <1434292603-12052-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1434292603-12052-11-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-audioencoder-wav/kodi-audioencoder-wav.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/kodi-audioencoder-wav/kodi-audioencoder-wav.mk b/package/kodi-audioencoder-wav/kodi-audioencoder-wav.mk
index 06803f2..9cd5117 100644
--- a/package/kodi-audioencoder-wav/kodi-audioencoder-wav.mk
+++ b/package/kodi-audioencoder-wav/kodi-audioencoder-wav.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_AUDIOENCODER_WAV_VERSION = 40aaedfa1cd9c75749c82f6e1bd7c42ef61fdb38
+KODI_AUDIOENCODER_WAV_VERSION = 797c990eea7851889cd44a597c0392deba9c51c0
 KODI_AUDIOENCODER_WAV_SITE = $(call github,xbmc,audioencoder.wav,$(KODI_AUDIOENCODER_WAV_VERSION))
 KODI_AUDIOENCODER_WAV_LICENSE = GPLv2+
 KODI_AUDIOENCODER_WAV_LICENSE_FILES = src/EncoderWav.cpp
-- 
1.7.10.4
