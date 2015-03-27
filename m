From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 27 Mar 2015 17:29:32 +0100
Subject: [Buildroot] [PATCH 4/4] package/kodi-audioencoder-flac: bump version
In-Reply-To: <1427473772-26171-1-git-send-email-bernd.kuhls@t-online.de>
References: <1427473772-26171-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1427473772-26171-4-git-send-email-bernd.kuhls@t-online.de>
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
index c5115c4..2ccc1b7 100644
--- a/package/kodi-audioencoder-flac/kodi-audioencoder-flac.mk
+++ b/package/kodi-audioencoder-flac/kodi-audioencoder-flac.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_AUDIOENCODER_FLAC_VERSION = 62c2cc876b572dd8fd9b85d708f86ec9a9d2ffc7
+KODI_AUDIOENCODER_FLAC_VERSION = 84acb14101b9114472cd20f6a0f8fdefbb376113
 KODI_AUDIOENCODER_FLAC_SITE = $(call github,xbmc,audioencoder.flac,$(KODI_AUDIOENCODER_FLAC_VERSION))
 KODI_AUDIOENCODER_FLAC_LICENSE = GPLv2+
 KODI_AUDIOENCODER_FLAC_LICENSE_FILES = src/EncoderFlac.cpp
-- 
1.7.10.4
