From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue,  2 Mar 2021 08:07:03 +0100
Subject: [Buildroot] [PATCH v2 08/54] package/kodi-audioencoder-*: mass
 version bump
In-Reply-To: <20210302070749.647742-1-bernd.kuhls@t-online.de>
References: <20210302070749.647742-1-bernd.kuhls@t-online.de>
Message-ID: <20210302070749.647742-9-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Switch license file to LICENSE.md.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-audioencoder-flac/kodi-audioencoder-flac.hash    | 4 ++--
 package/kodi-audioencoder-flac/kodi-audioencoder-flac.mk      | 4 ++--
 package/kodi-audioencoder-lame/kodi-audioencoder-lame.hash    | 4 ++--
 package/kodi-audioencoder-lame/kodi-audioencoder-lame.mk      | 4 ++--
 .../kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.hash    | 4 ++--
 package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.mk  | 4 ++--
 package/kodi-audioencoder-wav/kodi-audioencoder-wav.hash      | 4 ++--
 package/kodi-audioencoder-wav/kodi-audioencoder-wav.mk        | 4 ++--
 8 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/package/kodi-audioencoder-flac/kodi-audioencoder-flac.hash b/package/kodi-audioencoder-flac/kodi-audioencoder-flac.hash
index 9f33d6c63a..162d21e39c 100644
--- a/package/kodi-audioencoder-flac/kodi-audioencoder-flac.hash
+++ b/package/kodi-audioencoder-flac/kodi-audioencoder-flac.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  42e18fc2477ce5abc3efd89851a4bacc6b9436889a607a15f8232ef68b297f93  kodi-audioencoder-flac-2.0.6-Leia.tar.gz
-sha256  21dc3eb9c75f1ed6367a4cf3f3999b299bc6c172da3730184edd2a5dd4d090aa  debian/copyright
+sha256  e9001f1789970178b551f01d9242a897523af4f2d34f70bfd7bbbe598bce2e6c  kodi-audioencoder-flac-3.0.0-Matrix.tar.gz
+sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-audioencoder-flac/kodi-audioencoder-flac.mk b/package/kodi-audioencoder-flac/kodi-audioencoder-flac.mk
index 53c1f3debc..3987fa107d 100644
--- a/package/kodi-audioencoder-flac/kodi-audioencoder-flac.mk
+++ b/package/kodi-audioencoder-flac/kodi-audioencoder-flac.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-KODI_AUDIOENCODER_FLAC_VERSION = 2.0.6-Leia
+KODI_AUDIOENCODER_FLAC_VERSION = 3.0.0-Matrix
 KODI_AUDIOENCODER_FLAC_SITE = $(call github,xbmc,audioencoder.flac,$(KODI_AUDIOENCODER_FLAC_VERSION))
 KODI_AUDIOENCODER_FLAC_LICENSE = GPL-2.0+
-KODI_AUDIOENCODER_FLAC_LICENSE_FILES = debian/copyright
+KODI_AUDIOENCODER_FLAC_LICENSE_FILES = LICENSE.md
 KODI_AUDIOENCODER_FLAC_DEPENDENCIES = flac kodi libogg host-pkgconf
 
 $(eval $(cmake-package))
diff --git a/package/kodi-audioencoder-lame/kodi-audioencoder-lame.hash b/package/kodi-audioencoder-lame/kodi-audioencoder-lame.hash
index cd3351e2b7..9c12a58e55 100644
--- a/package/kodi-audioencoder-lame/kodi-audioencoder-lame.hash
+++ b/package/kodi-audioencoder-lame/kodi-audioencoder-lame.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  9df54cf5c5ae3882a2d89d745c1d1f8b749e71a7f9305a1b059ecfd356995a36  kodi-audioencoder-lame-2.0.4-Leia.tar.gz
-sha256  68a06632cc80eea941b07e27777788dcd4f7c5ba9c006e24f467a9d4bf4d3582  debian/copyright
+sha256  ad47d8c4dffe6690bd1ff32bb5fd44f11b691706ff9a1e5b6152efee92976a75  kodi-audioencoder-lame-3.0.2-Matrix.tar.gz
+sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-audioencoder-lame/kodi-audioencoder-lame.mk b/package/kodi-audioencoder-lame/kodi-audioencoder-lame.mk
index 5d93e83ed6..2316473829 100644
--- a/package/kodi-audioencoder-lame/kodi-audioencoder-lame.mk
+++ b/package/kodi-audioencoder-lame/kodi-audioencoder-lame.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-KODI_AUDIOENCODER_LAME_VERSION = 2.0.4-Leia
+KODI_AUDIOENCODER_LAME_VERSION = 3.0.2-Matrix
 KODI_AUDIOENCODER_LAME_SITE = $(call github,xbmc,audioencoder.lame,$(KODI_AUDIOENCODER_LAME_VERSION))
 KODI_AUDIOENCODER_LAME_LICENSE = GPL-2.0+
-KODI_AUDIOENCODER_LAME_LICENSE_FILES = debian/copyright
+KODI_AUDIOENCODER_LAME_LICENSE_FILES = LICENSE.md
 KODI_AUDIOENCODER_LAME_DEPENDENCIES = kodi lame
 KODI_AUDIOENCODER_LAME_CONF_OPTS += \
 	-DLAME_INCLUDE_DIRS=$(STAGING_DIR)/usr/include
diff --git a/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.hash b/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.hash
index 0b9463feb8..f415624db0 100644
--- a/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.hash
+++ b/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  b4b2b1b7ae8bda35514f20ad0275b434f2b60fc93b1e17ca6e654ae145852b1f  kodi-audioencoder-vorbis-2.0.4-Leia.tar.gz
-sha256  706e890fc5c0496b72d3c36284abcc85f9c83b3f2b21db53a68439c538122a59  debian/copyright
+sha256  ba4e6bf402e31096c1fd791db8db26d0eea575998ae414a74c797e868fd08000  kodi-audioencoder-vorbis-3.0.1-Matrix.tar.gz
+sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.mk b/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.mk
index b789d239bd..e79dd433db 100644
--- a/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.mk
+++ b/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-KODI_AUDIOENCODER_VORBIS_VERSION = 2.0.4-Leia
+KODI_AUDIOENCODER_VORBIS_VERSION = 3.0.1-Matrix
 KODI_AUDIOENCODER_VORBIS_SITE = $(call github,xbmc,audioencoder.vorbis,$(KODI_AUDIOENCODER_VORBIS_VERSION))
 KODI_AUDIOENCODER_VORBIS_LICENSE = GPL-2.0+
-KODI_AUDIOENCODER_VORBIS_LICENSE_FILES = debian/copyright
+KODI_AUDIOENCODER_VORBIS_LICENSE_FILES = LICENSE.md
 KODI_AUDIOENCODER_VORBIS_DEPENDENCIES = kodi libogg libvorbis host-pkgconf
 
 $(eval $(cmake-package))
diff --git a/package/kodi-audioencoder-wav/kodi-audioencoder-wav.hash b/package/kodi-audioencoder-wav/kodi-audioencoder-wav.hash
index 9b9add2161..345fd1aa03 100644
--- a/package/kodi-audioencoder-wav/kodi-audioencoder-wav.hash
+++ b/package/kodi-audioencoder-wav/kodi-audioencoder-wav.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  03cb2810b2aa335fd308a5e2b6580d21ac840334c55fc891acc310633c3c49b4  kodi-audioencoder-wav-2.0.3-Leia.tar.gz
-sha256  341a6317428fbc7c9d5b971d1c6162ea34be64649caa650ee0a05c06ae53a872  debian/copyright
+sha256  9c4c834717060c5ca643a8f9758c8d784b00382ee6ce20e55ab8f2fe0b5f44dd  kodi-audioencoder-wav-3.0.0-Matrix.tar.gz
+sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-audioencoder-wav/kodi-audioencoder-wav.mk b/package/kodi-audioencoder-wav/kodi-audioencoder-wav.mk
index b597b1b13d..b47c2bce84 100644
--- a/package/kodi-audioencoder-wav/kodi-audioencoder-wav.mk
+++ b/package/kodi-audioencoder-wav/kodi-audioencoder-wav.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-KODI_AUDIOENCODER_WAV_VERSION = 2.0.3-Leia
+KODI_AUDIOENCODER_WAV_VERSION = 3.0.0-Matrix
 KODI_AUDIOENCODER_WAV_SITE = $(call github,xbmc,audioencoder.wav,$(KODI_AUDIOENCODER_WAV_VERSION))
 KODI_AUDIOENCODER_WAV_LICENSE = GPL-2.0+
-KODI_AUDIOENCODER_WAV_LICENSE_FILES = debian/copyright
+KODI_AUDIOENCODER_WAV_LICENSE_FILES = LICENSE.md
 KODI_AUDIOENCODER_WAV_DEPENDENCIES = kodi
 
 $(eval $(cmake-package))
-- 
2.29.2
