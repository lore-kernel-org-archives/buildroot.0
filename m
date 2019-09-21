From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 21 Sep 2019 21:28:24 +0200
Subject: [Buildroot] [PATCH v6 23/25] package/kodi-screensaver-*: mass
 version bump
In-Reply-To: <20190921192826.10143-1-bernd.kuhls@t-online.de>
References: <20190921192826.10143-1-bernd.kuhls@t-online.de>
Message-ID: <20190921192826.10143-24-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Most screensaver repos were moved to the xbmc project:
https://github.com/xbmc/repo-binary-addons/commit/57b8ed5fb9b5f0368738260b762cc0bab1147172
https://github.com/xbmc/repo-binary-addons/commit/29c23f8e0cbfab6c39eb910ebc4f23f7afdec87e
https://github.com/xbmc/repo-binary-addons/commit/98e71315026fd163de7cc15dad8e2c0398851499
https://github.com/xbmc/repo-binary-addons/commit/994b0d5b73118e6dc5cece534daffb6a176fa426
https://github.com/xbmc/repo-binary-addons/commit/21b0c96d7fbff7853aadf63868b79384cdb40394

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-screensaver-asterwave/Config.in                 | 2 +-
 .../kodi-screensaver-asterwave.hash                          | 2 +-
 .../kodi-screensaver-asterwave/kodi-screensaver-asterwave.mk | 4 ++--
 package/kodi-screensaver-biogenesis/Config.in                | 2 +-
 .../kodi-screensaver-biogenesis.hash                         | 2 +-
 .../kodi-screensaver-biogenesis.mk                           | 4 ++--
 package/kodi-screensaver-cpblobs/Config.in                   | 2 +-
 .../kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.hash   | 2 +-
 package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.mk | 4 ++--
 .../kodi-screensaver-crystalmorph.hash                       | 2 +-
 .../kodi-screensaver-crystalmorph.mk                         | 2 +-
 package/kodi-screensaver-greynetic/Config.in                 | 2 +-
 .../kodi-screensaver-greynetic.hash                          | 2 +-
 .../kodi-screensaver-greynetic/kodi-screensaver-greynetic.mk | 4 ++--
 package/kodi-screensaver-matrixtrails/Config.in              | 2 +-
 .../kodi-screensaver-matrixtrails.hash                       | 2 +-
 .../kodi-screensaver-matrixtrails.mk                         | 5 ++---
 package/kodi-screensaver-pingpong/Config.in                  | 2 +-
 .../kodi-screensaver-pingpong/kodi-screensaver-pingpong.hash | 2 +-
 .../kodi-screensaver-pingpong/kodi-screensaver-pingpong.mk   | 4 ++--
 package/kodi-screensaver-pyro/Config.in                      | 2 +-
 package/kodi-screensaver-pyro/kodi-screensaver-pyro.hash     | 2 +-
 package/kodi-screensaver-pyro/kodi-screensaver-pyro.mk       | 4 ++--
 package/kodi-screensaver-stars/Config.in                     | 2 +-
 package/kodi-screensaver-stars/kodi-screensaver-stars.hash   | 2 +-
 package/kodi-screensaver-stars/kodi-screensaver-stars.mk     | 4 ++--
 26 files changed, 34 insertions(+), 35 deletions(-)

diff --git a/package/kodi-screensaver-asterwave/Config.in b/package/kodi-screensaver-asterwave/Config.in
index bd5db738ca..b5e80cc535 100644
--- a/package/kodi-screensaver-asterwave/Config.in
+++ b/package/kodi-screensaver-asterwave/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_KODI_SCREENSAVER_ASTERWAVE
 	help
 	  AsterWave screensaver for Kodi
 
-	  https://github.com/notspiff/screensaver.asterwave
+	  https://github.com/xbmc/screensaver.asterwave
 
 comment "kodi-screensaver-asterwave needs OpenGL"
 	depends on !BR2_PACKAGE_HAS_LIBGL
diff --git a/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.hash b/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.hash
index 40c8f9b28c..5d1a8fb5de 100644
--- a/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.hash
+++ b/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 48cd459b60b2407b8bae9107760a013d04ee29e00fddbce9550291896d42ef64  kodi-screensaver-asterwave-1.1.0.tar.gz
+sha256 61bf4f9272031b4f20c134a224c7c58ed7a686d884b917bddfaf237cfd48fb57  kodi-screensaver-asterwave-e1ef55b501d6d2dd064559726937549857f6b77d.tar.gz
diff --git a/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.mk b/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.mk
index 8f6d583829..b8c35eefeb 100644
--- a/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.mk
+++ b/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_ASTERWAVE_VERSION = 1.1.0
-KODI_SCREENSAVER_ASTERWAVE_SITE = $(call github,notspiff,screensaver.asterwave,v$(KODI_SCREENSAVER_ASTERWAVE_VERSION))
+KODI_SCREENSAVER_ASTERWAVE_VERSION = e1ef55b501d6d2dd064559726937549857f6b77d
+KODI_SCREENSAVER_ASTERWAVE_SITE = $(call github,xbmc,screensaver.asterwave,$(KODI_SCREENSAVER_ASTERWAVE_VERSION))
 KODI_SCREENSAVER_ASTERWAVE_DEPENDENCIES = kodi libglu libsoil
 
 $(eval $(cmake-package))
diff --git a/package/kodi-screensaver-biogenesis/Config.in b/package/kodi-screensaver-biogenesis/Config.in
index cdc2d91951..9703e9091b 100644
--- a/package/kodi-screensaver-biogenesis/Config.in
+++ b/package/kodi-screensaver-biogenesis/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_KODI_SCREENSAVER_BIOGENESIS
 	help
 	  BioGenesis screensaver for Kodi
 
-	  https://github.com/notspiff/screensaver.biogenesis
+	  https://github.com/xbmc/screensaver.biogenesis
 
 comment "kodi-screensaver-biogenesis needs OpenGL"
 	depends on !BR2_PACKAGE_HAS_LIBGL
diff --git a/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.hash b/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.hash
index 81b57e4265..16a5de1da8 100644
--- a/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.hash
+++ b/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 b97dc804261b19df725e0a9f1af3be6903226ae616fcac170f7b9c1a67bf811a  kodi-screensaver-biogenesis-1.1.0.tar.gz
+sha256 564c12587c1ffe5d020d275aa68b6a083ea0d59f2a892c3a7598cd63243a18e4  kodi-screensaver-biogenesis-5113a874d5629d84a67b84951ca492a21cce2000.tar.gz
diff --git a/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.mk b/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.mk
index fe0d284448..af3fc1f0c7 100644
--- a/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.mk
+++ b/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_BIOGENESIS_VERSION = 1.1.0
-KODI_SCREENSAVER_BIOGENESIS_SITE = $(call github,notspiff,screensaver.biogenesis,v$(KODI_SCREENSAVER_BIOGENESIS_VERSION))
+KODI_SCREENSAVER_BIOGENESIS_VERSION = 5113a874d5629d84a67b84951ca492a21cce2000
+KODI_SCREENSAVER_BIOGENESIS_SITE = $(call github,xbmc,screensaver.biogenesis,$(KODI_SCREENSAVER_BIOGENESIS_VERSION))
 KODI_SCREENSAVER_BIOGENESIS_LICENSE = GPL-2.0+
 KODI_SCREENSAVER_BIOGENESIS_LICENSE_FILES = src/Life.cpp
 KODI_SCREENSAVER_BIOGENESIS_DEPENDENCIES = kodi
diff --git a/package/kodi-screensaver-cpblobs/Config.in b/package/kodi-screensaver-cpblobs/Config.in
index e80ea0ebb3..4e0003bddc 100644
--- a/package/kodi-screensaver-cpblobs/Config.in
+++ b/package/kodi-screensaver-cpblobs/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_KODI_SCREENSAVER_CPBLOBS
 	help
 	  CpBlobs screensaver for Kodi
 
-	  https://github.com/notspiff/screensaver.cpblobs
+	  https://github.com/xbmc/screensaver.cpblobs
 
 comment "kodi-screensaver-cpblobs needs OpenGL"
 	depends on !BR2_PACKAGE_HAS_LIBGL
diff --git a/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.hash b/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.hash
index bc1228c55f..88fdca45c8 100644
--- a/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.hash
+++ b/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 1ca5e4de61251de7e420dc6ded3156960f9bb52ed7ff0243f305768147d470e3  kodi-screensaver-cpblobs-1.1.0.tar.gz
+sha256 6d7a0036a118778117d1d1ebeca96903e66f49a166848a1c884aaf3ed65fdd46  kodi-screensaver-cpblobs-e65b34fb75ac258a8563169b9c00ebf739dbc7ca.tar.gz
diff --git a/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.mk b/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.mk
index 09dc6c16fc..bb6811dab3 100644
--- a/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.mk
+++ b/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_CPBLOBS_VERSION = 1.1.0
-KODI_SCREENSAVER_CPBLOBS_SITE = $(call github,notspiff,screensaver.cpblobs,v$(KODI_SCREENSAVER_CPBLOBS_VERSION))
+KODI_SCREENSAVER_CPBLOBS_VERSION = e65b34fb75ac258a8563169b9c00ebf739dbc7ca
+KODI_SCREENSAVER_CPBLOBS_SITE = $(call github,xbmc,screensaver.cpblobs,$(KODI_SCREENSAVER_CPBLOBS_VERSION))
 KODI_SCREENSAVER_CPBLOBS_LICENSE = GPL-2.0
 KODI_SCREENSAVER_CPBLOBS_LICENSE_FILES = LICENSE
 KODI_SCREENSAVER_CPBLOBS_DEPENDENCIES = kodi libsoil
diff --git a/package/kodi-screensaver-crystalmorph/kodi-screensaver-crystalmorph.hash b/package/kodi-screensaver-crystalmorph/kodi-screensaver-crystalmorph.hash
index ff9d6d0244..6442b4d5bc 100644
--- a/package/kodi-screensaver-crystalmorph/kodi-screensaver-crystalmorph.hash
+++ b/package/kodi-screensaver-crystalmorph/kodi-screensaver-crystalmorph.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 a8400c8d8be0fe0ba616ad1d0ef5fd798980a9dd4e38ef88bee9bf74a06975d5  kodi-screensaver-crystalmorph-1dc9bf3f57cc2c5345efec64d9499c3bf8f7bd6e.tar.gz
+sha256 d8ed548222f1118964104fefc8ac3056dfe6c9d2ee35cd7c8355c9ea9fcaffc5  kodi-screensaver-crystalmorph-4439c84c38abf889e19a1863e745942c0d7f8203.tar.gz
diff --git a/package/kodi-screensaver-crystalmorph/kodi-screensaver-crystalmorph.mk b/package/kodi-screensaver-crystalmorph/kodi-screensaver-crystalmorph.mk
index 83629e41ca..35642d5580 100644
--- a/package/kodi-screensaver-crystalmorph/kodi-screensaver-crystalmorph.mk
+++ b/package/kodi-screensaver-crystalmorph/kodi-screensaver-crystalmorph.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_CRYSTALMORPH_VERSION = 1dc9bf3f57cc2c5345efec64d9499c3bf8f7bd6e
+KODI_SCREENSAVER_CRYSTALMORPH_VERSION = 4439c84c38abf889e19a1863e745942c0d7f8203
 KODI_SCREENSAVER_CRYSTALMORPH_SITE = $(call github,notspiff,screensaver.crystalmorph,$(KODI_SCREENSAVER_CRYSTALMORPH_VERSION))
 KODI_SCREENSAVER_CRYSTALMORPH_LICENSE = GPL-2.0+
 KODI_SCREENSAVER_CRYSTALMORPH_LICENSE_FILES = src/Fractal.cpp
diff --git a/package/kodi-screensaver-greynetic/Config.in b/package/kodi-screensaver-greynetic/Config.in
index ce636b8271..685feb8872 100644
--- a/package/kodi-screensaver-greynetic/Config.in
+++ b/package/kodi-screensaver-greynetic/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_KODI_SCREENSAVER_GREYNETIC
 	help
 	  Greynetic screensaver for Kodi
 
-	  https://github.com/notspiff/screensaver.greynetic
+	  https://github.com/xbmc/screensaver.greynetic
 
 comment "kodi-screensaver-greynetic needs OpenGL"
 	depends on !BR2_PACKAGE_HAS_LIBGL
diff --git a/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.hash b/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.hash
index 5ca0f66d58..19b035899b 100644
--- a/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.hash
+++ b/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 55a77487f02d282e8431e64de3cb263489037c2374a4b9cdd7aa189093e7621f  kodi-screensaver-greynetic-1.1.0.tar.gz
+sha256 34f729e8b9150b76a8a84682fb24c2b85c1fc8a231b96aac6f18ccedb138a175  kodi-screensaver-greynetic-8fdddc0440fcfd8a82e428799cecb2afb938c231.tar.gz
diff --git a/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.mk b/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.mk
index ef95dc7505..7853a0cef6 100644
--- a/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.mk
+++ b/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_GREYNETIC_VERSION = 1.1.0
-KODI_SCREENSAVER_GREYNETIC_SITE = $(call github,notspiff,screensaver.greynetic,v$(KODI_SCREENSAVER_GREYNETIC_VERSION))
+KODI_SCREENSAVER_GREYNETIC_VERSION = 8fdddc0440fcfd8a82e428799cecb2afb938c231
+KODI_SCREENSAVER_GREYNETIC_SITE = $(call github,xbmc,screensaver.greynetic,$(KODI_SCREENSAVER_GREYNETIC_VERSION))
 KODI_SCREENSAVER_GREYNETIC_LICENSE = GPL-2.0+
 KODI_SCREENSAVER_GREYNETIC_LICENSE_FILES = src/GreyNetic.cpp
 KODI_SCREENSAVER_GREYNETIC_DEPENDENCIES = kodi
diff --git a/package/kodi-screensaver-matrixtrails/Config.in b/package/kodi-screensaver-matrixtrails/Config.in
index e2d3f71acf..270a51c9f4 100644
--- a/package/kodi-screensaver-matrixtrails/Config.in
+++ b/package/kodi-screensaver-matrixtrails/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_KODI_SCREENSAVER_MATRIXTRAILS
 	help
 	  Matrix trails screensaver for Kodi
 
-	  https://github.com/notspiff/screensaver.matrixtrails
+	  https://github.com/xbmc/screensaver.matrixtrails
 
 comment "kodi-screensaver-matrixtrails needs OpenGL"
 	depends on !BR2_PACKAGE_HAS_LIBGL
diff --git a/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.hash b/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.hash
index 6ba6d542b0..2b5656f869 100644
--- a/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.hash
+++ b/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 2b531f51b86536df2a5268547e3d1b7fabc8a1dc930808b46685afcc455bb8fa  kodi-screensaver-matrixtrails-1.1.0.tar.gz
+sha256 8ec43505fe1ae3981c1594bf75f0ac681c804fc0016a285b68a91204dc0d0ac2  kodi-screensaver-matrixtrails-309ccc21e8a441682736ac3486c26a14d11830b4.tar.gz
diff --git a/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.mk b/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.mk
index ff64ccb17f..8591a4fdc2 100644
--- a/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.mk
+++ b/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.mk
@@ -4,11 +4,10 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_MATRIXTRAILS_VERSION = 1.1.0
-KODI_SCREENSAVER_MATRIXTRAILS_SITE = $(call github,notspiff,screensaver.matrixtrails,v$(KODI_SCREENSAVER_MATRIXTRAILS_VERSION))
+KODI_SCREENSAVER_MATRIXTRAILS_VERSION = 309ccc21e8a441682736ac3486c26a14d11830b4
+KODI_SCREENSAVER_MATRIXTRAILS_SITE = $(call github,xbmc,screensaver.matrixtrails,$(KODI_SCREENSAVER_MATRIXTRAILS_VERSION))
 KODI_SCREENSAVER_MATRIXTRAILS_LICENSE = GPL-2.0+
 KODI_SCREENSAVER_MATRIXTRAILS_LICENSE_FILES = src/matrixtrails.cpp
-
 KODI_SCREENSAVER_MATRIXTRAILS_DEPENDENCIES = kodi libsoil
 
 $(eval $(cmake-package))
diff --git a/package/kodi-screensaver-pingpong/Config.in b/package/kodi-screensaver-pingpong/Config.in
index 3971052b94..bc76fffd6e 100644
--- a/package/kodi-screensaver-pingpong/Config.in
+++ b/package/kodi-screensaver-pingpong/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_KODI_SCREENSAVER_PINGPONG
 	help
 	  Ping-pong screensaver for Kodi
 
-	  https://github.com/notspiff/screensaver.pingpong
+	  https://github.com/xbmc/screensaver.pingpong
 
 comment "kodi-screensaver-pingpong needs OpenGL"
 	depends on !BR2_PACKAGE_HAS_LIBGL
diff --git a/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.hash b/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.hash
index 12049cf989..ac35ac89bc 100644
--- a/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.hash
+++ b/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 99e9cbc3815d4e3dad964b2d233dbf6acc4416121398f7fca75f3811cb04d88f  kodi-screensaver-pingpong-1.1.0.tar.gz
+sha256 1d36660f66a2cb1dfc6dca9e2b1ca40470c948870552b7d0698c557c9d082ed9  kodi-screensaver-pingpong-4b41dde7885853c7464d14bee4ac3f32835cdd8f.tar.gz
diff --git a/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.mk b/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.mk
index f8830f24fd..097540c026 100644
--- a/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.mk
+++ b/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_PINGPONG_VERSION = 1.1.0
-KODI_SCREENSAVER_PINGPONG_SITE = $(call github,notspiff,screensaver.pingpong,v$(KODI_SCREENSAVER_PINGPONG_VERSION))
+KODI_SCREENSAVER_PINGPONG_VERSION = 4b41dde7885853c7464d14bee4ac3f32835cdd8f
+KODI_SCREENSAVER_PINGPONG_SITE = $(call github,xbmc,screensaver.pingpong,$(KODI_SCREENSAVER_PINGPONG_VERSION))
 KODI_SCREENSAVER_PINGPONG_LICENSE = GPL-2.0+
 KODI_SCREENSAVER_PINGPONG_LICENSE_FILES = src/readme.txt
 KODI_SCREENSAVER_PINGPONG_DEPENDENCIES = kodi
diff --git a/package/kodi-screensaver-pyro/Config.in b/package/kodi-screensaver-pyro/Config.in
index 982542d5a3..e2d1988ec5 100644
--- a/package/kodi-screensaver-pyro/Config.in
+++ b/package/kodi-screensaver-pyro/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_KODI_SCREENSAVER_PYRO
 	help
 	  Pyro screensaver for Kodi
 
-	  https://github.com/notspiff/screensaver.pyro
+	  https://github.com/xbmc/screensaver.pyro
 
 comment "kodi-screensaver-pyro needs OpenGL"
 	depends on !BR2_PACKAGE_HAS_LIBGL
diff --git a/package/kodi-screensaver-pyro/kodi-screensaver-pyro.hash b/package/kodi-screensaver-pyro/kodi-screensaver-pyro.hash
index be29ca3bef..bb1f59b890 100644
--- a/package/kodi-screensaver-pyro/kodi-screensaver-pyro.hash
+++ b/package/kodi-screensaver-pyro/kodi-screensaver-pyro.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 0dcaed581ffe5595878338a8c9c55bd7acc87e03d30a4d3ca4a03c3f8db66ddc  kodi-screensaver-pyro-1.1.0.tar.gz
+sha256 c28518e43f3d30899effabb5dd6b338323dc799d94fd9183b84f5066c34ed214  kodi-screensaver-pyro-300c22627befc37b967f16655a9a380955341cbc.tar.gz
diff --git a/package/kodi-screensaver-pyro/kodi-screensaver-pyro.mk b/package/kodi-screensaver-pyro/kodi-screensaver-pyro.mk
index 4d6b1f72d3..3602737c46 100644
--- a/package/kodi-screensaver-pyro/kodi-screensaver-pyro.mk
+++ b/package/kodi-screensaver-pyro/kodi-screensaver-pyro.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_PYRO_VERSION = 1.1.0
-KODI_SCREENSAVER_PYRO_SITE = $(call github,notspiff,screensaver.pyro,v$(KODI_SCREENSAVER_PYRO_VERSION))
+KODI_SCREENSAVER_PYRO_VERSION = 300c22627befc37b967f16655a9a380955341cbc
+KODI_SCREENSAVER_PYRO_SITE = $(call github,xbmc,screensaver.pyro,$(KODI_SCREENSAVER_PYRO_VERSION))
 KODI_SCREENSAVER_PYRO_LICENSE = GPL-2.0+
 KODI_SCREENSAVER_PYRO_LICENSE_FILES = src/Pyro.cpp
 KODI_SCREENSAVER_PYRO_DEPENDENCIES = kodi
diff --git a/package/kodi-screensaver-stars/Config.in b/package/kodi-screensaver-stars/Config.in
index bcfb47b2cc..a2e435c0f6 100644
--- a/package/kodi-screensaver-stars/Config.in
+++ b/package/kodi-screensaver-stars/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_KODI_SCREENSAVER_STARS
 	help
 	  Starfield screensaver for Kodi
 
-	  https://github.com/notspiff/screensaver.stars
+	  https://github.com/xbmc/screensaver.stars
 
 comment "kodi-screensaver-stars needs OpenGL"
 	depends on !BR2_PACKAGE_HAS_LIBGL
diff --git a/package/kodi-screensaver-stars/kodi-screensaver-stars.hash b/package/kodi-screensaver-stars/kodi-screensaver-stars.hash
index 63335742b2..74ff6a2db6 100644
--- a/package/kodi-screensaver-stars/kodi-screensaver-stars.hash
+++ b/package/kodi-screensaver-stars/kodi-screensaver-stars.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 525caac94fd2bd858daf9fa7719eea4181c168e5c692bb896689625bf4437d32  kodi-screensaver-stars-1.1.0.tar.gz
+sha256 4d34665015a1babc2442f5278b8ca071ee767987c1ff7372de310643a7051856  kodi-screensaver-stars-3f7c42a246d658b5f8559a94bcba8853abe7a81e.tar.gz
diff --git a/package/kodi-screensaver-stars/kodi-screensaver-stars.mk b/package/kodi-screensaver-stars/kodi-screensaver-stars.mk
index 19e9db7194..604dce8d4f 100644
--- a/package/kodi-screensaver-stars/kodi-screensaver-stars.mk
+++ b/package/kodi-screensaver-stars/kodi-screensaver-stars.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_STARS_VERSION = 1.1.0
-KODI_SCREENSAVER_STARS_SITE = $(call github,notspiff,screensaver.stars,v$(KODI_SCREENSAVER_STARS_VERSION))
+KODI_SCREENSAVER_STARS_VERSION = 3f7c42a246d658b5f8559a94bcba8853abe7a81e
+KODI_SCREENSAVER_STARS_SITE = $(call github,xbmc,screensaver.stars,$(KODI_SCREENSAVER_STARS_VERSION))
 KODI_SCREENSAVER_STARS_LICENSE = GPL-2.0+
 KODI_SCREENSAVER_STARS_LICENSE_FILES = src/StarField.cpp
 KODI_SCREENSAVER_STARS_DEPENDENCIES = kodi
-- 
2.20.1
