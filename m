From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Jan 2020 12:07:33 +0100
Subject: [Buildroot] [PATCH v9 21/23] package/kodi-visualisation-fishbmc:
 bump version to 5.1.2-Leia
In-Reply-To: <20200119110735.1104443-1-bernd.kuhls@t-online.de>
References: <20200119110735.1104443-1-bernd.kuhls@t-online.de>
Message-ID: <20200119110735.1104443-22-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added license hash, moved repo to xbmc project because
https://github.com/notspiff/visualization.fishbmc is forwarded to
https://github.com/xbmc/visualization.fishbmc

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../kodi-visualisation-fishbmc.hash                           | 3 ++-
 .../kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.mk  | 4 ++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.hash b/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.hash
index 21d80a31cb..e8b5c6cb59 100644
--- a/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.hash
+++ b/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.hash
@@ -1,2 +1,3 @@
 # Locally computed
-sha256 cf42a21978578cb5ecb10c20fe09791183d8ef2998ff9d956a84142a7dda8f72  kodi-visualisation-fishbmc-4.1.0.tar.gz
+sha256 8142fe4a32c0c113945c5fc9745e54639ca73308371d292e3422730bfad1d064  kodi-visualisation-fishbmc-5.1.2-Leia.tar.gz
+sha256 684792cea796ea39d086ffd6cf5cb7c70ab8188dcf493707ba90d081d28f787e  visualization.fishbmc/LICENSE
diff --git a/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.mk b/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.mk
index 8360660ef4..a89c559d26 100644
--- a/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.mk
+++ b/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-KODI_VISUALISATION_FISHBMC_VERSION = 4.1.0
-KODI_VISUALISATION_FISHBMC_SITE = $(call github,notspiff,visualization.fishbmc,v$(KODI_VISUALISATION_FISHBMC_VERSION))
+KODI_VISUALISATION_FISHBMC_VERSION = 5.1.2-Leia
+KODI_VISUALISATION_FISHBMC_SITE = $(call github,xbmc,visualization.fishbmc,$(KODI_VISUALISATION_FISHBMC_VERSION))
 KODI_VISUALISATION_FISHBMC_LICENSE = GPL-2.0+
 KODI_VISUALISATION_FISHBMC_LICENSE_FILES = visualization.fishbmc/LICENSE
 KODI_VISUALISATION_FISHBMC_DEPENDENCIES = kodi
-- 
2.20.1
