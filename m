From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 23 Jan 2020 01:04:02 +0100
Subject: [Buildroot] [git commit] package/kodi-audioencoder-*: mass version
 bump
Message-ID: <20200122235421.086448386D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=97921206587ca65ac98627f25d0c54e72962d0e2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/kodi-audioencoder-flac/kodi-audioencoder-flac.hash     | 2 +-
 package/kodi-audioencoder-flac/kodi-audioencoder-flac.mk       | 4 ++--
 package/kodi-audioencoder-lame/kodi-audioencoder-lame.hash     | 2 +-
 package/kodi-audioencoder-lame/kodi-audioencoder-lame.mk       | 4 ++--
 package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.hash | 2 +-
 package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.mk   | 2 +-
 package/kodi-audioencoder-wav/kodi-audioencoder-wav.hash       | 2 +-
 package/kodi-audioencoder-wav/kodi-audioencoder-wav.mk         | 4 ++--
 8 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/package/kodi-audioencoder-flac/kodi-audioencoder-flac.hash b/package/kodi-audioencoder-flac/kodi-audioencoder-flac.hash
index 9a0f81e10d..7599ed9218 100644
--- a/package/kodi-audioencoder-flac/kodi-audioencoder-flac.hash
+++ b/package/kodi-audioencoder-flac/kodi-audioencoder-flac.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 811dac5766dc9ef1a3447c55637edde55c5ddca1d583124e9312328152015ae5  kodi-audioencoder-flac-1.1.0.tar.gz
+sha256 e6b8ad024c171eb463339a1f136f3ee9465267ef7fd3b80a5f0007b0180f36e5  kodi-audioencoder-flac-2.0.5-Leia.tar.gz
diff --git a/package/kodi-audioencoder-flac/kodi-audioencoder-flac.mk b/package/kodi-audioencoder-flac/kodi-audioencoder-flac.mk
index ea5a0860c6..9940949c7b 100644
--- a/package/kodi-audioencoder-flac/kodi-audioencoder-flac.mk
+++ b/package/kodi-audioencoder-flac/kodi-audioencoder-flac.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-KODI_AUDIOENCODER_FLAC_VERSION = 1.1.0
-KODI_AUDIOENCODER_FLAC_SITE = $(call github,xbmc,audioencoder.flac,v$(KODI_AUDIOENCODER_FLAC_VERSION))
+KODI_AUDIOENCODER_FLAC_VERSION = 2.0.5-Leia
+KODI_AUDIOENCODER_FLAC_SITE = $(call github,xbmc,audioencoder.flac,$(KODI_AUDIOENCODER_FLAC_VERSION))
 KODI_AUDIOENCODER_FLAC_LICENSE = GPL-2.0+
 KODI_AUDIOENCODER_FLAC_LICENSE_FILES = src/EncoderFlac.cpp
 KODI_AUDIOENCODER_FLAC_DEPENDENCIES = flac kodi libogg host-pkgconf
diff --git a/package/kodi-audioencoder-lame/kodi-audioencoder-lame.hash b/package/kodi-audioencoder-lame/kodi-audioencoder-lame.hash
index 6edd161559..e25df69e79 100644
--- a/package/kodi-audioencoder-lame/kodi-audioencoder-lame.hash
+++ b/package/kodi-audioencoder-lame/kodi-audioencoder-lame.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 5118a2925bb0f7eca36b2d0f4d6822b45a8967c9fb91054bfaa8f83d21209c95  kodi-audioencoder-lame-1.2.0.tar.gz
+sha256 c9c0e700012e2763eb6d9ffcc80ccd87faf991e5cf58b30cabd51b435fd48614  kodi-audioencoder-lame-2.0.3-Leia.tar.gz
diff --git a/package/kodi-audioencoder-lame/kodi-audioencoder-lame.mk b/package/kodi-audioencoder-lame/kodi-audioencoder-lame.mk
index 3f06a06135..a278a0f410 100644
--- a/package/kodi-audioencoder-lame/kodi-audioencoder-lame.mk
+++ b/package/kodi-audioencoder-lame/kodi-audioencoder-lame.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-KODI_AUDIOENCODER_LAME_VERSION = 1.2.0
-KODI_AUDIOENCODER_LAME_SITE = $(call github,xbmc,audioencoder.lame,v$(KODI_AUDIOENCODER_LAME_VERSION))
+KODI_AUDIOENCODER_LAME_VERSION = 2.0.3-Leia
+KODI_AUDIOENCODER_LAME_SITE = $(call github,xbmc,audioencoder.lame,$(KODI_AUDIOENCODER_LAME_VERSION))
 KODI_AUDIOENCODER_LAME_LICENSE = GPL-2.0+
 KODI_AUDIOENCODER_LAME_LICENSE_FILES = src/EncoderLame.cpp
 KODI_AUDIOENCODER_LAME_DEPENDENCIES = kodi lame
diff --git a/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.hash b/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.hash
index 1b41a88dbc..7ba473e5f7 100644
--- a/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.hash
+++ b/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 f00c74f010b465d43e8206bcbe155785e1f34660ca010acff3b890595ea2352c  kodi-audioencoder-vorbis-1.1.0.tar.gz
+sha256 f6f220fad74a64d29a4375fbc24560ee528d0dbf1e195f17015381fcd67c8acc  kodi-audioencoder-vorbis-2.0.2-Leia.tar.gz
diff --git a/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.mk b/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.mk
index 0c0c406a58..8ea569e638 100644
--- a/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.mk
+++ b/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_AUDIOENCODER_VORBIS_VERSION = 1.1.0
+KODI_AUDIOENCODER_VORBIS_VERSION = 2.0.2-Leia
 KODI_AUDIOENCODER_VORBIS_SITE = $(call github,xbmc,audioencoder.vorbis,v$(KODI_AUDIOENCODER_VORBIS_VERSION))
 KODI_AUDIOENCODER_VORBIS_LICENSE = GPL-2.0+
 KODI_AUDIOENCODER_VORBIS_LICENSE_FILES = src/EncoderVorbis.cpp
diff --git a/package/kodi-audioencoder-wav/kodi-audioencoder-wav.hash b/package/kodi-audioencoder-wav/kodi-audioencoder-wav.hash
index b302c18ac9..06e724a969 100644
--- a/package/kodi-audioencoder-wav/kodi-audioencoder-wav.hash
+++ b/package/kodi-audioencoder-wav/kodi-audioencoder-wav.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 f9b0f79c8364fb7ef584137031fceb8d2ab1af28e110cfe2a31932631cb8d36e  kodi-audioencoder-wav-1.1.0.tar.gz
+sha256 eb6939551fa7da01a7f333702af1959771e7db46437647d32eb2b002b142c9a0  kodi-audioencoder-wav-2.0.2-Leia.tar.gz
diff --git a/package/kodi-audioencoder-wav/kodi-audioencoder-wav.mk b/package/kodi-audioencoder-wav/kodi-audioencoder-wav.mk
index d21546ba05..25551927d1 100644
--- a/package/kodi-audioencoder-wav/kodi-audioencoder-wav.mk
+++ b/package/kodi-audioencoder-wav/kodi-audioencoder-wav.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-KODI_AUDIOENCODER_WAV_VERSION = 1.1.0
-KODI_AUDIOENCODER_WAV_SITE = $(call github,xbmc,audioencoder.wav,v$(KODI_AUDIOENCODER_WAV_VERSION))
+KODI_AUDIOENCODER_WAV_VERSION = 2.0.2-Leia
+KODI_AUDIOENCODER_WAV_SITE = $(call github,xbmc,audioencoder.wav,$(KODI_AUDIOENCODER_WAV_VERSION))
 KODI_AUDIOENCODER_WAV_LICENSE = GPL-2.0+
 KODI_AUDIOENCODER_WAV_LICENSE_FILES = src/EncoderWav.cpp
 KODI_AUDIOENCODER_WAV_DEPENDENCIES = kodi
