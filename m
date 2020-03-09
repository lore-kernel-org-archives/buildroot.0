From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon,  9 Mar 2020 19:39:24 +0100
Subject: [Buildroot] [PATCH 02/16] package/kodi-audioencoder-*: mass version
 bump
In-Reply-To: <20200309183938.2528-1-bernd.kuhls@t-online.de>
References: <20200309183938.2528-1-bernd.kuhls@t-online.de>
Message-ID: <20200309183938.2528-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Switch _LICENSE_FILES to debian/copyright instead of using a source
code file.

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
index 4f410b4848..187a038eed 100644
--- a/package/kodi-audioencoder-flac/kodi-audioencoder-flac.hash
+++ b/package/kodi-audioencoder-flac/kodi-audioencoder-flac.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 e6b8ad024c171eb463339a1f136f3ee9465267ef7fd3b80a5f0007b0180f36e5  kodi-audioencoder-flac-2.0.5-Leia.tar.gz
-sha256 ce7b890ad56521f1628569be22eff040ef2870213b89098e491d57f729e0d7b6  src/EncoderFlac.cpp
+sha256 42e18fc2477ce5abc3efd89851a4bacc6b9436889a607a15f8232ef68b297f93  kodi-audioencoder-flac-2.0.6-Leia.tar.gz
+sha256 21dc3eb9c75f1ed6367a4cf3f3999b299bc6c172da3730184edd2a5dd4d090aa  debian/copyright
diff --git a/package/kodi-audioencoder-flac/kodi-audioencoder-flac.mk b/package/kodi-audioencoder-flac/kodi-audioencoder-flac.mk
index 9940949c7b..53c1f3debc 100644
--- a/package/kodi-audioencoder-flac/kodi-audioencoder-flac.mk
+++ b/package/kodi-audioencoder-flac/kodi-audioencoder-flac.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-KODI_AUDIOENCODER_FLAC_VERSION = 2.0.5-Leia
+KODI_AUDIOENCODER_FLAC_VERSION = 2.0.6-Leia
 KODI_AUDIOENCODER_FLAC_SITE = $(call github,xbmc,audioencoder.flac,$(KODI_AUDIOENCODER_FLAC_VERSION))
 KODI_AUDIOENCODER_FLAC_LICENSE = GPL-2.0+
-KODI_AUDIOENCODER_FLAC_LICENSE_FILES = src/EncoderFlac.cpp
+KODI_AUDIOENCODER_FLAC_LICENSE_FILES = debian/copyright
 KODI_AUDIOENCODER_FLAC_DEPENDENCIES = flac kodi libogg host-pkgconf
 
 $(eval $(cmake-package))
diff --git a/package/kodi-audioencoder-lame/kodi-audioencoder-lame.hash b/package/kodi-audioencoder-lame/kodi-audioencoder-lame.hash
index d66ab591ac..ef86f90eaa 100644
--- a/package/kodi-audioencoder-lame/kodi-audioencoder-lame.hash
+++ b/package/kodi-audioencoder-lame/kodi-audioencoder-lame.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 c9c0e700012e2763eb6d9ffcc80ccd87faf991e5cf58b30cabd51b435fd48614  kodi-audioencoder-lame-2.0.3-Leia.tar.gz
-sha256 12d9ad0578d7a09ebb1bdb53d71798b81eed5072866b8bcfae5dff0c34a00b42  src/EncoderLame.cpp
+sha256 9df54cf5c5ae3882a2d89d745c1d1f8b749e71a7f9305a1b059ecfd356995a36  kodi-audioencoder-lame-2.0.4-Leia.tar.gz
+sha256 68a06632cc80eea941b07e27777788dcd4f7c5ba9c006e24f467a9d4bf4d3582  debian/copyright
diff --git a/package/kodi-audioencoder-lame/kodi-audioencoder-lame.mk b/package/kodi-audioencoder-lame/kodi-audioencoder-lame.mk
index a278a0f410..5d93e83ed6 100644
--- a/package/kodi-audioencoder-lame/kodi-audioencoder-lame.mk
+++ b/package/kodi-audioencoder-lame/kodi-audioencoder-lame.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-KODI_AUDIOENCODER_LAME_VERSION = 2.0.3-Leia
+KODI_AUDIOENCODER_LAME_VERSION = 2.0.4-Leia
 KODI_AUDIOENCODER_LAME_SITE = $(call github,xbmc,audioencoder.lame,$(KODI_AUDIOENCODER_LAME_VERSION))
 KODI_AUDIOENCODER_LAME_LICENSE = GPL-2.0+
-KODI_AUDIOENCODER_LAME_LICENSE_FILES = src/EncoderLame.cpp
+KODI_AUDIOENCODER_LAME_LICENSE_FILES = debian/copyright
 KODI_AUDIOENCODER_LAME_DEPENDENCIES = kodi lame
 KODI_AUDIOENCODER_LAME_CONF_OPTS += \
 	-DLAME_INCLUDE_DIRS=$(STAGING_DIR)/usr/include
diff --git a/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.hash b/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.hash
index a316a75254..567b2d6f38 100644
--- a/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.hash
+++ b/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  0bc1470ecef83ecc7e36239ef414abc49380394b551d35eb7bcc6704e74b469c  kodi-audioencoder-vorbis-2.0.3-Leia.tar.gz
-sha256  34c561f838b57d681bb795de0a26eacf610477a50cdca1ae707591ec607de42a  src/EncoderVorbis.cpp
+sha256 b4b2b1b7ae8bda35514f20ad0275b434f2b60fc93b1e17ca6e654ae145852b1f  kodi-audioencoder-vorbis-2.0.4-Leia.tar.gz
+sha256 706e890fc5c0496b72d3c36284abcc85f9c83b3f2b21db53a68439c538122a59  debian/copyright
diff --git a/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.mk b/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.mk
index 8b2b0fc640..b789d239bd 100644
--- a/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.mk
+++ b/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-KODI_AUDIOENCODER_VORBIS_VERSION = 2.0.3-Leia
+KODI_AUDIOENCODER_VORBIS_VERSION = 2.0.4-Leia
 KODI_AUDIOENCODER_VORBIS_SITE = $(call github,xbmc,audioencoder.vorbis,$(KODI_AUDIOENCODER_VORBIS_VERSION))
 KODI_AUDIOENCODER_VORBIS_LICENSE = GPL-2.0+
-KODI_AUDIOENCODER_VORBIS_LICENSE_FILES = src/EncoderVorbis.cpp
+KODI_AUDIOENCODER_VORBIS_LICENSE_FILES = debian/copyright
 KODI_AUDIOENCODER_VORBIS_DEPENDENCIES = kodi libogg libvorbis host-pkgconf
 
 $(eval $(cmake-package))
diff --git a/package/kodi-audioencoder-wav/kodi-audioencoder-wav.hash b/package/kodi-audioencoder-wav/kodi-audioencoder-wav.hash
index a1bff2e00c..e779768812 100644
--- a/package/kodi-audioencoder-wav/kodi-audioencoder-wav.hash
+++ b/package/kodi-audioencoder-wav/kodi-audioencoder-wav.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 eb6939551fa7da01a7f333702af1959771e7db46437647d32eb2b002b142c9a0  kodi-audioencoder-wav-2.0.2-Leia.tar.gz
-sha256 20c587f004bcc79f3faee1000af6567fdf8676965130af51e733338b81b27be1  src/EncoderWav.cpp
+sha256 03cb2810b2aa335fd308a5e2b6580d21ac840334c55fc891acc310633c3c49b4  kodi-audioencoder-wav-2.0.3-Leia.tar.gz
+sha256 341a6317428fbc7c9d5b971d1c6162ea34be64649caa650ee0a05c06ae53a872  debian/copyright
diff --git a/package/kodi-audioencoder-wav/kodi-audioencoder-wav.mk b/package/kodi-audioencoder-wav/kodi-audioencoder-wav.mk
index 25551927d1..b597b1b13d 100644
--- a/package/kodi-audioencoder-wav/kodi-audioencoder-wav.mk
+++ b/package/kodi-audioencoder-wav/kodi-audioencoder-wav.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-KODI_AUDIOENCODER_WAV_VERSION = 2.0.2-Leia
+KODI_AUDIOENCODER_WAV_VERSION = 2.0.3-Leia
 KODI_AUDIOENCODER_WAV_SITE = $(call github,xbmc,audioencoder.wav,$(KODI_AUDIOENCODER_WAV_VERSION))
 KODI_AUDIOENCODER_WAV_LICENSE = GPL-2.0+
-KODI_AUDIOENCODER_WAV_LICENSE_FILES = src/EncoderWav.cpp
+KODI_AUDIOENCODER_WAV_LICENSE_FILES = debian/copyright
 KODI_AUDIOENCODER_WAV_DEPENDENCIES = kodi
 
 $(eval $(cmake-package))
-- 
2.25.0
