From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 28 Aug 2015 11:28:25 +0200
Subject: [Buildroot] [git commit] package/kodi-visualisation-waveforhue:
	bump version
Message-ID: <20150901083107.F2ABD801E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=52269572124c36054fa397dc47420b4177a71938
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also remove patch applied upstream:
https://github.com/notspiff/visualization.waveforhue/commit/8824f4fa384693da0dfb3df5c30992bfe0fee9a4

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0001-Adapt-xbmc_vis_dll.h-header-path.patch    |   26 --------------------
 .../kodi-visualisation-waveforhue.mk               |    2 +-
 2 files changed, 1 insertions(+), 27 deletions(-)

diff --git a/package/kodi-visualisation-waveforhue/0001-Adapt-xbmc_vis_dll.h-header-path.patch b/package/kodi-visualisation-waveforhue/0001-Adapt-xbmc_vis_dll.h-header-path.patch
deleted file mode 100644
index baa69b4..0000000
--- a/package/kodi-visualisation-waveforhue/0001-Adapt-xbmc_vis_dll.h-header-path.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From d80b2dfeab475b066004d831c0d28c0dab064ca6 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Thu, 30 Jul 2015 10:24:53 +0200
-Subject: [PATCH] Adapt xbmc_vis_dll.h header path
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- src/Main_gles.cpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/Main_gles.cpp b/src/Main_gles.cpp
-index 3c22bf8..f5666e9 100644
---- a/src/Main_gles.cpp
-+++ b/src/Main_gles.cpp
-@@ -38,7 +38,7 @@
- #include <GLES2/gl2ext.h>
- #endif
- 
--#include "addons/include/xbmc_vis_dll.h"
-+#include "kodi/xbmc_vis_dll.h"
- #include "VisGUIShader.h"
- 
- //th
--- 
-2.5.0
-
diff --git a/package/kodi-visualisation-waveforhue/kodi-visualisation-waveforhue.mk b/package/kodi-visualisation-waveforhue/kodi-visualisation-waveforhue.mk
index 5599065..28eeb4d 100644
--- a/package/kodi-visualisation-waveforhue/kodi-visualisation-waveforhue.mk
+++ b/package/kodi-visualisation-waveforhue/kodi-visualisation-waveforhue.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_VISUALISATION_WAVEFORHUE_VERSION = 330b5d0432a976993d8ea3e13f01ec9bd3d8b02e
+KODI_VISUALISATION_WAVEFORHUE_VERSION = e87d5c7d7e7504036b80af8bc89f4cf6489085fe
 KODI_VISUALISATION_WAVEFORHUE_SITE = $(call github,notspiff,visualization.waveforhue,$(KODI_VISUALISATION_WAVEFORHUE_VERSION))
 KODI_VISUALISATION_WAVEFORHUE_LICENSE = GPLv2+
 KODI_VISUALISATION_WAVEFORHUE_LICENSE_FILES = COPYING
