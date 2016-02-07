From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  7 Feb 2016 17:02:58 +0100
Subject: [Buildroot] [PATCH 14/28] package/kodi-screensaver/visualisation-*:
	mass version bump
In-Reply-To: <1454860992-25114-1-git-send-email-bernd.kuhls@t-online.de>
References: <1454860992-25114-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1454860992-25114-15-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.mk   | 2 +-
 package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.mk | 2 +-
 package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.mk   | 2 +-
 package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.mk     | 2 +-
 package/kodi-screensaver-pyro/kodi-screensaver-pyro.mk             | 2 +-
 package/kodi-screensaver-stars/kodi-screensaver-stars.mk           | 2 +-
 package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.mk | 2 +-
 package/kodi-visualisation-waveform/kodi-visualisation-waveform.mk | 2 +-
 8 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.mk b/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.mk
index dce8fb6..1af1f2e 100644
--- a/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.mk
+++ b/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_ASTEROIDS_VERSION = d4c2e3b499544ef55be364b34e5569d9c31c9615
+KODI_SCREENSAVER_ASTEROIDS_VERSION = c7ae05f1881b9abda6a1ac6beaca8d64a164c4fa
 KODI_SCREENSAVER_ASTEROIDS_SITE = $(call github,notspiff,screensaver.asteroids,$(KODI_SCREENSAVER_ASTEROIDS_VERSION))
 KODI_SCREENSAVER_ASTEROIDS_LICENSE = GPLv2+
 KODI_SCREENSAVER_ASTEROIDS_LICENSE_FILES = src/main.cpp
diff --git a/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.mk b/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.mk
index 728383f..dce6968 100644
--- a/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.mk
+++ b/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_BIOGENESIS_VERSION = 2eccbd4e46320de03fde6731c560660659fd34d7
+KODI_SCREENSAVER_BIOGENESIS_VERSION = 39928eef56ed639085d401dd97bf18f44b1f3e8b
 KODI_SCREENSAVER_BIOGENESIS_SITE = $(call github,notspiff,screensaver.biogenesis,$(KODI_SCREENSAVER_BIOGENESIS_VERSION))
 KODI_SCREENSAVER_BIOGENESIS_LICENSE = GPLv2+
 KODI_SCREENSAVER_BIOGENESIS_LICENSE_FILES = src/Life.cpp
diff --git a/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.mk b/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.mk
index 0b16e32..9773bac 100644
--- a/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.mk
+++ b/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_GREYNETIC_VERSION = 5f370b0f1a51e57719f605344e94824105316c17
+KODI_SCREENSAVER_GREYNETIC_VERSION = 80e850eb3cbc7ee2c937fcab666dc45d2b2ee0bb
 KODI_SCREENSAVER_GREYNETIC_SITE = $(call github,notspiff,screensaver.greynetic,$(KODI_SCREENSAVER_GREYNETIC_VERSION))
 KODI_SCREENSAVER_GREYNETIC_LICENSE = GPLv2+
 KODI_SCREENSAVER_GREYNETIC_LICENSE_FILES = src/GreyNetic.cpp
diff --git a/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.mk b/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.mk
index 324fe3a..2adf960 100644
--- a/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.mk
+++ b/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_PINGPONG_VERSION = 00fd2a7c70d581ada1bc89829c6870530b4c65b9
+KODI_SCREENSAVER_PINGPONG_VERSION = 5c7cf6fd9f9ff1468f620bb891e66bebd3a5fe17
 KODI_SCREENSAVER_PINGPONG_SITE = $(call github,notspiff,screensaver.pingpong,$(KODI_SCREENSAVER_PINGPONG_VERSION))
 KODI_SCREENSAVER_PINGPONG_LICENSE = GPLv2+
 KODI_SCREENSAVER_PINGPONG_LICENSE_FILES = src/readme.txt
diff --git a/package/kodi-screensaver-pyro/kodi-screensaver-pyro.mk b/package/kodi-screensaver-pyro/kodi-screensaver-pyro.mk
index e4c2b96..f904052 100644
--- a/package/kodi-screensaver-pyro/kodi-screensaver-pyro.mk
+++ b/package/kodi-screensaver-pyro/kodi-screensaver-pyro.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_PYRO_VERSION = 7551f3f4b6414c40c1c4170c750b9f45dd995261
+KODI_SCREENSAVER_PYRO_VERSION = 2476b77d9954980a27e07eb8eb0727e2af226351
 KODI_SCREENSAVER_PYRO_SITE = $(call github,notspiff,screensaver.pyro,$(KODI_SCREENSAVER_PYRO_VERSION))
 KODI_SCREENSAVER_PYRO_LICENSE = GPLv2+
 KODI_SCREENSAVER_PYRO_LICENSE_FILES = src/Pyro.cpp
diff --git a/package/kodi-screensaver-stars/kodi-screensaver-stars.mk b/package/kodi-screensaver-stars/kodi-screensaver-stars.mk
index f2a1be1..b5b5206 100644
--- a/package/kodi-screensaver-stars/kodi-screensaver-stars.mk
+++ b/package/kodi-screensaver-stars/kodi-screensaver-stars.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_STARS_VERSION = 91b59f687ceb52488763aca4ba67d50a92f01731
+KODI_SCREENSAVER_STARS_VERSION = 28bf79d4dce040e9fbdc25f51007e13950cab937
 KODI_SCREENSAVER_STARS_SITE = $(call github,notspiff,screensaver.stars,$(KODI_SCREENSAVER_STARS_VERSION))
 KODI_SCREENSAVER_STARS_LICENSE = GPLv2+
 KODI_SCREENSAVER_STARS_LICENSE_FILES = src/StarField.cpp
diff --git a/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.mk b/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.mk
index 79f03c8..de197eb 100644
--- a/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.mk
+++ b/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_VISUALISATION_SPECTRUM_VERSION = aae1960b5bc14e50914205e2dabcb51077690a64
+KODI_VISUALISATION_SPECTRUM_VERSION = 9dbe53a0db73f00ee22e9ca235c98f8137b7bb9e
 KODI_VISUALISATION_SPECTRUM_SITE = $(call github,notspiff,visualization.spectrum,$(KODI_VISUALISATION_SPECTRUM_VERSION))
 KODI_VISUALISATION_SPECTRUM_LICENSE = GPLv2+
 KODI_VISUALISATION_SPECTRUM_LICENSE_FILES = COPYING
diff --git a/package/kodi-visualisation-waveform/kodi-visualisation-waveform.mk b/package/kodi-visualisation-waveform/kodi-visualisation-waveform.mk
index eec0cfc..81e880b 100644
--- a/package/kodi-visualisation-waveform/kodi-visualisation-waveform.mk
+++ b/package/kodi-visualisation-waveform/kodi-visualisation-waveform.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_VISUALISATION_WAVEFORM_VERSION = abbdbffc5fd2dff1d627de8df3cb5a3887d1119c
+KODI_VISUALISATION_WAVEFORM_VERSION = 89aec48e2975f820004df5a1a53801339a5b3064
 KODI_VISUALISATION_WAVEFORM_SITE = $(call github,notspiff,visualization.waveform,$(KODI_VISUALISATION_WAVEFORM_VERSION))
 KODI_VISUALISATION_WAVEFORM_LICENSE = GPLv2+
 KODI_VISUALISATION_WAVEFORM_LICENSE_FILES = COPYING
-- 
2.7.0
