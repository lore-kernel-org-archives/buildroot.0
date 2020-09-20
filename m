From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 20 Sep 2020 08:45:00 +0200
Subject: [Buildroot] [PATCH 09/11] package/kodi-visualisation-shadertoy:
 bump version to 1.2.4-Leia
In-Reply-To: <20200920064502.8233-1-bernd.kuhls@t-online.de>
References: <20200920064502.8233-1-bernd.kuhls@t-online.de>
Message-ID: <20200920064502.8233-9-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../kodi-visualisation-shadertoy.hash                           | 2 +-
 .../kodi-visualisation-shadertoy.mk                             | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.hash b/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.hash
index 6585467ef8..67ab8867e6 100644
--- a/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.hash
+++ b/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  7b09de334ed3c96d2e2552e0594b8f76c11e36edfc10efd725851140132a4d4f  kodi-visualisation-shadertoy-1.2.3-Leia.tar.gz
+sha256  07724fc59cc5f960a941b8255af326e87fa9fbc8234498c7e21d8a46050e0dd4  kodi-visualisation-shadertoy-1.2.4-Leia.tar.gz
 sha256  e33ac3ac6ca1bdd4a4a411481d43579d855622e7ecc207809b5f49ea617db480  debian/copyright
diff --git a/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.mk b/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.mk
index f6e417bef3..865abf02cc 100644
--- a/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.mk
+++ b/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_VISUALISATION_SHADERTOY_VERSION = 1.2.3-Leia
+KODI_VISUALISATION_SHADERTOY_VERSION = 1.2.4-Leia
 KODI_VISUALISATION_SHADERTOY_SITE = $(call github,xbmc,visualization.shadertoy,$(KODI_VISUALISATION_SHADERTOY_VERSION))
 KODI_VISUALISATION_SHADERTOY_LICENSE = GPL-2.0+
 KODI_VISUALISATION_SHADERTOY_LICENSE_FILES = debian/copyright
-- 
2.27.0
