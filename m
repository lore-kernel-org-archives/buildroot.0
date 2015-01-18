From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 18 Jan 2015 13:16:42 +0100
Subject: [Buildroot] [PATCH 2/4] package/kodi-audioencoder-vorbis: bump
	version
In-Reply-To: <1421583404-25251-1-git-send-email-bernd.kuhls@t-online.de>
References: <1421583404-25251-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1421583404-25251-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.mk b/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.mk
index f1864e2..1e5523c 100644
--- a/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.mk
+++ b/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_AUDIOENCODER_VORBIS_VERSION = 787d4a048be7fe8191afda8005a209976724dda1
+KODI_AUDIOENCODER_VORBIS_VERSION = dbf5c62c088283143c7ad530b106f3cc0c9392e9
 KODI_AUDIOENCODER_VORBIS_SITE = $(call github,xbmc,audioencoder.vorbis,$(KODI_AUDIOENCODER_VORBIS_VERSION))
 KODI_AUDIOENCODER_VORBIS_LICENSE = GPLv2+
 KODI_AUDIOENCODER_VORBIS_LICENSE_FILES = src/EncoderVorbis.cpp
-- 
1.7.10.4
