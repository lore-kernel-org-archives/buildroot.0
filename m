From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 21 Sep 2019 21:28:12 +0200
Subject: [Buildroot] [PATCH v6 11/25] package/kodi-audioencoder-*: mass
 version bump
In-Reply-To: <20190921192826.10143-1-bernd.kuhls@t-online.de>
References: <20190921192826.10143-1-bernd.kuhls@t-online.de>
Message-ID: <20190921192826.10143-12-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-audioencoder-flac/kodi-audioencoder-flac.hash    | 2 +-
 package/kodi-audioencoder-flac/kodi-audioencoder-flac.mk      | 4 ++--
 package/kodi-audioencoder-lame/kodi-audioencoder-lame.hash    | 2 +-
 package/kodi-audioencoder-lame/kodi-audioencoder-lame.mk      | 4 ++--
 .../kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.hash    | 2 +-
 package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.mk  | 4 ++--
 package/kodi-audioencoder-wav/kodi-audioencoder-wav.hash      | 2 +-
 package/kodi-audioencoder-wav/kodi-audioencoder-wav.mk        | 4 ++--
 8 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/package/kodi-audioencoder-flac/kodi-audioencoder-flac.hash b/package/kodi-audioencoder-flac/kodi-audioencoder-flac.hash
index 9a0f81e10d..a1a4473d2a 100644
--- a/package/kodi-audioencoder-flac/kodi-audioencoder-flac.hash
+++ b/package/kodi-audioencoder-flac/kodi-audioencoder-flac.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 811dac5766dc9ef1a3447c55637edde55c5ddca1d583124e9312328152015ae5  kodi-audioencoder-flac-1.1.0.tar.gz
+sha256 a49faff2951bdc06c3fe72750728358983ab32177c941e042107243ca7569b63  kodi-audioencoder-flac-394ded06bd1c523dd68986a320750c312322fcfd.tar.gz
diff --git a/package/kodi-audioencoder-flac/kodi-audioencoder-flac.mk b/package/kodi-audioencoder-flac/kodi-audioencoder-flac.mk
index ea5a0860c6..40a35513f8 100644
--- a/package/kodi-audioencoder-flac/kodi-audioencoder-flac.mk
+++ b/package/kodi-audioencoder-flac/kodi-audioencoder-flac.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-KODI_AUDIOENCODER_FLAC_VERSION = 1.1.0
-KODI_AUDIOENCODER_FLAC_SITE = $(call github,xbmc,audioencoder.flac,v$(KODI_AUDIOENCODER_FLAC_VERSION))
+KODI_AUDIOENCODER_FLAC_VERSION = 394ded06bd1c523dd68986a320750c312322fcfd
+KODI_AUDIOENCODER_FLAC_SITE = $(call github,xbmc,audioencoder.flac,$(KODI_AUDIOENCODER_FLAC_VERSION))
 KODI_AUDIOENCODER_FLAC_LICENSE = GPL-2.0+
 KODI_AUDIOENCODER_FLAC_LICENSE_FILES = src/EncoderFlac.cpp
 KODI_AUDIOENCODER_FLAC_DEPENDENCIES = flac kodi libogg host-pkgconf
diff --git a/package/kodi-audioencoder-lame/kodi-audioencoder-lame.hash b/package/kodi-audioencoder-lame/kodi-audioencoder-lame.hash
index 6edd161559..f1aabb5a1b 100644
--- a/package/kodi-audioencoder-lame/kodi-audioencoder-lame.hash
+++ b/package/kodi-audioencoder-lame/kodi-audioencoder-lame.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 5118a2925bb0f7eca36b2d0f4d6822b45a8967c9fb91054bfaa8f83d21209c95  kodi-audioencoder-lame-1.2.0.tar.gz
+sha256 d77e22a5c6489801af1235caf16c9df9c3ca913ac214396141626f96fb445341  kodi-audioencoder-lame-5b9a37b66938e72cc641f68d1d582a201cd89616.tar.gz
diff --git a/package/kodi-audioencoder-lame/kodi-audioencoder-lame.mk b/package/kodi-audioencoder-lame/kodi-audioencoder-lame.mk
index 3f06a06135..316c603845 100644
--- a/package/kodi-audioencoder-lame/kodi-audioencoder-lame.mk
+++ b/package/kodi-audioencoder-lame/kodi-audioencoder-lame.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-KODI_AUDIOENCODER_LAME_VERSION = 1.2.0
-KODI_AUDIOENCODER_LAME_SITE = $(call github,xbmc,audioencoder.lame,v$(KODI_AUDIOENCODER_LAME_VERSION))
+KODI_AUDIOENCODER_LAME_VERSION = 5b9a37b66938e72cc641f68d1d582a201cd89616
+KODI_AUDIOENCODER_LAME_SITE = $(call github,xbmc,audioencoder.lame,$(KODI_AUDIOENCODER_LAME_VERSION))
 KODI_AUDIOENCODER_LAME_LICENSE = GPL-2.0+
 KODI_AUDIOENCODER_LAME_LICENSE_FILES = src/EncoderLame.cpp
 KODI_AUDIOENCODER_LAME_DEPENDENCIES = kodi lame
diff --git a/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.hash b/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.hash
index 1b41a88dbc..df236226c1 100644
--- a/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.hash
+++ b/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 f00c74f010b465d43e8206bcbe155785e1f34660ca010acff3b890595ea2352c  kodi-audioencoder-vorbis-1.1.0.tar.gz
+sha256 bd284ff7442bc9b626e7afc2d9f096857e8f2d856db3985783310162a95019d9  kodi-audioencoder-vorbis-6c523fe5f91f951c63aeb81a6808433da03d1c4b.tar.gz
diff --git a/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.mk b/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.mk
index 0c0c406a58..44a6952a74 100644
--- a/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.mk
+++ b/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-KODI_AUDIOENCODER_VORBIS_VERSION = 1.1.0
-KODI_AUDIOENCODER_VORBIS_SITE = $(call github,xbmc,audioencoder.vorbis,v$(KODI_AUDIOENCODER_VORBIS_VERSION))
+KODI_AUDIOENCODER_VORBIS_VERSION = 6c523fe5f91f951c63aeb81a6808433da03d1c4b
+KODI_AUDIOENCODER_VORBIS_SITE = $(call github,xbmc,audioencoder.vorbis,$(KODI_AUDIOENCODER_VORBIS_VERSION))
 KODI_AUDIOENCODER_VORBIS_LICENSE = GPL-2.0+
 KODI_AUDIOENCODER_VORBIS_LICENSE_FILES = src/EncoderVorbis.cpp
 KODI_AUDIOENCODER_VORBIS_DEPENDENCIES = kodi libogg libvorbis host-pkgconf
diff --git a/package/kodi-audioencoder-wav/kodi-audioencoder-wav.hash b/package/kodi-audioencoder-wav/kodi-audioencoder-wav.hash
index b302c18ac9..801b12d37f 100644
--- a/package/kodi-audioencoder-wav/kodi-audioencoder-wav.hash
+++ b/package/kodi-audioencoder-wav/kodi-audioencoder-wav.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 f9b0f79c8364fb7ef584137031fceb8d2ab1af28e110cfe2a31932631cb8d36e  kodi-audioencoder-wav-1.1.0.tar.gz
+sha256 dded1f0822ff077b3f632981cec1eecef72cddba4841c8cd3550edc086f3f75f  kodi-audioencoder-wav-57b4735f54ecf11fbf7f95b715164a79aaad683b.tar.gz
diff --git a/package/kodi-audioencoder-wav/kodi-audioencoder-wav.mk b/package/kodi-audioencoder-wav/kodi-audioencoder-wav.mk
index d21546ba05..67f7f024df 100644
--- a/package/kodi-audioencoder-wav/kodi-audioencoder-wav.mk
+++ b/package/kodi-audioencoder-wav/kodi-audioencoder-wav.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-KODI_AUDIOENCODER_WAV_VERSION = 1.1.0
-KODI_AUDIOENCODER_WAV_SITE = $(call github,xbmc,audioencoder.wav,v$(KODI_AUDIOENCODER_WAV_VERSION))
+KODI_AUDIOENCODER_WAV_VERSION = 57b4735f54ecf11fbf7f95b715164a79aaad683b
+KODI_AUDIOENCODER_WAV_SITE = $(call github,xbmc,audioencoder.wav,$(KODI_AUDIOENCODER_WAV_VERSION))
 KODI_AUDIOENCODER_WAV_LICENSE = GPL-2.0+
 KODI_AUDIOENCODER_WAV_LICENSE_FILES = src/EncoderWav.cpp
 KODI_AUDIOENCODER_WAV_DEPENDENCIES = kodi
-- 
2.20.1
