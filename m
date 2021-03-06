From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 6 Mar 2021 22:56:51 +0100
Subject: [Buildroot] [git commit] package/kodi-visualisation-fishbmc: bump
 version to 6.3.0-Matrix
Message-ID: <20210308072139.7523581607@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7ad1e18bfb93cce3d397b3a2afc3ad418b828e01
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switch license file to LICENSE.md.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.hash | 4 ++--
 package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.hash b/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.hash
index 4e215f331c..f03602c003 100644
--- a/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.hash
+++ b/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  a03d4f64a6d44625d6936fd3abd359a0a08d11252663cae9fc5d061bd489c006  kodi-visualisation-fishbmc-5.1.3-Leia.tar.gz
-sha256  684792cea796ea39d086ffd6cf5cb7c70ab8188dcf493707ba90d081d28f787e  visualization.fishbmc/LICENSE
+sha256  fd6a4383e36ed67590d40eb945d11bc5eae0c83e0ea56bfcadbc0ff03de0b2a4  kodi-visualisation-fishbmc-6.3.0-Matrix.tar.gz
+sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.mk b/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.mk
index defc183ff9..ecb118e52b 100644
--- a/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.mk
+++ b/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-KODI_VISUALISATION_FISHBMC_VERSION = 5.1.3-Leia
+KODI_VISUALISATION_FISHBMC_VERSION = 6.3.0-Matrix
 KODI_VISUALISATION_FISHBMC_SITE = $(call github,xbmc,visualization.fishbmc,$(KODI_VISUALISATION_FISHBMC_VERSION))
 KODI_VISUALISATION_FISHBMC_LICENSE = GPL-2.0+
-KODI_VISUALISATION_FISHBMC_LICENSE_FILES = visualization.fishbmc/LICENSE
+KODI_VISUALISATION_FISHBMC_LICENSE_FILES = LICENSE.md
 KODI_VISUALISATION_FISHBMC_DEPENDENCIES = kodi
 
 $(eval $(cmake-package))
