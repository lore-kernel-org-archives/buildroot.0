From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  3 Aug 2019 21:36:28 +0200
Subject: [Buildroot] [PATCH v5 11/25] package/kodi-audioencoder-*: mass
 version bump
In-Reply-To: <20190803193642.17892-1-bernd.kuhls@t-online.de>
References: <20190803193642.17892-1-bernd.kuhls@t-online.de>
Message-ID: <20190803193642.17892-12-bernd.kuhls@t-online.de>
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
index 9a0f81e10d..a30e7e1009 100644
--- a/package/kodi-audioencoder-flac/kodi-audioencoder-flac.hash
+++ b/package/kodi-audioencoder-flac/kodi-audioencoder-flac.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 811dac5766dc9ef1a3447c55637edde55c5ddca1d583124e9312328152015ae5  kodi-audioencoder-flac-1.1.0.tar.gz
+sha256 03bdcdd2af3f17e8671e79272d84e6e1066d6d8de7a21fcf488f1fcff74dd437  kodi-audioencoder-flac-264fa66e26de2612fdcd1b7c313403fdf0de39cd.tar.gz
diff --git a/package/kodi-audioencoder-flac/kodi-audioencoder-flac.mk b/package/kodi-audioencoder-flac/kodi-audioencoder-flac.mk
index ea5a0860c6..0e438bca27 100644
--- a/package/kodi-audioencoder-flac/kodi-audioencoder-flac.mk
+++ b/package/kodi-audioencoder-flac/kodi-audioencoder-flac.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-KODI_AUDIOENCODER_FLAC_VERSION = 1.1.0
-KODI_AUDIOENCODER_FLAC_SITE = $(call github,xbmc,audioencoder.flac,v$(KODI_AUDIOENCODER_FLAC_VERSION))
+KODI_AUDIOENCODER_FLAC_VERSION = 264fa66e26de2612fdcd1b7c313403fdf0de39cd
+KODI_AUDIOENCODER_FLAC_SITE = $(call github,xbmc,audioencoder.flac,$(KODI_AUDIOENCODER_FLAC_VERSION))
 KODI_AUDIOENCODER_FLAC_LICENSE = GPL-2.0+
 KODI_AUDIOENCODER_FLAC_LICENSE_FILES = src/EncoderFlac.cpp
 KODI_AUDIOENCODER_FLAC_DEPENDENCIES = flac kodi libogg host-pkgconf
diff --git a/package/kodi-audioencoder-lame/kodi-audioencoder-lame.hash b/package/kodi-audioencoder-lame/kodi-audioencoder-lame.hash
index 6edd161559..0ae8de73e5 100644
--- a/package/kodi-audioencoder-lame/kodi-audioencoder-lame.hash
+++ b/package/kodi-audioencoder-lame/kodi-audioencoder-lame.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 5118a2925bb0f7eca36b2d0f4d6822b45a8967c9fb91054bfaa8f83d21209c95  kodi-audioencoder-lame-1.2.0.tar.gz
+sha256 fa6b21af928aa9dd34c7cc1594ffa24e7c457a93168cc7c12b20378fb128a7fc  kodi-audioencoder-lame-563d35e45f4d45fdbe0823b0f3db7d7f099d3154.tar.gz
diff --git a/package/kodi-audioencoder-lame/kodi-audioencoder-lame.mk b/package/kodi-audioencoder-lame/kodi-audioencoder-lame.mk
index 3f06a06135..e00f17473e 100644
--- a/package/kodi-audioencoder-lame/kodi-audioencoder-lame.mk
+++ b/package/kodi-audioencoder-lame/kodi-audioencoder-lame.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-KODI_AUDIOENCODER_LAME_VERSION = 1.2.0
-KODI_AUDIOENCODER_LAME_SITE = $(call github,xbmc,audioencoder.lame,v$(KODI_AUDIOENCODER_LAME_VERSION))
+KODI_AUDIOENCODER_LAME_VERSION = 563d35e45f4d45fdbe0823b0f3db7d7f099d3154
+KODI_AUDIOENCODER_LAME_SITE = $(call github,xbmc,audioencoder.lame,$(KODI_AUDIOENCODER_LAME_VERSION))
 KODI_AUDIOENCODER_LAME_LICENSE = GPL-2.0+
 KODI_AUDIOENCODER_LAME_LICENSE_FILES = src/EncoderLame.cpp
 KODI_AUDIOENCODER_LAME_DEPENDENCIES = kodi lame
diff --git a/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.hash b/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.hash
index 1b41a88dbc..2519f7630e 100644
--- a/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.hash
+++ b/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 f00c74f010b465d43e8206bcbe155785e1f34660ca010acff3b890595ea2352c  kodi-audioencoder-vorbis-1.1.0.tar.gz
+sha256 5da6449309ecd1acf6a0a4a4484ca1aff660b3184e35154d02101db5b5fd1c6f  kodi-audioencoder-vorbis-b6e1c3f2ca74dfc5b8396d2e57fc5ae29a28fce1.tar.gz
diff --git a/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.mk b/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.mk
index 0c0c406a58..e33627bed5 100644
--- a/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.mk
+++ b/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-KODI_AUDIOENCODER_VORBIS_VERSION = 1.1.0
-KODI_AUDIOENCODER_VORBIS_SITE = $(call github,xbmc,audioencoder.vorbis,v$(KODI_AUDIOENCODER_VORBIS_VERSION))
+KODI_AUDIOENCODER_VORBIS_VERSION = b6e1c3f2ca74dfc5b8396d2e57fc5ae29a28fce1
+KODI_AUDIOENCODER_VORBIS_SITE = $(call github,xbmc,audioencoder.vorbis,$(KODI_AUDIOENCODER_VORBIS_VERSION))
 KODI_AUDIOENCODER_VORBIS_LICENSE = GPL-2.0+
 KODI_AUDIOENCODER_VORBIS_LICENSE_FILES = src/EncoderVorbis.cpp
 KODI_AUDIOENCODER_VORBIS_DEPENDENCIES = kodi libogg libvorbis host-pkgconf
diff --git a/package/kodi-audioencoder-wav/kodi-audioencoder-wav.hash b/package/kodi-audioencoder-wav/kodi-audioencoder-wav.hash
index b302c18ac9..694264ff47 100644
--- a/package/kodi-audioencoder-wav/kodi-audioencoder-wav.hash
+++ b/package/kodi-audioencoder-wav/kodi-audioencoder-wav.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 f9b0f79c8364fb7ef584137031fceb8d2ab1af28e110cfe2a31932631cb8d36e  kodi-audioencoder-wav-1.1.0.tar.gz
+sha256 cfac91041d3deb73581145df7cf1d2c5916ed4168f43c1d86f6b7f4dd65670af  kodi-audioencoder-wav-80538612bbb8adcdfd9a31b55d4ec5571c2b459f.tar.gz
diff --git a/package/kodi-audioencoder-wav/kodi-audioencoder-wav.mk b/package/kodi-audioencoder-wav/kodi-audioencoder-wav.mk
index d21546ba05..48b7ac594a 100644
--- a/package/kodi-audioencoder-wav/kodi-audioencoder-wav.mk
+++ b/package/kodi-audioencoder-wav/kodi-audioencoder-wav.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-KODI_AUDIOENCODER_WAV_VERSION = 1.1.0
-KODI_AUDIOENCODER_WAV_SITE = $(call github,xbmc,audioencoder.wav,v$(KODI_AUDIOENCODER_WAV_VERSION))
+KODI_AUDIOENCODER_WAV_VERSION = 80538612bbb8adcdfd9a31b55d4ec5571c2b459f
+KODI_AUDIOENCODER_WAV_SITE = $(call github,xbmc,audioencoder.wav,$(KODI_AUDIOENCODER_WAV_VERSION))
 KODI_AUDIOENCODER_WAV_LICENSE = GPL-2.0+
 KODI_AUDIOENCODER_WAV_LICENSE_FILES = src/EncoderWav.cpp
 KODI_AUDIOENCODER_WAV_DEPENDENCIES = kodi
-- 
2.20.1
