From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon,  9 Mar 2020 19:39:23 +0100
Subject: [Buildroot] [PATCH 01/16] package/kodi-audiodecoder-*: mass version
 bump
Message-ID: <20200309183938.2528-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Switch _LICENSE_FILES to debian/copyright instead of using a source
code file.

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
 .../kodi-audiodecoder-timidity.hash                           | 4 ++--
 .../kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.mk  | 4 ++--
 .../kodi-audiodecoder-vgmstream.hash                          | 4 ++--
 .../kodi-audiodecoder-vgmstream.mk                            | 4 ++--
 14 files changed, 28 insertions(+), 28 deletions(-)

diff --git a/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.hash b/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.hash
index 11542f9c91..6bc7bc9acf 100644
--- a/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.hash
+++ b/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 2e99f1c8b28e176268644c07020aa92ad74d22e7244db1af69f31b767f8e845f  kodi-audiodecoder-modplug-2.0.2-Leia.tar.gz
-sha256 785e25c61cbc691e7cebcd1d084ca3e5f7a20d5e99ea89ddd2ce7aed6c94c27d  src/ModplugCodec.cpp
+sha256 6827f1ebefa5f281ace52bdf83b5ab95789c77b88a344524ead1b346668d57e7  kodi-audiodecoder-modplug-2.0.3-Leia.tar.gz
+sha256 317f732723eb58745a9b22c234861dbd2d98972039543f6b549c7cb26eb2cb08  debian/copyright
diff --git a/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.mk b/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.mk
index 6a501c2379..8e1031053e 100644
--- a/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.mk
+++ b/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-KODI_AUDIODECODER_MODPLUG_VERSION = 2.0.2-Leia
+KODI_AUDIODECODER_MODPLUG_VERSION = 2.0.3-Leia
 KODI_AUDIODECODER_MODPLUG_SITE = $(call github,xbmc,audiodecoder.modplug,$(KODI_AUDIODECODER_MODPLUG_VERSION))
 KODI_AUDIODECODER_MODPLUG_LICENSE = GPL-2.0+
-KODI_AUDIODECODER_MODPLUG_LICENSE_FILES = src/ModplugCodec.cpp
+KODI_AUDIODECODER_MODPLUG_LICENSE_FILES = debian/copyright
 KODI_AUDIODECODER_MODPLUG_DEPENDENCIES = kodi libmodplug
 
 $(eval $(cmake-package))
diff --git a/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.hash b/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.hash
index 756d85e80d..ae6931ae63 100644
--- a/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.hash
+++ b/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 0c17f407d90dd08368aead5df8bacf7589b97bf1c0d1ea45c60cc7d0da26844c  kodi-audiodecoder-nosefart-2.0.1-Leia.tar.gz
-sha256 8ff36ab79bfc1960b47d01bb33ef106e8eca495a85b206192d8a26bbf8055821  src/NSFCodec.cpp
+sha256 66305c9d654aed0b9efcf44b90acac0ab8db321dff57523d13faf67606cd78ce  kodi-audiodecoder-nosefart-2.0.2-Leia.tar.gz
+sha256 01a3f135925df23a5d8679ff633fe3d5021125224c9349acd2c35dd0cf3ea762  debian/copyright
diff --git a/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.mk b/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.mk
index 1d9944d6c6..8f437a7378 100644
--- a/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.mk
+++ b/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-KODI_AUDIODECODER_NOSEFART_VERSION = 2.0.1-Leia
+KODI_AUDIODECODER_NOSEFART_VERSION = 2.0.2-Leia
 KODI_AUDIODECODER_NOSEFART_SITE = $(call github,xbmc,audiodecoder.nosefart,$(KODI_AUDIODECODER_NOSEFART_VERSION))
 KODI_AUDIODECODER_NOSEFART_LICENSE = GPL-2.0+
-KODI_AUDIODECODER_NOSEFART_LICENSE_FILES = src/NSFCodec.cpp
+KODI_AUDIODECODER_NOSEFART_LICENSE_FILES = debian/copyright
 KODI_AUDIODECODER_NOSEFART_DEPENDENCIES = kodi
 
 $(eval $(cmake-package))
diff --git a/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.hash b/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.hash
index 7255319aa4..5c6a644ff3 100644
--- a/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.hash
+++ b/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 0dbff020e1988261680f2329fb6a29a034fede467885158ee63bae7e763d8e87  kodi-audiodecoder-sidplay-1.2.1-Leia.tar.gz
-sha256 0a9cf3c7f8aaa2bbbe4cbf80307513eb99595ebb8179e8bc549159184bbdca3a  src/SIDCodec.cpp
+sha256 271e513a3094b163f986eb5bb5cbc70c7a602f5764cef255cc161cc5094e5648  kodi-audiodecoder-sidplay-1.2.2-Leia.tar.gz
+sha256 dc915100daec3589f59b47f3438e8ec5ccc11ec25ccb3d0e7e66639764f31584  debian/copyright
diff --git a/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.mk b/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.mk
index 83541d5ec6..079ae0b202 100644
--- a/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.mk
+++ b/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-KODI_AUDIODECODER_SIDPLAY_VERSION = 1.2.1-Leia
+KODI_AUDIODECODER_SIDPLAY_VERSION = 1.2.2-Leia
 KODI_AUDIODECODER_SIDPLAY_SITE = $(call github,xbmc,audiodecoder.sidplay,$(KODI_AUDIODECODER_SIDPLAY_VERSION))
 KODI_AUDIODECODER_SIDPLAY_LICENSE = GPL-2.0+
-KODI_AUDIODECODER_SIDPLAY_LICENSE_FILES = src/SIDCodec.cpp
+KODI_AUDIODECODER_SIDPLAY_LICENSE_FILES = debian/copyright
 KODI_AUDIODECODER_SIDPLAY_DEPENDENCIES = host-pkgconf kodi libsidplay2
 
 $(eval $(cmake-package))
diff --git a/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.hash b/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.hash
index 1a4c9a0e72..ad3bf9be90 100644
--- a/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.hash
+++ b/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 db39f1f4a892fede45a5bffadd760962b5f02ab62e095a35dc37298cf548013d  kodi-audiodecoder-snesapu-2.0.1-Leia.tar.gz
-sha256 44d53bc17eb40ff1bdce9418be001334a99af9f41cf36e917f766e44604f63f8  src/SPCCodec.cpp
+sha256 e059f84b04b8e92e5ecc2989303f6a736f37d6e3bda939ac765499e616c91580  kodi-audiodecoder-snesapu-2.0.2-Leia.tar.gz
+sha256 b7e8b234fc40687d647d929fc554b91cdaa4011e5e656e68c5c6ee8c4cdf81d2  debian/copyright
diff --git a/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.mk b/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.mk
index d78f915384..57504a17bb 100644
--- a/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.mk
+++ b/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-KODI_AUDIODECODER_SNESAPU_VERSION = 2.0.1-Leia
+KODI_AUDIODECODER_SNESAPU_VERSION = 2.0.2-Leia
 KODI_AUDIODECODER_SNESAPU_SITE = $(call github,xbmc,audiodecoder.snesapu,$(KODI_AUDIODECODER_SNESAPU_VERSION))
 KODI_AUDIODECODER_SNESAPU_LICENSE = GPL-2.0+
-KODI_AUDIODECODER_SNESAPU_LICENSE_FILES = src/SPCCodec.cpp
+KODI_AUDIODECODER_SNESAPU_LICENSE_FILES = debian/copyright
 KODI_AUDIODECODER_SNESAPU_DEPENDENCIES = kodi
 
 $(eval $(cmake-package))
diff --git a/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.hash b/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.hash
index e5a96bdba6..ae1c82e2d0 100644
--- a/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.hash
+++ b/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 75e219bf9abac3949dd3dd3fe908bc2b6e6b85654594e5494335e7e2f14dd1f1  kodi-audiodecoder-stsound-2.0.1-Leia.tar.gz
-sha256 dea29ec20a9d23f0f85cd863a2ecf38fad8b9267e2f298f22a4b1adb0a2a853e  src/YMCodec.cpp
+sha256 3e14a7da3822002a90bf7d31a9f98541ae9ec2137c764dc94ca5b4de4ac8de82  kodi-audiodecoder-stsound-2.0.2-Leia.tar.gz
+sha256 417ded3464139990f7898ac17c9eacde85dc0fafd3b3ca0c497d945b1bd93af5  debian/copyright
diff --git a/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.mk b/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.mk
index b20fc345fe..679be5a7ff 100644
--- a/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.mk
+++ b/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-KODI_AUDIODECODER_STSOUND_VERSION = 2.0.1-Leia
+KODI_AUDIODECODER_STSOUND_VERSION = 2.0.2-Leia
 KODI_AUDIODECODER_STSOUND_SITE = $(call github,xbmc,audiodecoder.stsound,$(KODI_AUDIODECODER_STSOUND_VERSION))
 KODI_AUDIODECODER_STSOUND_LICENSE = GPL-2.0+
-KODI_AUDIODECODER_STSOUND_LICENSE_FILES = src/YMCodec.cpp
+KODI_AUDIODECODER_STSOUND_LICENSE_FILES = debian/copyright
 KODI_AUDIODECODER_STSOUND_DEPENDENCIES = kodi
 
 $(eval $(cmake-package))
diff --git a/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.hash b/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.hash
index 0a8bdb279c..d944584d9e 100644
--- a/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.hash
+++ b/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 bc6dea6dca0949571a3123e26f27dc73c78b8a876362fc8e95649280f2557bc0  kodi-audiodecoder-timidity-2.0.3-Leia.tar.gz
-sha256 d1b64dcec44f6dfa0168a93bf1e1497e233cf3a6a475f60ca7e0a813510d6aba  src/TimidityCodec.cpp
+sha256 3ddd560b1c907f092f30e51dfc1f0b19e3cf77071fa557cb949d6fc3d9133497  kodi-audiodecoder-timidity-2.0.4-Leia.tar.gz
+sha256 66792d1a5f4c47fbe593c0edfcd58af168a1e9c09ea3ca5b741ea170197638c2  debian/copyright
diff --git a/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.mk b/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.mk
index fa78a3d782..fecd1342b3 100644
--- a/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.mk
+++ b/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-KODI_AUDIODECODER_TIMIDITY_VERSION = 2.0.3-Leia
+KODI_AUDIODECODER_TIMIDITY_VERSION = 2.0.4-Leia
 KODI_AUDIODECODER_TIMIDITY_SITE = $(call github,xbmc,audiodecoder.timidity,$(KODI_AUDIODECODER_TIMIDITY_VERSION))
 KODI_AUDIODECODER_TIMIDITY_LICENSE = GPL-2.0+
-KODI_AUDIODECODER_TIMIDITY_LICENSE_FILES = src/TimidityCodec.cpp
+KODI_AUDIODECODER_TIMIDITY_LICENSE_FILES = debian/copyright
 KODI_AUDIODECODER_TIMIDITY_DEPENDENCIES = kodi
 
 $(eval $(cmake-package))
diff --git a/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.hash b/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.hash
index c4a3cdf23d..05d641b158 100644
--- a/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.hash
+++ b/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 6f1940d2a0607342cba8cffc0beb7c78caae5995c2d554a6079f4849997da7ba  kodi-audiodecoder-vgmstream-1.1.4-Leia.tar.gz
-sha256 976ef407b9b30a6c30dab03a8fbb32d0e7e45713b2121d9b378bfb15dc1dfc09  src/VGMCodec.cpp
+sha256 28876be1e1317b3ec5c3a4fe415f20d92a4c5868912656c5e8ab9cdd7e3f32d8  kodi-audiodecoder-vgmstream-1.1.5-Leia.tar.gz
+sha256 fc7c7ab8774d94fb2eccdf47e3b8052a3906e4b5ec8554191da321020c965d8e  debian/copyright
diff --git a/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.mk b/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.mk
index 81f4825885..4e3cdab584 100644
--- a/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.mk
+++ b/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-KODI_AUDIODECODER_VGMSTREAM_VERSION = 1.1.4-Leia
+KODI_AUDIODECODER_VGMSTREAM_VERSION = 1.1.5-Leia
 KODI_AUDIODECODER_VGMSTREAM_SITE = $(call github,xbmc,audiodecoder.vgmstream,$(KODI_AUDIODECODER_VGMSTREAM_VERSION))
 KODI_AUDIODECODER_VGMSTREAM_LICENSE = GPL-2.0+
-KODI_AUDIODECODER_VGMSTREAM_LICENSE_FILES = src/VGMCodec.cpp
+KODI_AUDIODECODER_VGMSTREAM_LICENSE_FILES = debian/copyright
 KODI_AUDIODECODER_VGMSTREAM_DEPENDENCIES = kodi
 
 $(eval $(cmake-package))
-- 
2.25.0
