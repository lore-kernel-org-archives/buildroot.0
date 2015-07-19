From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Jul 2015 21:05:13 +0200
Subject: [Buildroot] [PATCH/RFC v3 08/50] package/kodi-audioencoder-flac:
	bump version
In-Reply-To: <1437332755-9764-1-git-send-email-bernd.kuhls@t-online.de>
References: <1437332755-9764-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1437332755-9764-9-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-audioencoder-flac/kodi-audioencoder-flac.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/kodi-audioencoder-flac/kodi-audioencoder-flac.mk b/package/kodi-audioencoder-flac/kodi-audioencoder-flac.mk
index 2ccc1b7..154e39c 100644
--- a/package/kodi-audioencoder-flac/kodi-audioencoder-flac.mk
+++ b/package/kodi-audioencoder-flac/kodi-audioencoder-flac.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_AUDIOENCODER_FLAC_VERSION = 84acb14101b9114472cd20f6a0f8fdefbb376113
+KODI_AUDIOENCODER_FLAC_VERSION = a5e2d1262de3b2de567cf0a8207636ebaacb8775
 KODI_AUDIOENCODER_FLAC_SITE = $(call github,xbmc,audioencoder.flac,$(KODI_AUDIOENCODER_FLAC_VERSION))
 KODI_AUDIOENCODER_FLAC_LICENSE = GPLv2+
 KODI_AUDIOENCODER_FLAC_LICENSE_FILES = src/EncoderFlac.cpp
-- 
1.7.10.4
