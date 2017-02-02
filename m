From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu,  2 Feb 2017 08:27:47 +0100
Subject: [Buildroot] [PATCH 29/38] package/kodi-screensaver-*: mass version
	bump
In-Reply-To: <20170202072756.6624-1-bernd.kuhls@t-online.de>
References: <20170202072756.6624-1-bernd.kuhls@t-online.de>
Message-ID: <20170202072756.6624-29-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.hash      | 2 +-
 package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.mk        | 2 +-
 package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.hash      | 2 +-
 package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.mk        | 2 +-
 package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.hash    | 2 +-
 package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.mk      | 2 +-
 package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.hash          | 2 +-
 package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.mk            | 2 +-
 .../kodi-screensaver-crystalmorph/kodi-screensaver-crystalmorph.hash    | 2 +-
 package/kodi-screensaver-crystalmorph/kodi-screensaver-crystalmorph.mk  | 2 +-
 package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.hash      | 2 +-
 package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.mk        | 2 +-
 .../kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.hash    | 2 +-
 package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.mk  | 2 +-
 package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.hash        | 2 +-
 package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.mk          | 2 +-
 package/kodi-screensaver-planestate/kodi-screensaver-planestate.hash    | 2 +-
 package/kodi-screensaver-planestate/kodi-screensaver-planestate.mk      | 2 +-
 package/kodi-screensaver-pyro/kodi-screensaver-pyro.hash                | 2 +-
 package/kodi-screensaver-pyro/kodi-screensaver-pyro.mk                  | 2 +-
 package/kodi-screensaver-stars/kodi-screensaver-stars.hash              | 2 +-
 package/kodi-screensaver-stars/kodi-screensaver-stars.mk                | 2 +-
 22 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.hash b/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.hash
index a70f1b0a5..7d105beeb 100644
--- a/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.hash
+++ b/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 b76b9ba122cebddc7c201b088d93e86fde8fc76e7e9f167ff3e43c3390088f3f kodi-screensaver-asteroids-c7ae05f1881b9abda6a1ac6beaca8d64a164c4fa.tar.gz
+sha256 2e072e6aad12f707dec1e70b7df26c590bb41fed8880dcfdbe6c99949b7e287a  kodi-screensaver-asteroids-v1.1.2.tar.gz
diff --git a/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.mk b/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.mk
index 1af1f2ed6..b753d7532 100644
--- a/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.mk
+++ b/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_ASTEROIDS_VERSION = c7ae05f1881b9abda6a1ac6beaca8d64a164c4fa
+KODI_SCREENSAVER_ASTEROIDS_VERSION = v1.1.2
 KODI_SCREENSAVER_ASTEROIDS_SITE = $(call github,notspiff,screensaver.asteroids,$(KODI_SCREENSAVER_ASTEROIDS_VERSION))
 KODI_SCREENSAVER_ASTEROIDS_LICENSE = GPLv2+
 KODI_SCREENSAVER_ASTEROIDS_LICENSE_FILES = src/main.cpp
diff --git a/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.hash b/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.hash
index 5f04031af..f8f6d7b2f 100644
--- a/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.hash
+++ b/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 6bf9367889c4ddece7e0c3720762d41bb0b22fc9ab28d1c8759edb1f77487ecd kodi-screensaver-asterwave-0dc2c48dadb100954eef823e7e3a5f502ce65b1e.tar.gz
+sha256 48cd459b60b2407b8bae9107760a013d04ee29e00fddbce9550291896d42ef64  kodi-screensaver-asterwave-v1.1.0.tar.gz
diff --git a/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.mk b/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.mk
index 7c718ccd8..b8c3a2adf 100644
--- a/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.mk
+++ b/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_ASTERWAVE_VERSION = 0dc2c48dadb100954eef823e7e3a5f502ce65b1e
+KODI_SCREENSAVER_ASTERWAVE_VERSION = v1.1.0
 KODI_SCREENSAVER_ASTERWAVE_SITE = $(call github,notspiff,screensaver.asterwave,$(KODI_SCREENSAVER_ASTERWAVE_VERSION))
 KODI_SCREENSAVER_ASTERWAVE_DEPENDENCIES = kodi libglu libsoil
 
diff --git a/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.hash b/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.hash
index 6fc273d18..63b9d3c93 100644
--- a/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.hash
+++ b/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 25e497c6843a7d933d1e4736e8dcb671bc9881328d5e27349dd0b25cb9be07eb kodi-screensaver-biogenesis-39928eef56ed639085d401dd97bf18f44b1f3e8b.tar.gz
+sha256 b97dc804261b19df725e0a9f1af3be6903226ae616fcac170f7b9c1a67bf811a  kodi-screensaver-biogenesis-v1.1.0.tar.gz
diff --git a/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.mk b/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.mk
index dce6968d2..8ca578fcb 100644
--- a/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.mk
+++ b/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_BIOGENESIS_VERSION = 39928eef56ed639085d401dd97bf18f44b1f3e8b
+KODI_SCREENSAVER_BIOGENESIS_VERSION = v1.1.0
 KODI_SCREENSAVER_BIOGENESIS_SITE = $(call github,notspiff,screensaver.biogenesis,$(KODI_SCREENSAVER_BIOGENESIS_VERSION))
 KODI_SCREENSAVER_BIOGENESIS_LICENSE = GPLv2+
 KODI_SCREENSAVER_BIOGENESIS_LICENSE_FILES = src/Life.cpp
diff --git a/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.hash b/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.hash
index ebf19d9de..21443d82b 100644
--- a/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.hash
+++ b/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 c2d19c33aff73b99cbf51f943b62e58b2b6233dcf1d789ae8f73e92fa96f07bc kodi-screensaver-cpblobs-87a3abfbe6e4fd1089548eab77a84902d0e1af60.tar.gz
+sha256 1ca5e4de61251de7e420dc6ded3156960f9bb52ed7ff0243f305768147d470e3  kodi-screensaver-cpblobs-v1.1.0.tar.gz
diff --git a/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.mk b/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.mk
index bf67ea089..14c47ad5e 100644
--- a/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.mk
+++ b/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_CPBLOBS_VERSION = 87a3abfbe6e4fd1089548eab77a84902d0e1af60
+KODI_SCREENSAVER_CPBLOBS_VERSION = v1.1.0
 KODI_SCREENSAVER_CPBLOBS_SITE = $(call github,notspiff,screensaver.cpblobs,$(KODI_SCREENSAVER_CPBLOBS_VERSION))
 KODI_SCREENSAVER_CPBLOBS_LICENSE = GPLv2
 KODI_SCREENSAVER_CPBLOBS_LICENSE_FILES = LICENSE
diff --git a/package/kodi-screensaver-crystalmorph/kodi-screensaver-crystalmorph.hash b/package/kodi-screensaver-crystalmorph/kodi-screensaver-crystalmorph.hash
index 01183d74f..ff9d6d024 100644
--- a/package/kodi-screensaver-crystalmorph/kodi-screensaver-crystalmorph.hash
+++ b/package/kodi-screensaver-crystalmorph/kodi-screensaver-crystalmorph.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 680e9354adcb7048b5c2b55b3c49cf37cea0e12e6564018cd694feeb253c90dd kodi-screensaver-crystalmorph-2e7c10e3543f5aaab6fd2f5aa9d05b976a43ba68.tar.gz
+sha256 a8400c8d8be0fe0ba616ad1d0ef5fd798980a9dd4e38ef88bee9bf74a06975d5  kodi-screensaver-crystalmorph-1dc9bf3f57cc2c5345efec64d9499c3bf8f7bd6e.tar.gz
diff --git a/package/kodi-screensaver-crystalmorph/kodi-screensaver-crystalmorph.mk b/package/kodi-screensaver-crystalmorph/kodi-screensaver-crystalmorph.mk
index 49ddb43c3..c6471db90 100644
--- a/package/kodi-screensaver-crystalmorph/kodi-screensaver-crystalmorph.mk
+++ b/package/kodi-screensaver-crystalmorph/kodi-screensaver-crystalmorph.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_CRYSTALMORPH_VERSION = 2e7c10e3543f5aaab6fd2f5aa9d05b976a43ba68
+KODI_SCREENSAVER_CRYSTALMORPH_VERSION = 1dc9bf3f57cc2c5345efec64d9499c3bf8f7bd6e
 KODI_SCREENSAVER_CRYSTALMORPH_SITE = $(call github,notspiff,screensaver.crystalmorph,$(KODI_SCREENSAVER_CRYSTALMORPH_VERSION))
 KODI_SCREENSAVER_CRYSTALMORPH_LICENSE = GPLv2+
 KODI_SCREENSAVER_CRYSTALMORPH_LICENSE_FILES = src/Fractal.cpp
diff --git a/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.hash b/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.hash
index 93394532e..212aee663 100644
--- a/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.hash
+++ b/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 fc114434db18a885fda30ac6b82fe82ec1d5ed97e2ff6414b4927487da684871 kodi-screensaver-greynetic-80e850eb3cbc7ee2c937fcab666dc45d2b2ee0bb.tar.gz
+sha256 55a77487f02d282e8431e64de3cb263489037c2374a4b9cdd7aa189093e7621f  kodi-screensaver-greynetic-v1.1.0.tar.gz
diff --git a/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.mk b/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.mk
index 9773bac1c..baad4a3fa 100644
--- a/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.mk
+++ b/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_GREYNETIC_VERSION = 80e850eb3cbc7ee2c937fcab666dc45d2b2ee0bb
+KODI_SCREENSAVER_GREYNETIC_VERSION = v1.1.0
 KODI_SCREENSAVER_GREYNETIC_SITE = $(call github,notspiff,screensaver.greynetic,$(KODI_SCREENSAVER_GREYNETIC_VERSION))
 KODI_SCREENSAVER_GREYNETIC_LICENSE = GPLv2+
 KODI_SCREENSAVER_GREYNETIC_LICENSE_FILES = src/GreyNetic.cpp
diff --git a/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.hash b/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.hash
index 5ae2459cf..55deabea1 100644
--- a/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.hash
+++ b/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 91990a29072cf85f4b9253a16a362d83fdfcc7595de796d982a189aa8618555c  kodi-screensaver-matrixtrails-16057e7195f930109f0a4aea999296ca315700e5.tar.gz
+sha256 2b531f51b86536df2a5268547e3d1b7fabc8a1dc930808b46685afcc455bb8fa  kodi-screensaver-matrixtrails-v1.1.0.tar.gz
diff --git a/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.mk b/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.mk
index 5ecacdf56..1da96695a 100644
--- a/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.mk
+++ b/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_MATRIXTRAILS_VERSION = 16057e7195f930109f0a4aea999296ca315700e5
+KODI_SCREENSAVER_MATRIXTRAILS_VERSION = v1.1.0
 KODI_SCREENSAVER_MATRIXTRAILS_SITE = $(call github,notspiff,screensaver.matrixtrails,$(KODI_SCREENSAVER_MATRIXTRAILS_VERSION))
 KODI_SCREENSAVER_MATRIXTRAILS_LICENSE = GPLv2+
 KODI_SCREENSAVER_MATRIXTRAILS_LICENSE_FILES = src/matrixtrails.cpp
diff --git a/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.hash b/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.hash
index 79d4dd40a..aad8314bd 100644
--- a/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.hash
+++ b/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 59a5cdfa6387760205efabcd91bc64fdc92f103c8f213b650018160f6c1a691c kodi-screensaver-pingpong-5c7cf6fd9f9ff1468f620bb891e66bebd3a5fe17.tar.gz
+sha256 99e9cbc3815d4e3dad964b2d233dbf6acc4416121398f7fca75f3811cb04d88f  kodi-screensaver-pingpong-v1.1.0.tar.gz
diff --git a/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.mk b/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.mk
index 2adf9601f..71395b9b8 100644
--- a/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.mk
+++ b/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_PINGPONG_VERSION = 5c7cf6fd9f9ff1468f620bb891e66bebd3a5fe17
+KODI_SCREENSAVER_PINGPONG_VERSION = v1.1.0
 KODI_SCREENSAVER_PINGPONG_SITE = $(call github,notspiff,screensaver.pingpong,$(KODI_SCREENSAVER_PINGPONG_VERSION))
 KODI_SCREENSAVER_PINGPONG_LICENSE = GPLv2+
 KODI_SCREENSAVER_PINGPONG_LICENSE_FILES = src/readme.txt
diff --git a/package/kodi-screensaver-planestate/kodi-screensaver-planestate.hash b/package/kodi-screensaver-planestate/kodi-screensaver-planestate.hash
index 9aea92925..de5f6cf5d 100644
--- a/package/kodi-screensaver-planestate/kodi-screensaver-planestate.hash
+++ b/package/kodi-screensaver-planestate/kodi-screensaver-planestate.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 13ce2881f8eaf9936691cf66b9f3471a718ae87249d62ade55174201873fb496 kodi-screensaver-planestate-95b6d1ec72f37bcd16cf8e5d49806193dba883f0.tar.gz
+sha256 6059630e56bd022a27f73fe7c94fcf6a66792e7bb10f54a7893f536c23b95b99  kodi-screensaver-planestate-5341406dd05439a1a0245ab3f6d1a8964461d0e5.tar.gz
diff --git a/package/kodi-screensaver-planestate/kodi-screensaver-planestate.mk b/package/kodi-screensaver-planestate/kodi-screensaver-planestate.mk
index 38885c5cb..0e90ffc5d 100644
--- a/package/kodi-screensaver-planestate/kodi-screensaver-planestate.mk
+++ b/package/kodi-screensaver-planestate/kodi-screensaver-planestate.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_PLANESTATE_VERSION = 95b6d1ec72f37bcd16cf8e5d49806193dba883f0
+KODI_SCREENSAVER_PLANESTATE_VERSION = 5341406dd05439a1a0245ab3f6d1a8964461d0e5
 KODI_SCREENSAVER_PLANESTATE_SITE = $(call github,notspiff,screensaver.planestate,$(KODI_SCREENSAVER_PLANESTATE_VERSION))
 KODI_SCREENSAVER_PLANESTATE_DEPENDENCIES = kodi libsoil
 
diff --git a/package/kodi-screensaver-pyro/kodi-screensaver-pyro.hash b/package/kodi-screensaver-pyro/kodi-screensaver-pyro.hash
index c79e3f5f1..a16ee8e09 100644
--- a/package/kodi-screensaver-pyro/kodi-screensaver-pyro.hash
+++ b/package/kodi-screensaver-pyro/kodi-screensaver-pyro.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 951bc3259407b7f21183c34556b1efc4c40bfafec61008cd543f382f67466184 kodi-screensaver-pyro-2476b77d9954980a27e07eb8eb0727e2af226351.tar.gz
+sha256 0dcaed581ffe5595878338a8c9c55bd7acc87e03d30a4d3ca4a03c3f8db66ddc  kodi-screensaver-pyro-v1.1.0.tar.gz
diff --git a/package/kodi-screensaver-pyro/kodi-screensaver-pyro.mk b/package/kodi-screensaver-pyro/kodi-screensaver-pyro.mk
index f90405275..7ed9acfb8 100644
--- a/package/kodi-screensaver-pyro/kodi-screensaver-pyro.mk
+++ b/package/kodi-screensaver-pyro/kodi-screensaver-pyro.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_PYRO_VERSION = 2476b77d9954980a27e07eb8eb0727e2af226351
+KODI_SCREENSAVER_PYRO_VERSION = v1.1.0
 KODI_SCREENSAVER_PYRO_SITE = $(call github,notspiff,screensaver.pyro,$(KODI_SCREENSAVER_PYRO_VERSION))
 KODI_SCREENSAVER_PYRO_LICENSE = GPLv2+
 KODI_SCREENSAVER_PYRO_LICENSE_FILES = src/Pyro.cpp
diff --git a/package/kodi-screensaver-stars/kodi-screensaver-stars.hash b/package/kodi-screensaver-stars/kodi-screensaver-stars.hash
index 107ada470..7f8c9aefd 100644
--- a/package/kodi-screensaver-stars/kodi-screensaver-stars.hash
+++ b/package/kodi-screensaver-stars/kodi-screensaver-stars.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 79633afcdccf5df31c98d2144bd23086d691e7749255b4295b183b535d9b7abf kodi-screensaver-stars-28bf79d4dce040e9fbdc25f51007e13950cab937.tar.gz
+sha256 525caac94fd2bd858daf9fa7719eea4181c168e5c692bb896689625bf4437d32  kodi-screensaver-stars-v1.1.0.tar.gz
diff --git a/package/kodi-screensaver-stars/kodi-screensaver-stars.mk b/package/kodi-screensaver-stars/kodi-screensaver-stars.mk
index b5b5206d1..b49377220 100644
--- a/package/kodi-screensaver-stars/kodi-screensaver-stars.mk
+++ b/package/kodi-screensaver-stars/kodi-screensaver-stars.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_STARS_VERSION = 28bf79d4dce040e9fbdc25f51007e13950cab937
+KODI_SCREENSAVER_STARS_VERSION = v1.1.0
 KODI_SCREENSAVER_STARS_SITE = $(call github,notspiff,screensaver.stars,$(KODI_SCREENSAVER_STARS_VERSION))
 KODI_SCREENSAVER_STARS_LICENSE = GPLv2+
 KODI_SCREENSAVER_STARS_LICENSE_FILES = src/StarField.cpp
-- 
2.11.0
