From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri,  3 Feb 2017 17:20:21 +0100
Subject: [Buildroot] [PATCH v2 27/38] package/kodi-audiodecoder-*: mass
	version bump
In-Reply-To: <20170203162032.2923-1-bernd.kuhls@t-online.de>
References: <20170203162032.2923-1-bernd.kuhls@t-online.de>
Message-ID: <20170203162032.2923-28-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.hash     | 2 +-
 package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.mk       | 2 +-
 package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.hash   | 2 +-
 package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.mk     | 2 +-
 package/kodi-audiodecoder-opus/kodi-audiodecoder-opus.hash           | 2 +-
 package/kodi-audiodecoder-opus/kodi-audiodecoder-opus.mk             | 2 +-
 package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.hash     | 2 +-
 package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.mk       | 2 +-
 package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.hash     | 2 +-
 package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.mk       | 2 +-
 package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.hash     | 2 +-
 package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.mk       | 2 +-
 package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.hash | 2 +-
 package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.mk   | 2 +-
 14 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.hash b/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.hash
index 2760b11b5..9b1c2114a 100644
--- a/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.hash
+++ b/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 dd4610ba5fdf3f46dcd0deff785d373d3996c6585cbeb39cb4449baafe5ea3df kodi-audiodecoder-modplug-03b772da7ea44ff3c34b322989254cd1e4732443.tar.gz
+sha256 8be4f8c6324bf790069e42c963e14733c53fcdc27548f21f4822b178f47b8177  kodi-audiodecoder-modplug-v1.1.0.tar.gz
diff --git a/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.mk b/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.mk
index 581223c0b..a40744812 100644
--- a/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.mk
+++ b/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_AUDIODECODER_MODPLUG_VERSION = 03b772da7ea44ff3c34b322989254cd1e4732443
+KODI_AUDIODECODER_MODPLUG_VERSION = v1.1.0
 KODI_AUDIODECODER_MODPLUG_SITE = $(call github,notspiff,audiodecoder.modplug,$(KODI_AUDIODECODER_MODPLUG_VERSION))
 KODI_AUDIODECODER_MODPLUG_LICENSE = GPLv2+
 KODI_AUDIODECODER_MODPLUG_LICENSE_FILES = src/ModplugCodec.cpp
diff --git a/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.hash b/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.hash
index b4cd28fea..df93b25c8 100644
--- a/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.hash
+++ b/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 da65b21ed6218d65b7d382d7fdd9c848a87f6dc766864925979ea8244320db94 kodi-audiodecoder-nosefart-bfab543bae0d9855538cf03e78ea9cd5e3b9750e.tar.gz
+sha256 444cc85f4618daa5147a63633db3f300123d5e33b1b5894e7036fa9243e8a535  kodi-audiodecoder-nosefart-v1.1.0.tar.gz
diff --git a/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.mk b/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.mk
index 49688a4d9..9e8a734b3 100644
--- a/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.mk
+++ b/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_AUDIODECODER_NOSEFART_VERSION = bfab543bae0d9855538cf03e78ea9cd5e3b9750e
+KODI_AUDIODECODER_NOSEFART_VERSION = v1.1.0
 KODI_AUDIODECODER_NOSEFART_SITE = $(call github,notspiff,audiodecoder.nosefart,$(KODI_AUDIODECODER_NOSEFART_VERSION))
 KODI_AUDIODECODER_NOSEFART_LICENSE = GPLv2+
 KODI_AUDIODECODER_NOSEFART_LICENSE_FILES = src/NSFCodec.cpp
diff --git a/package/kodi-audiodecoder-opus/kodi-audiodecoder-opus.hash b/package/kodi-audiodecoder-opus/kodi-audiodecoder-opus.hash
index fa60ce576..117e9f833 100644
--- a/package/kodi-audiodecoder-opus/kodi-audiodecoder-opus.hash
+++ b/package/kodi-audiodecoder-opus/kodi-audiodecoder-opus.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 74b5736aa21d9cfb8fa835c1dc9cca47817cdb3867f99f5c6aee655f0df476ad kodi-audiodecoder-opus-0bd11e35e6ed8b6480e4100ac8927113cb085eda.tar.gz
+sha256 bb7037f903f0396da739005843264acd7227cf96eeeac78b0e36d82872c9acc4  kodi-audiodecoder-opus-d6eb25f0c08033f9a2b4d7402e8baf866ebc731c.tar.gz
diff --git a/package/kodi-audiodecoder-opus/kodi-audiodecoder-opus.mk b/package/kodi-audiodecoder-opus/kodi-audiodecoder-opus.mk
index efe17f38a..41ed9ef0f 100644
--- a/package/kodi-audiodecoder-opus/kodi-audiodecoder-opus.mk
+++ b/package/kodi-audiodecoder-opus/kodi-audiodecoder-opus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_AUDIODECODER_OPUS_VERSION = 0bd11e35e6ed8b6480e4100ac8927113cb085eda
+KODI_AUDIODECODER_OPUS_VERSION = d6eb25f0c08033f9a2b4d7402e8baf866ebc731c
 KODI_AUDIODECODER_OPUS_SITE = $(call github,notspiff,audiodecoder.opus,$(KODI_AUDIODECODER_OPUS_VERSION))
 KODI_AUDIODECODER_OPUS_LICENSE = GPLv2+
 KODI_AUDIODECODER_OPUS_LICENSE_FILES = src/OpusCodec.cpp
diff --git a/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.hash b/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.hash
index f339654f7..b806956a7 100644
--- a/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.hash
+++ b/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 11855e7b0311516602eda34c5fa4917d51220a27c3053ea831da149ae4c93757 kodi-audiodecoder-sidplay-d832f050211b4e5f085a8b09bc7d26ce32098169.tar.gz
+sha256 527b188679add8043e8cd691af9735b6fe8bd6935ad8ac8312b459d6f160cdac  kodi-audiodecoder-sidplay-v1.1.0.tar.gz
diff --git a/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.mk b/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.mk
index d8cf438b1..826b255cb 100644
--- a/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.mk
+++ b/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_AUDIODECODER_SIDPLAY_VERSION = d832f050211b4e5f085a8b09bc7d26ce32098169
+KODI_AUDIODECODER_SIDPLAY_VERSION = v1.1.0
 KODI_AUDIODECODER_SIDPLAY_SITE = $(call github,notspiff,audiodecoder.sidplay,$(KODI_AUDIODECODER_SIDPLAY_VERSION))
 KODI_AUDIODECODER_SIDPLAY_LICENSE = GPLv2+
 KODI_AUDIODECODER_SIDPLAY_LICENSE_FILES = src/SIDCodec.cpp
diff --git a/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.hash b/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.hash
index e3da57221..159d67ecd 100644
--- a/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.hash
+++ b/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 6fd6e5dda0fbcdac280952e0efc0bb255ef99628c892164c26e60ee3f2ab8e4e kodi-audiodecoder-snesapu-db62e88e568994a0496d7026a10e044d70b3aa2b.tar.gz
+sha256 20d85822d0c01223903b5e5472a1d029fa4931c2a9ac4d399345c4363fa8f905  kodi-audiodecoder-snesapu-v1.1.0.tar.gz
diff --git a/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.mk b/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.mk
index f9f398ca7..6d7cfb251 100644
--- a/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.mk
+++ b/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_AUDIODECODER_SNESAPU_VERSION = db62e88e568994a0496d7026a10e044d70b3aa2b
+KODI_AUDIODECODER_SNESAPU_VERSION = v1.1.0
 KODI_AUDIODECODER_SNESAPU_SITE = $(call github,notspiff,audiodecoder.snesapu,$(KODI_AUDIODECODER_SNESAPU_VERSION))
 KODI_AUDIODECODER_SNESAPU_LICENSE = GPLv2+
 KODI_AUDIODECODER_SNESAPU_LICENSE_FILES = src/SPCCodec.cpp
diff --git a/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.hash b/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.hash
index 164e96763..133e645fa 100644
--- a/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.hash
+++ b/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 2bd89d66c493ba354df5c154f313a4bd801ff019ad5c102aa54741b99dd9c608 kodi-audiodecoder-stsound-759ae7eadb94adfde8533a2a42d949c321718625.tar.gz
+sha256 c9b6e98d544712f7cec3cf18f866ccaed2fbcd20410179259ae0455ffa967ca4  kodi-audiodecoder-stsound-v1.1.0.tar.gz
diff --git a/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.mk b/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.mk
index 76010899b..d5af5276a 100644
--- a/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.mk
+++ b/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_AUDIODECODER_STSOUND_VERSION = 759ae7eadb94adfde8533a2a42d949c321718625
+KODI_AUDIODECODER_STSOUND_VERSION = v1.1.0
 KODI_AUDIODECODER_STSOUND_SITE = $(call github,notspiff,audiodecoder.stsound,$(KODI_AUDIODECODER_STSOUND_VERSION))
 KODI_AUDIODECODER_STSOUND_LICENSE = GPLv2+
 KODI_AUDIODECODER_STSOUND_LICENSE_FILES = src/YMCodec.cpp
diff --git a/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.hash b/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.hash
index 5e6dfab3a..28f4272e2 100644
--- a/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.hash
+++ b/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 7a376447e8390f01c18f22b57ea553441493625545537a023d5d896272e56369 kodi-audiodecoder-vgmstream-cb2892ac0465b0563ee45f532323198a6f722b62.tar.gz
+sha256 40cd4f7f143c9313a4437854e31c460046af47bd709364439f0e370ec464af0d  kodi-audiodecoder-vgmstream-v1.1.0.tar.gz
diff --git a/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.mk b/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.mk
index 447d837c4..6358f0638 100644
--- a/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.mk
+++ b/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_AUDIODECODER_VGMSTREAM_VERSION = cb2892ac0465b0563ee45f532323198a6f722b62
+KODI_AUDIODECODER_VGMSTREAM_VERSION = v1.1.0
 KODI_AUDIODECODER_VGMSTREAM_SITE = $(call github,notspiff,audiodecoder.vgmstream,$(KODI_AUDIODECODER_VGMSTREAM_VERSION))
 KODI_AUDIODECODER_VGMSTREAM_LICENSE = GPLv2+
 KODI_AUDIODECODER_VGMSTREAM_LICENSE_FILES = src/VGMCodec.cpp
-- 
2.11.0
