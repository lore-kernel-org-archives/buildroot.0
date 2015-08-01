From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  1 Aug 2015 12:08:32 +0200
Subject: [Buildroot] [PATCH 3/3] kodi-audioencoder-wav: bump version
In-Reply-To: <1438423712-2000-1-git-send-email-bernd.kuhls@t-online.de>
References: <1438423712-2000-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1438423712-2000-3-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-audioencoder-wav/kodi-audioencoder-wav.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/kodi-audioencoder-wav/kodi-audioencoder-wav.mk b/package/kodi-audioencoder-wav/kodi-audioencoder-wav.mk
index f2b7c2a..543c051 100644
--- a/package/kodi-audioencoder-wav/kodi-audioencoder-wav.mk
+++ b/package/kodi-audioencoder-wav/kodi-audioencoder-wav.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_AUDIOENCODER_WAV_VERSION = 797c990eea7851889cd44a597c0392deba9c51c0
+KODI_AUDIOENCODER_WAV_VERSION = 77e16122b132ca31b27d3602fd2d9ada214ff7f6
 KODI_AUDIOENCODER_WAV_SITE = $(call github,xbmc,audioencoder.wav,$(KODI_AUDIOENCODER_WAV_VERSION))
 KODI_AUDIOENCODER_WAV_LICENSE = GPLv2+
 KODI_AUDIOENCODER_WAV_LICENSE_FILES = src/EncoderWav.cpp
-- 
2.1.4
