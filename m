From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 6 Mar 2021 22:56:51 +0100
Subject: [Buildroot] [git commit] package/kodi-visualisation-starburst: bump
 version to 2.4.0-Matrix
Message-ID: <20210308072139.9F56D81607@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4e4fccd71296523fc29f14a550e9faf647f1fa04
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switch license file to LICENSE.md.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../kodi-visualisation-starburst/kodi-visualisation-starburst.hash    | 4 ++--
 package/kodi-visualisation-starburst/kodi-visualisation-starburst.mk  | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/kodi-visualisation-starburst/kodi-visualisation-starburst.hash b/package/kodi-visualisation-starburst/kodi-visualisation-starburst.hash
index 834d71ae5c..b08da9788e 100644
--- a/package/kodi-visualisation-starburst/kodi-visualisation-starburst.hash
+++ b/package/kodi-visualisation-starburst/kodi-visualisation-starburst.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  5a06385dd4824373a00fe4e2139b3d851c51ed001f68671acf99d17ce348f5e2  kodi-visualisation-starburst-2.0.3-Leia.tar.gz
-sha256  2e668b3da2f061a6d6ecc3cb96bdfb0f8fc9cc98c9e9f95454bc45b88708690f  debian/copyright
+sha256  fb991924b8f9a4f86d81b28ec629c131d36364f82914098356184c9ef03e753e  kodi-visualisation-starburst-2.4.0-Matrix.tar.gz
+sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-visualisation-starburst/kodi-visualisation-starburst.mk b/package/kodi-visualisation-starburst/kodi-visualisation-starburst.mk
index 8d736f08e9..f19a82bf81 100644
--- a/package/kodi-visualisation-starburst/kodi-visualisation-starburst.mk
+++ b/package/kodi-visualisation-starburst/kodi-visualisation-starburst.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-KODI_VISUALISATION_STARBURST_VERSION = 2.0.3-Leia
+KODI_VISUALISATION_STARBURST_VERSION = 2.4.0-Matrix
 KODI_VISUALISATION_STARBURST_SITE = $(call github,xbmc,visualization.starburst,$(KODI_VISUALISATION_STARBURST_VERSION))
 KODI_VISUALISATION_STARBURST_LICENSE = GPL-2.0+
-KODI_VISUALISATION_STARBURST_LICENSE_FILES = debian/copyright
+KODI_VISUALISATION_STARBURST_LICENSE_FILES = LICENSE.md
 KODI_VISUALISATION_STARBURST_DEPENDENCIES = glm kodi
 
 $(eval $(cmake-package))
