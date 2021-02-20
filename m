From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 20 Feb 2021 09:58:26 +0100
Subject: [Buildroot] [PATCH/next 07/54] package/kodi-audiodecoder-*: mass
 version bump
In-Reply-To: <20210220085913.888324-1-bernd.kuhls@t-online.de>
References: <20210220085913.888324-1-bernd.kuhls@t-online.de>
Message-ID: <20210220085913.888324-8-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Switch license file to LICENSE.md.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.hash  | 4 ++--
 .../kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.mk    | 4 ++--
 .../kodi-audiodecoder-nosefart.hash                           | 4 ++--
 .../kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.mk  | 4 ++--
 .../kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.hash  | 4 ++--
 .../kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.mk    | 4 ++--
 .../kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.hash  | 4 ++--
 .../kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.mk    | 4 ++--
 .../kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.hash  | 4 ++--
 .../kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.mk    | 4 ++--
 .../kodi-audiodecoder-timidity.hash                           | 2 +-
 .../kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.mk  | 2 +-
 .../kodi-audiodecoder-vgmstream.hash                          | 4 ++--
 .../kodi-audiodecoder-vgmstream.mk                            | 4 ++--
 14 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.hash b/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.hash
index ecc6f2b778..fcb5884807 100644
--- a/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.hash
+++ b/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  6827f1ebefa5f281ace52bdf83b5ab95789c77b88a344524ead1b346668d57e7  kodi-audiodecoder-modplug-2.0.3-Leia.tar.gz
-sha256  317f732723eb58745a9b22c234861dbd2d98972039543f6b549c7cb26eb2cb08  debian/copyright
+sha256  629a9f83a2663ab8f2ea1ae747782d1ce6df870f42d6d9b84c858bc9b607ae9c  kodi-audiodecoder-modplug-3.0.0-Matrix.tar.gz
+sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.mk b/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.mk
index 8e1031053e..e4bee48f98 100644
--- a/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.mk
+++ b/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-KODI_AUDIODECODER_MODPLUG_VERSION = 2.0.3-Leia
+KODI_AUDIODECODER_MODPLUG_VERSION = 3.0.0-Matrix
 KODI_AUDIODECODER_MODPLUG_SITE = $(call github,xbmc,audiodecoder.modplug,$(KODI_AUDIODECODER_MODPLUG_VERSION))
 KODI_AUDIODECODER_MODPLUG_LICENSE = GPL-2.0+
-KODI_AUDIODECODER_MODPLUG_LICENSE_FILES = debian/copyright
+KODI_AUDIODECODER_MODPLUG_LICENSE_FILES = LICENSE.md
 KODI_AUDIODECODER_MODPLUG_DEPENDENCIES = kodi libmodplug
 
 $(eval $(cmake-package))
diff --git a/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.hash b/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.hash
index 8f04dc5302..9f929d9f82 100644
--- a/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.hash
+++ b/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  66305c9d654aed0b9efcf44b90acac0ab8db321dff57523d13faf67606cd78ce  kodi-audiodecoder-nosefart-2.0.2-Leia.tar.gz
-sha256  01a3f135925df23a5d8679ff633fe3d5021125224c9349acd2c35dd0cf3ea762  debian/copyright
+sha256  a4be5f6efc46841c9b1689c91b06f69cd695220b583e62ed2948768fa93d09a2  kodi-audiodecoder-nosefart-3.0.0-Matrix.tar.gz
+sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.mk b/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.mk
index 8f437a7378..377f6b7ef1 100644
--- a/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.mk
+++ b/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-KODI_AUDIODECODER_NOSEFART_VERSION = 2.0.2-Leia
+KODI_AUDIODECODER_NOSEFART_VERSION = 3.0.0-Matrix
 KODI_AUDIODECODER_NOSEFART_SITE = $(call github,xbmc,audiodecoder.nosefart,$(KODI_AUDIODECODER_NOSEFART_VERSION))
 KODI_AUDIODECODER_NOSEFART_LICENSE = GPL-2.0+
-KODI_AUDIODECODER_NOSEFART_LICENSE_FILES = debian/copyright
+KODI_AUDIODECODER_NOSEFART_LICENSE_FILES = LICENSE.md
 KODI_AUDIODECODER_NOSEFART_DEPENDENCIES = kodi
 
 $(eval $(cmake-package))
diff --git a/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.hash b/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.hash
index 308f2b6fe1..cb66e0a00e 100644
--- a/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.hash
+++ b/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  271e513a3094b163f986eb5bb5cbc70c7a602f5764cef255cc161cc5094e5648  kodi-audiodecoder-sidplay-1.2.2-Leia.tar.gz
-sha256  dc915100daec3589f59b47f3438e8ec5ccc11ec25ccb3d0e7e66639764f31584  debian/copyright
+sha256  4919d71e76889df1c1e3c5abe60641cc266afdbbcf3976a5509ae3fda142d2c4  kodi-audiodecoder-sidplay-3.0.0-Matrix.tar.gz
+sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.mk b/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.mk
index 079ae0b202..d0ab98418f 100644
--- a/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.mk
+++ b/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-KODI_AUDIODECODER_SIDPLAY_VERSION = 1.2.2-Leia
+KODI_AUDIODECODER_SIDPLAY_VERSION = 3.0.0-Matrix
 KODI_AUDIODECODER_SIDPLAY_SITE = $(call github,xbmc,audiodecoder.sidplay,$(KODI_AUDIODECODER_SIDPLAY_VERSION))
 KODI_AUDIODECODER_SIDPLAY_LICENSE = GPL-2.0+
-KODI_AUDIODECODER_SIDPLAY_LICENSE_FILES = debian/copyright
+KODI_AUDIODECODER_SIDPLAY_LICENSE_FILES = LICENSE.md
 KODI_AUDIODECODER_SIDPLAY_DEPENDENCIES = host-pkgconf kodi libsidplay2
 
 $(eval $(cmake-package))
diff --git a/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.hash b/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.hash
index c1c2eee2bc..b82c5b36a1 100644
--- a/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.hash
+++ b/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  e059f84b04b8e92e5ecc2989303f6a736f37d6e3bda939ac765499e616c91580  kodi-audiodecoder-snesapu-2.0.2-Leia.tar.gz
-sha256  b7e8b234fc40687d647d929fc554b91cdaa4011e5e656e68c5c6ee8c4cdf81d2  debian/copyright
+sha256  3537b735acfbbacaada2aa1d2035acbc698f37cc7626375f408e967ca612b2d0  kodi-audiodecoder-snesapu-3.0.0-Matrix.tar.gz
+sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.mk b/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.mk
index 57504a17bb..7cd2fe588c 100644
--- a/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.mk
+++ b/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-KODI_AUDIODECODER_SNESAPU_VERSION = 2.0.2-Leia
+KODI_AUDIODECODER_SNESAPU_VERSION = 3.0.0-Matrix
 KODI_AUDIODECODER_SNESAPU_SITE = $(call github,xbmc,audiodecoder.snesapu,$(KODI_AUDIODECODER_SNESAPU_VERSION))
 KODI_AUDIODECODER_SNESAPU_LICENSE = GPL-2.0+
-KODI_AUDIODECODER_SNESAPU_LICENSE_FILES = debian/copyright
+KODI_AUDIODECODER_SNESAPU_LICENSE_FILES = LICENSE.md
 KODI_AUDIODECODER_SNESAPU_DEPENDENCIES = kodi
 
 $(eval $(cmake-package))
diff --git a/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.hash b/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.hash
index 24b764061b..ae6a5aa528 100644
--- a/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.hash
+++ b/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  3e14a7da3822002a90bf7d31a9f98541ae9ec2137c764dc94ca5b4de4ac8de82  kodi-audiodecoder-stsound-2.0.2-Leia.tar.gz
-sha256  417ded3464139990f7898ac17c9eacde85dc0fafd3b3ca0c497d945b1bd93af5  debian/copyright
+sha256  65b452cd3bdf8b21929084ca0dc238147784defdfb25351c857fa459230e2f3f  kodi-audiodecoder-stsound-3.0.0-Matrix.tar.gz
+sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.mk b/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.mk
index 679be5a7ff..6a5bb721bc 100644
--- a/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.mk
+++ b/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-KODI_AUDIODECODER_STSOUND_VERSION = 2.0.2-Leia
+KODI_AUDIODECODER_STSOUND_VERSION = 3.0.0-Matrix
 KODI_AUDIODECODER_STSOUND_SITE = $(call github,xbmc,audiodecoder.stsound,$(KODI_AUDIODECODER_STSOUND_VERSION))
 KODI_AUDIODECODER_STSOUND_LICENSE = GPL-2.0+
-KODI_AUDIODECODER_STSOUND_LICENSE_FILES = debian/copyright
+KODI_AUDIODECODER_STSOUND_LICENSE_FILES = LICENSE.md
 KODI_AUDIODECODER_STSOUND_DEPENDENCIES = kodi
 
 $(eval $(cmake-package))
diff --git a/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.hash b/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.hash
index ea56c38f6c..dcb835664d 100644
--- a/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.hash
+++ b/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  b20a3a23056aaf76c216c755f36dff03e943d7c086d3e3fca4c920b93113e073  kodi-audiodecoder-timidity-2.0.5-Leia.tar.gz
+sha256  0e049f25a12d8cfc9965d189de573d87aa3e7e6549e99a7ddcaf9d8cddc111db  kodi-audiodecoder-timidity-3.0.0-Matrix.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.mk b/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.mk
index a4f0126c43..a79622cfd9 100644
--- a/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.mk
+++ b/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_AUDIODECODER_TIMIDITY_VERSION = 2.0.5-Leia
+KODI_AUDIODECODER_TIMIDITY_VERSION = 3.0.0-Matrix
 KODI_AUDIODECODER_TIMIDITY_SITE = $(call github,xbmc,audiodecoder.timidity,$(KODI_AUDIODECODER_TIMIDITY_VERSION))
 KODI_AUDIODECODER_TIMIDITY_LICENSE = GPL-2.0+
 KODI_AUDIODECODER_TIMIDITY_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.hash b/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.hash
index 3ee9ebbfcb..02df50cc7b 100644
--- a/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.hash
+++ b/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  28876be1e1317b3ec5c3a4fe415f20d92a4c5868912656c5e8ab9cdd7e3f32d8  kodi-audiodecoder-vgmstream-1.1.5-Leia.tar.gz
-sha256  fc7c7ab8774d94fb2eccdf47e3b8052a3906e4b5ec8554191da321020c965d8e  debian/copyright
+sha256  81f4577c2ec53bfa7ab04d3da374b1cc639ef5f5fe9c2837f9e85916b50d9d5d  kodi-audiodecoder-vgmstream-3.0.0-Matrix.tar.gz
+sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.mk b/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.mk
index 4e3cdab584..1c3e96bb1d 100644
--- a/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.mk
+++ b/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-KODI_AUDIODECODER_VGMSTREAM_VERSION = 1.1.5-Leia
+KODI_AUDIODECODER_VGMSTREAM_VERSION = 3.0.0-Matrix
 KODI_AUDIODECODER_VGMSTREAM_SITE = $(call github,xbmc,audiodecoder.vgmstream,$(KODI_AUDIODECODER_VGMSTREAM_VERSION))
 KODI_AUDIODECODER_VGMSTREAM_LICENSE = GPL-2.0+
-KODI_AUDIODECODER_VGMSTREAM_LICENSE_FILES = debian/copyright
+KODI_AUDIODECODER_VGMSTREAM_LICENSE_FILES = LICENSE.md
 KODI_AUDIODECODER_VGMSTREAM_DEPENDENCIES = kodi
 
 $(eval $(cmake-package))
-- 
2.29.2
