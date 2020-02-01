From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  1 Feb 2020 10:00:14 +0100
Subject: [Buildroot] [PATCH 1/1] package/kodi-audioencoder-vorbis: bump
 version to 2.0.3-Leia
Message-ID: <20200201090014.304439-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.hash    | 2 +-
 package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.mk  | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.hash b/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.hash
index 7ba473e5f7..aab1a6bcd7 100644
--- a/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.hash
+++ b/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 f6f220fad74a64d29a4375fbc24560ee528d0dbf1e195f17015381fcd67c8acc  kodi-audioencoder-vorbis-2.0.2-Leia.tar.gz
+sha256 0bc1470ecef83ecc7e36239ef414abc49380394b551d35eb7bcc6704e74b469c  kodi-audioencoder-vorbis-2.0.3-Leia.tar.gz
diff --git a/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.mk b/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.mk
index 8ea569e638..8b2b0fc640 100644
--- a/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.mk
+++ b/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-KODI_AUDIOENCODER_VORBIS_VERSION = 2.0.2-Leia
-KODI_AUDIOENCODER_VORBIS_SITE = $(call github,xbmc,audioencoder.vorbis,v$(KODI_AUDIOENCODER_VORBIS_VERSION))
+KODI_AUDIOENCODER_VORBIS_VERSION = 2.0.3-Leia
+KODI_AUDIOENCODER_VORBIS_SITE = $(call github,xbmc,audioencoder.vorbis,$(KODI_AUDIOENCODER_VORBIS_VERSION))
 KODI_AUDIOENCODER_VORBIS_LICENSE = GPL-2.0+
 KODI_AUDIOENCODER_VORBIS_LICENSE_FILES = src/EncoderVorbis.cpp
 KODI_AUDIOENCODER_VORBIS_DEPENDENCIES = kodi libogg libvorbis host-pkgconf
-- 
2.20.1
