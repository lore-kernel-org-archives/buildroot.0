From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Jul 2015 09:29:24 +0200
Subject: [Buildroot] [git commit branch/next] package/kodi-audioencoder-wav:
	bump version
Message-ID: <20150808105650.8E3B27F9A6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2cc1d73ef5ee8be1b24477ace16542a1d6106db0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../kodi-audioencoder-wav/kodi-audioencoder-wav.mk |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/package/kodi-audioencoder-wav/kodi-audioencoder-wav.mk b/package/kodi-audioencoder-wav/kodi-audioencoder-wav.mk
index 06803f2..f2b7c2a 100644
--- a/package/kodi-audioencoder-wav/kodi-audioencoder-wav.mk
+++ b/package/kodi-audioencoder-wav/kodi-audioencoder-wav.mk
@@ -4,12 +4,10 @@
 #
 ################################################################################
 
-KODI_AUDIOENCODER_WAV_VERSION = 40aaedfa1cd9c75749c82f6e1bd7c42ef61fdb38
+KODI_AUDIOENCODER_WAV_VERSION = 797c990eea7851889cd44a597c0392deba9c51c0
 KODI_AUDIOENCODER_WAV_SITE = $(call github,xbmc,audioencoder.wav,$(KODI_AUDIOENCODER_WAV_VERSION))
 KODI_AUDIOENCODER_WAV_LICENSE = GPLv2+
 KODI_AUDIOENCODER_WAV_LICENSE_FILES = src/EncoderWav.cpp
 KODI_AUDIOENCODER_WAV_DEPENDENCIES = kodi
-KODI_AUDIOENCODER_WAV_CONF_OPTS += \
-	-DCMAKE_MODULE_PATH=$(STAGING_DIR)/usr/lib/kodi
 
 $(eval $(cmake-package))
