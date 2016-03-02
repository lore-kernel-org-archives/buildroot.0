From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 2 Mar 2016 23:54:54 +0100
Subject: [Buildroot] [git commit] package/kodi-audio??coder-*: mass version
	bump, add hashes
Message-ID: <20160302225545.DDE4381917@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5fceea18c109ae08673ee6da841de83b0c273ed8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch bumps all audio-en- and decoder addons.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.hash     | 2 ++
 package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.mk       | 2 +-
 package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.hash   | 2 ++
 package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.mk     | 2 +-
 package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.hash     | 2 ++
 package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.mk       | 2 +-
 package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.hash     | 2 ++
 package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.mk       | 2 +-
 package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.hash     | 2 ++
 package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.mk       | 2 +-
 package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.hash   | 2 ++
 package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.mk     | 2 +-
 package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.hash | 2 ++
 package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.mk   | 2 +-
 package/kodi-audioencoder-flac/kodi-audioencoder-flac.hash           | 2 ++
 package/kodi-audioencoder-flac/kodi-audioencoder-flac.mk             | 2 +-
 package/kodi-audioencoder-lame/kodi-audioencoder-lame.hash           | 2 ++
 package/kodi-audioencoder-lame/kodi-audioencoder-lame.mk             | 2 +-
 package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.hash       | 2 ++
 package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.mk         | 2 +-
 package/kodi-audioencoder-wav/kodi-audioencoder-wav.hash             | 2 ++
 package/kodi-audioencoder-wav/kodi-audioencoder-wav.mk               | 2 +-
 22 files changed, 33 insertions(+), 11 deletions(-)

diff --git a/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.hash b/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.hash
new file mode 100644
index 0000000..2760b11
--- /dev/null
+++ b/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 dd4610ba5fdf3f46dcd0deff785d373d3996c6585cbeb39cb4449baafe5ea3df kodi-audiodecoder-modplug-03b772da7ea44ff3c34b322989254cd1e4732443.tar.gz
diff --git a/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.mk b/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.mk
index 004d89f..581223c 100644
--- a/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.mk
+++ b/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_AUDIODECODER_MODPLUG_VERSION = 5ae7349f39a8e5552c86dfdad339fb18c7e52550
+KODI_AUDIODECODER_MODPLUG_VERSION = 03b772da7ea44ff3c34b322989254cd1e4732443
 KODI_AUDIODECODER_MODPLUG_SITE = $(call github,notspiff,audiodecoder.modplug,$(KODI_AUDIODECODER_MODPLUG_VERSION))
 KODI_AUDIODECODER_MODPLUG_LICENSE = GPLv2+
 KODI_AUDIODECODER_MODPLUG_LICENSE_FILES = src/ModplugCodec.cpp
diff --git a/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.hash b/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.hash
new file mode 100644
index 0000000..b4cd28f
--- /dev/null
+++ b/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 da65b21ed6218d65b7d382d7fdd9c848a87f6dc766864925979ea8244320db94 kodi-audiodecoder-nosefart-bfab543bae0d9855538cf03e78ea9cd5e3b9750e.tar.gz
diff --git a/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.mk b/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.mk
index 40786d7..49688a4 100644
--- a/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.mk
+++ b/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_AUDIODECODER_NOSEFART_VERSION = 936313f2be5c4936af8a643876363dcea76a8ebe
+KODI_AUDIODECODER_NOSEFART_VERSION = bfab543bae0d9855538cf03e78ea9cd5e3b9750e
 KODI_AUDIODECODER_NOSEFART_SITE = $(call github,notspiff,audiodecoder.nosefart,$(KODI_AUDIODECODER_NOSEFART_VERSION))
 KODI_AUDIODECODER_NOSEFART_LICENSE = GPLv2+
 KODI_AUDIODECODER_NOSEFART_LICENSE_FILES = src/NSFCodec.cpp
diff --git a/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.hash b/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.hash
new file mode 100644
index 0000000..f339654
--- /dev/null
+++ b/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 11855e7b0311516602eda34c5fa4917d51220a27c3053ea831da149ae4c93757 kodi-audiodecoder-sidplay-d832f050211b4e5f085a8b09bc7d26ce32098169.tar.gz
diff --git a/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.mk b/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.mk
index 82b5c2b..d8cf438 100644
--- a/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.mk
+++ b/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_AUDIODECODER_SIDPLAY_VERSION = 27b2c0582878857bfe03195471fa7ffa4bcc40f0
+KODI_AUDIODECODER_SIDPLAY_VERSION = d832f050211b4e5f085a8b09bc7d26ce32098169
 KODI_AUDIODECODER_SIDPLAY_SITE = $(call github,notspiff,audiodecoder.sidplay,$(KODI_AUDIODECODER_SIDPLAY_VERSION))
 KODI_AUDIODECODER_SIDPLAY_LICENSE = GPLv2+
 KODI_AUDIODECODER_SIDPLAY_LICENSE_FILES = src/SIDCodec.cpp
diff --git a/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.hash b/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.hash
new file mode 100644
index 0000000..e3da572
--- /dev/null
+++ b/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 6fd6e5dda0fbcdac280952e0efc0bb255ef99628c892164c26e60ee3f2ab8e4e kodi-audiodecoder-snesapu-db62e88e568994a0496d7026a10e044d70b3aa2b.tar.gz
diff --git a/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.mk b/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.mk
index a696b41..f9f398c 100644
--- a/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.mk
+++ b/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_AUDIODECODER_SNESAPU_VERSION = 399d1d3f32fe6f62f5657b8ce67c30229629cb51
+KODI_AUDIODECODER_SNESAPU_VERSION = db62e88e568994a0496d7026a10e044d70b3aa2b
 KODI_AUDIODECODER_SNESAPU_SITE = $(call github,notspiff,audiodecoder.snesapu,$(KODI_AUDIODECODER_SNESAPU_VERSION))
 KODI_AUDIODECODER_SNESAPU_LICENSE = GPLv2+
 KODI_AUDIODECODER_SNESAPU_LICENSE_FILES = src/SPCCodec.cpp
diff --git a/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.hash b/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.hash
new file mode 100644
index 0000000..164e967
--- /dev/null
+++ b/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 2bd89d66c493ba354df5c154f313a4bd801ff019ad5c102aa54741b99dd9c608 kodi-audiodecoder-stsound-759ae7eadb94adfde8533a2a42d949c321718625.tar.gz
diff --git a/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.mk b/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.mk
index 23da01f..7601089 100644
--- a/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.mk
+++ b/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_AUDIODECODER_STSOUND_VERSION = f6fbae94818fedd09e2f55c6cd1cb283bfdab6f4
+KODI_AUDIODECODER_STSOUND_VERSION = 759ae7eadb94adfde8533a2a42d949c321718625
 KODI_AUDIODECODER_STSOUND_SITE = $(call github,notspiff,audiodecoder.stsound,$(KODI_AUDIODECODER_STSOUND_VERSION))
 KODI_AUDIODECODER_STSOUND_LICENSE = GPLv2+
 KODI_AUDIODECODER_STSOUND_LICENSE_FILES = src/YMCodec.cpp
diff --git a/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.hash b/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.hash
new file mode 100644
index 0000000..d4af019
--- /dev/null
+++ b/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 2e220b7d279fce73ff289536cd9e94b159ae648514fb8b423977dddb99c50e85 kodi-audiodecoder-timidity-a84559da92aa67744069fc9e9dc885732588c8ce.tar.gz
diff --git a/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.mk b/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.mk
index 49ff7bc..fb680d1 100644
--- a/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.mk
+++ b/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_AUDIODECODER_TIMIDITY_VERSION = da5eb9ac6557fc1ea0f48cc044cfd16f4f2a1e0b
+KODI_AUDIODECODER_TIMIDITY_VERSION = a84559da92aa67744069fc9e9dc885732588c8ce
 KODI_AUDIODECODER_TIMIDITY_SITE = $(call github,notspiff,audiodecoder.timidity,$(KODI_AUDIODECODER_TIMIDITY_VERSION))
 KODI_AUDIODECODER_TIMIDITY_LICENSE = GPLv2+
 KODI_AUDIODECODER_TIMIDITY_LICENSE_FILES = src/TimidityCodec.cpp
diff --git a/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.hash b/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.hash
new file mode 100644
index 0000000..5e6dfab
--- /dev/null
+++ b/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 7a376447e8390f01c18f22b57ea553441493625545537a023d5d896272e56369 kodi-audiodecoder-vgmstream-cb2892ac0465b0563ee45f532323198a6f722b62.tar.gz
diff --git a/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.mk b/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.mk
index 999ad46..447d837 100644
--- a/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.mk
+++ b/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_AUDIODECODER_VGMSTREAM_VERSION = 7723f9130957f4684eac5788ccbc2f45c39590ad
+KODI_AUDIODECODER_VGMSTREAM_VERSION = cb2892ac0465b0563ee45f532323198a6f722b62
 KODI_AUDIODECODER_VGMSTREAM_SITE = $(call github,notspiff,audiodecoder.vgmstream,$(KODI_AUDIODECODER_VGMSTREAM_VERSION))
 KODI_AUDIODECODER_VGMSTREAM_LICENSE = GPLv2+
 KODI_AUDIODECODER_VGMSTREAM_LICENSE_FILES = src/VGMCodec.cpp
diff --git a/package/kodi-audioencoder-flac/kodi-audioencoder-flac.hash b/package/kodi-audioencoder-flac/kodi-audioencoder-flac.hash
new file mode 100644
index 0000000..f563f56
--- /dev/null
+++ b/package/kodi-audioencoder-flac/kodi-audioencoder-flac.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 4317a01414577885ef4a0ac4f8d95714b021ad15fc668cbf36eae2fdf400bb33 kodi-audioencoder-flac-v1.0.0.tar.gz
diff --git a/package/kodi-audioencoder-flac/kodi-audioencoder-flac.mk b/package/kodi-audioencoder-flac/kodi-audioencoder-flac.mk
index 9464577..ca48826 100644
--- a/package/kodi-audioencoder-flac/kodi-audioencoder-flac.mk
+++ b/package/kodi-audioencoder-flac/kodi-audioencoder-flac.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_AUDIOENCODER_FLAC_VERSION = 8e6718508bb9169d614c1fd5ee0e3de02af3b548
+KODI_AUDIOENCODER_FLAC_VERSION = v1.0.0
 KODI_AUDIOENCODER_FLAC_SITE = $(call github,xbmc,audioencoder.flac,$(KODI_AUDIOENCODER_FLAC_VERSION))
 KODI_AUDIOENCODER_FLAC_LICENSE = GPLv2+
 KODI_AUDIOENCODER_FLAC_LICENSE_FILES = src/EncoderFlac.cpp
diff --git a/package/kodi-audioencoder-lame/kodi-audioencoder-lame.hash b/package/kodi-audioencoder-lame/kodi-audioencoder-lame.hash
new file mode 100644
index 0000000..ffd38ba
--- /dev/null
+++ b/package/kodi-audioencoder-lame/kodi-audioencoder-lame.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 7fbdc6c9111431f49498157204d19dfa94bbf9e5f807b631e84129c6c491225e kodi-audioencoder-lame-v1.0.0.tar.gz
diff --git a/package/kodi-audioencoder-lame/kodi-audioencoder-lame.mk b/package/kodi-audioencoder-lame/kodi-audioencoder-lame.mk
index ca8c6ae..3e1836f 100644
--- a/package/kodi-audioencoder-lame/kodi-audioencoder-lame.mk
+++ b/package/kodi-audioencoder-lame/kodi-audioencoder-lame.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_AUDIOENCODER_LAME_VERSION = 0f612d467bdde03c6fac25d534a1a338a4f628ac
+KODI_AUDIOENCODER_LAME_VERSION = v1.0.0
 KODI_AUDIOENCODER_LAME_SITE = $(call github,xbmc,audioencoder.lame,$(KODI_AUDIOENCODER_LAME_VERSION))
 KODI_AUDIOENCODER_LAME_LICENSE = GPLv2+
 KODI_AUDIOENCODER_LAME_LICENSE_FILES = src/EncoderLame.cpp
diff --git a/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.hash b/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.hash
new file mode 100644
index 0000000..47f428c
--- /dev/null
+++ b/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 65169e785d82f9081088df2693721f4a7e4b2d24f7e8b1e86b5f443206935303 kodi-audioencoder-vorbis-v1.0.0.tar.gz
diff --git a/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.mk b/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.mk
index e895ae3..749ea8e 100644
--- a/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.mk
+++ b/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_AUDIOENCODER_VORBIS_VERSION = 15d619dae4411ecebadf2ec2996d611600ad0bee
+KODI_AUDIOENCODER_VORBIS_VERSION = v1.0.0
 KODI_AUDIOENCODER_VORBIS_SITE = $(call github,xbmc,audioencoder.vorbis,$(KODI_AUDIOENCODER_VORBIS_VERSION))
 KODI_AUDIOENCODER_VORBIS_LICENSE = GPLv2+
 KODI_AUDIOENCODER_VORBIS_LICENSE_FILES = src/EncoderVorbis.cpp
diff --git a/package/kodi-audioencoder-wav/kodi-audioencoder-wav.hash b/package/kodi-audioencoder-wav/kodi-audioencoder-wav.hash
new file mode 100644
index 0000000..86eb13c
--- /dev/null
+++ b/package/kodi-audioencoder-wav/kodi-audioencoder-wav.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 d4e6de5786b9e2bd3fa5e09314c9a60a8daac32cf96e8aa84ab42cacf60f7094 kodi-audioencoder-wav-v1.0.0.tar.gz
diff --git a/package/kodi-audioencoder-wav/kodi-audioencoder-wav.mk b/package/kodi-audioencoder-wav/kodi-audioencoder-wav.mk
index 543c051..661ab44 100644
--- a/package/kodi-audioencoder-wav/kodi-audioencoder-wav.mk
+++ b/package/kodi-audioencoder-wav/kodi-audioencoder-wav.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_AUDIOENCODER_WAV_VERSION = 77e16122b132ca31b27d3602fd2d9ada214ff7f6
+KODI_AUDIOENCODER_WAV_VERSION = v1.0.0
 KODI_AUDIOENCODER_WAV_SITE = $(call github,xbmc,audioencoder.wav,$(KODI_AUDIOENCODER_WAV_VERSION))
 KODI_AUDIOENCODER_WAV_LICENSE = GPLv2+
 KODI_AUDIOENCODER_WAV_LICENSE_FILES = src/EncoderWav.cpp
