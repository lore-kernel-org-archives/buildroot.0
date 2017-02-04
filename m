From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  4 Feb 2017 12:44:44 +0100
Subject: [Buildroot] [PATCH v3 31/38] package/kodi-visualisation-*: mass
	version bump
In-Reply-To: <20170204114451.20935-1-bernd.kuhls@t-online.de>
References: <20170204114451.20935-1-bernd.kuhls@t-online.de>
Message-ID: <20170204114451.20935-32-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.hash   | 2 +-
 package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.mk     | 2 +-
 package/kodi-visualisation-fountain/kodi-visualisation-fountain.hash | 2 +-
 package/kodi-visualisation-fountain/kodi-visualisation-fountain.mk   | 2 +-
 package/kodi-visualisation-goom/kodi-visualisation-goom.hash         | 2 +-
 package/kodi-visualisation-goom/kodi-visualisation-goom.mk           | 2 +-
 package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.hash | 2 +-
 package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.mk   | 2 +-
 package/kodi-visualisation-waveform/kodi-visualisation-waveform.hash | 2 +-
 package/kodi-visualisation-waveform/kodi-visualisation-waveform.mk   | 2 +-
 10 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.hash b/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.hash
index 6a65a58fe..c89ca9a61 100644
--- a/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.hash
+++ b/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 7047d501942bcd5095e0f1424f003caec8eb792b59d16d16ad25f14829844e50 kodi-visualisation-fishbmc-50c38c296a62e096a2216e43b86d864ee265c506.tar.gz
+sha256 cf42a21978578cb5ecb10c20fe09791183d8ef2998ff9d956a84142a7dda8f72  kodi-visualisation-fishbmc-v4.1.0.tar.gz
diff --git a/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.mk b/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.mk
index 1e07774f1..3f2ce1a41 100644
--- a/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.mk
+++ b/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_VISUALISATION_FISHBMC_VERSION = 50c38c296a62e096a2216e43b86d864ee265c506
+KODI_VISUALISATION_FISHBMC_VERSION = v4.1.0
 KODI_VISUALISATION_FISHBMC_SITE = $(call github,notspiff,visualization.fishbmc,$(KODI_VISUALISATION_FISHBMC_VERSION))
 KODI_VISUALISATION_FISHBMC_LICENSE = GPLv2+
 KODI_VISUALISATION_FISHBMC_LICENSE_FILES = visualization.fishbmc/LICENSE
diff --git a/package/kodi-visualisation-fountain/kodi-visualisation-fountain.hash b/package/kodi-visualisation-fountain/kodi-visualisation-fountain.hash
index 8dc933eff..7617fd49f 100644
--- a/package/kodi-visualisation-fountain/kodi-visualisation-fountain.hash
+++ b/package/kodi-visualisation-fountain/kodi-visualisation-fountain.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 7b2867f415f22e4bc4ba834034f00117fcf76774aea0afc7bf30b5f2d1991dd7 kodi-visualisation-fountain-f22deacd2396a204694d346f85369ea9ea70e16f.tar.gz
+sha256 30f533d3fe3641686f0155f92bebd79a06642b557c5a9ef7990f272b64b76dda  kodi-visualisation-fountain-faf49ac0acde558e925fa0a3eb3dbb49606278b4.tar.gz
diff --git a/package/kodi-visualisation-fountain/kodi-visualisation-fountain.mk b/package/kodi-visualisation-fountain/kodi-visualisation-fountain.mk
index 5684402a2..af250eaa1 100644
--- a/package/kodi-visualisation-fountain/kodi-visualisation-fountain.mk
+++ b/package/kodi-visualisation-fountain/kodi-visualisation-fountain.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_VISUALISATION_FOUNTAIN_VERSION = f22deacd2396a204694d346f85369ea9ea70e16f
+KODI_VISUALISATION_FOUNTAIN_VERSION = faf49ac0acde558e925fa0a3eb3dbb49606278b4
 KODI_VISUALISATION_FOUNTAIN_SITE = $(call github,notspiff,visualization.fountain,$(KODI_VISUALISATION_FOUNTAIN_VERSION))
 KODI_VISUALISATION_FOUNTAIN_DEPENDENCIES = kodi libsoil
 
diff --git a/package/kodi-visualisation-goom/kodi-visualisation-goom.hash b/package/kodi-visualisation-goom/kodi-visualisation-goom.hash
index 8507c652a..8d4548a7d 100644
--- a/package/kodi-visualisation-goom/kodi-visualisation-goom.hash
+++ b/package/kodi-visualisation-goom/kodi-visualisation-goom.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 66a71a5c5a1c0016d7020fcc9941634ee465dab14644cdc96023ce0a28408338 kodi-visualisation-goom-16747b7dba9cbdcfdc8df44e849eaf09450fc86f.tar.gz
+sha256 62a26efb6cd5d5fd109e38accb3deb71145972ae30b914bed7620eb40465c954  kodi-visualisation-goom-v1.1.0.tar.gz
diff --git a/package/kodi-visualisation-goom/kodi-visualisation-goom.mk b/package/kodi-visualisation-goom/kodi-visualisation-goom.mk
index 89f2bab1d..7099cbef7 100644
--- a/package/kodi-visualisation-goom/kodi-visualisation-goom.mk
+++ b/package/kodi-visualisation-goom/kodi-visualisation-goom.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_VISUALISATION_GOOM_VERSION = 16747b7dba9cbdcfdc8df44e849eaf09450fc86f
+KODI_VISUALISATION_GOOM_VERSION = v1.1.0
 KODI_VISUALISATION_GOOM_SITE = $(call github,notspiff,visualization.goom,$(KODI_VISUALISATION_GOOM_VERSION))
 KODI_VISUALISATION_GOOM_LICENSE = GPLv2+
 KODI_VISUALISATION_GOOM_LICENSE_FILES = src/Main.cpp
diff --git a/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.hash b/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.hash
index 18e38f577..6c892ed0b 100644
--- a/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.hash
+++ b/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 aa417d6ad3d3770029e7d8d9f7f0ca8d56a8a4f47821267b5a8604fc26993334 kodi-visualisation-spectrum-9dbe53a0db73f00ee22e9ca235c98f8137b7bb9e.tar.gz
+sha256 7ee78ff5c24e3f81b6e2a9208237f34667cb9faa5453d7bdb900ab65245973f1  kodi-visualisation-spectrum-v1.1.1.tar.gz
diff --git a/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.mk b/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.mk
index de197eb7f..20fcce829 100644
--- a/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.mk
+++ b/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_VISUALISATION_SPECTRUM_VERSION = 9dbe53a0db73f00ee22e9ca235c98f8137b7bb9e
+KODI_VISUALISATION_SPECTRUM_VERSION = v1.1.1
 KODI_VISUALISATION_SPECTRUM_SITE = $(call github,notspiff,visualization.spectrum,$(KODI_VISUALISATION_SPECTRUM_VERSION))
 KODI_VISUALISATION_SPECTRUM_LICENSE = GPLv2+
 KODI_VISUALISATION_SPECTRUM_LICENSE_FILES = COPYING
diff --git a/package/kodi-visualisation-waveform/kodi-visualisation-waveform.hash b/package/kodi-visualisation-waveform/kodi-visualisation-waveform.hash
index 728b857ec..1fdecbede 100644
--- a/package/kodi-visualisation-waveform/kodi-visualisation-waveform.hash
+++ b/package/kodi-visualisation-waveform/kodi-visualisation-waveform.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 439bd50fcb1c0912532d0d113f7eeadf28f72bd2cb0c234581ee1acc2a70e45b kodi-visualisation-waveform-89aec48e2975f820004df5a1a53801339a5b3064.tar.gz
+sha256 cf10d8d78cb2bde4a0a21bb7e467445617b46593c093ef05f336f95a048f2d54  kodi-visualisation-waveform-v1.1.0.tar.gz
diff --git a/package/kodi-visualisation-waveform/kodi-visualisation-waveform.mk b/package/kodi-visualisation-waveform/kodi-visualisation-waveform.mk
index 81e880b08..0d9f0f064 100644
--- a/package/kodi-visualisation-waveform/kodi-visualisation-waveform.mk
+++ b/package/kodi-visualisation-waveform/kodi-visualisation-waveform.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_VISUALISATION_WAVEFORM_VERSION = 89aec48e2975f820004df5a1a53801339a5b3064
+KODI_VISUALISATION_WAVEFORM_VERSION = v1.1.0
 KODI_VISUALISATION_WAVEFORM_SITE = $(call github,notspiff,visualization.waveform,$(KODI_VISUALISATION_WAVEFORM_VERSION))
 KODI_VISUALISATION_WAVEFORM_LICENSE = GPLv2+
 KODI_VISUALISATION_WAVEFORM_LICENSE_FILES = COPYING
-- 
2.11.0
