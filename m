From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 19 Jul 2021 07:29:40 +0200
Subject: [Buildroot] [PATCH 1/1] package/kodi-visualisation-shadertoy: bump
 version to 19.0.0-Matrix
Message-ID: <20210719052940.5797-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Changelog:
https://github.com/xbmc/visualization.shadertoy/blob/Matrix/visualization.shadertoy/changelog.txt

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../kodi-visualisation-shadertoy.hash                           | 2 +-
 .../kodi-visualisation-shadertoy.mk                             | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.hash b/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.hash
index 8ecdfb6d50..9102f68605 100644
--- a/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.hash
+++ b/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  fbee4d8d4a41013705848eb89d4dcd55fe915a1ff997a60c800aa1bdd157530b  kodi-visualisation-shadertoy-2.3.0-Matrix.tar.gz
+sha256  6c106c0d8e53f9b0794291a1c53e9a00370ff79be73919d556048dce0bb9785c  kodi-visualisation-shadertoy-19.0.0-Matrix.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.mk b/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.mk
index f5ad505fe7..89ec69f8ea 100644
--- a/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.mk
+++ b/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_VISUALISATION_SHADERTOY_VERSION = 2.3.0-Matrix
+KODI_VISUALISATION_SHADERTOY_VERSION = 19.0.0-Matrix
 KODI_VISUALISATION_SHADERTOY_SITE = $(call github,xbmc,visualization.shadertoy,$(KODI_VISUALISATION_SHADERTOY_VERSION))
 KODI_VISUALISATION_SHADERTOY_LICENSE = GPL-2.0+
 KODI_VISUALISATION_SHADERTOY_LICENSE_FILES = LICENSE.md
-- 
2.30.2
