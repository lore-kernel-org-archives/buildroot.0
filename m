From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 20 Sep 2020 08:45:01 +0200
Subject: [Buildroot] [PATCH 10/11] package/kodi-visualisation-starburst:
 bump version to 2.0.3-Leia
In-Reply-To: <20200920064502.8233-1-bernd.kuhls@t-online.de>
References: <20200920064502.8233-1-bernd.kuhls@t-online.de>
Message-ID: <20200920064502.8233-10-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../kodi-visualisation-starburst.hash                           | 2 +-
 .../kodi-visualisation-starburst.mk                             | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-visualisation-starburst/kodi-visualisation-starburst.hash b/package/kodi-visualisation-starburst/kodi-visualisation-starburst.hash
index a0c820eea3..834d71ae5c 100644
--- a/package/kodi-visualisation-starburst/kodi-visualisation-starburst.hash
+++ b/package/kodi-visualisation-starburst/kodi-visualisation-starburst.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  8e2ee8b39fe1c0daa24b11a9c4a175a85fdbdf7dc1bc48a1ab4876edeb6f676f  kodi-visualisation-starburst-2.0.2-Leia.tar.gz
+sha256  5a06385dd4824373a00fe4e2139b3d851c51ed001f68671acf99d17ce348f5e2  kodi-visualisation-starburst-2.0.3-Leia.tar.gz
 sha256  2e668b3da2f061a6d6ecc3cb96bdfb0f8fc9cc98c9e9f95454bc45b88708690f  debian/copyright
diff --git a/package/kodi-visualisation-starburst/kodi-visualisation-starburst.mk b/package/kodi-visualisation-starburst/kodi-visualisation-starburst.mk
index 9f1137d12c..8d736f08e9 100644
--- a/package/kodi-visualisation-starburst/kodi-visualisation-starburst.mk
+++ b/package/kodi-visualisation-starburst/kodi-visualisation-starburst.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_VISUALISATION_STARBURST_VERSION = 2.0.2-Leia
+KODI_VISUALISATION_STARBURST_VERSION = 2.0.3-Leia
 KODI_VISUALISATION_STARBURST_SITE = $(call github,xbmc,visualization.starburst,$(KODI_VISUALISATION_STARBURST_VERSION))
 KODI_VISUALISATION_STARBURST_LICENSE = GPL-2.0+
 KODI_VISUALISATION_STARBURST_LICENSE_FILES = debian/copyright
-- 
2.27.0
