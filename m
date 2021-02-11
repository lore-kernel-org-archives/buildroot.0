From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 11 Feb 2021 20:43:56 +0100
Subject: [Buildroot] [PATCH 1/1] package/kodi-inputstream-adaptive: update
 project URL
Message-ID: <20210211194356.591508-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Reference: https://github.com/xbmc/repo-binary-addons/pull/143

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-inputstream-adaptive/Config.in                    | 2 +-
 package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-inputstream-adaptive/Config.in b/package/kodi-inputstream-adaptive/Config.in
index f9ba20adcf..21f1cff171 100644
--- a/package/kodi-inputstream-adaptive/Config.in
+++ b/package/kodi-inputstream-adaptive/Config.in
@@ -6,4 +6,4 @@ config BR2_PACKAGE_KODI_INPUTSTREAM_ADAPTIVE
 	help
 	  Kodi inputstream addon for several manifest types
 
-	  https://github.com/peak3d/inputstream.adaptive
+	  https://github.com/xbmc/inputstream.adaptive
diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
index 30fbaf5251..a8024951d4 100644
--- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
+++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 KODI_INPUTSTREAM_ADAPTIVE_VERSION = 2.4.6-Leia
-KODI_INPUTSTREAM_ADAPTIVE_SITE = $(call github,peak3d,inputstream.adaptive,$(KODI_INPUTSTREAM_ADAPTIVE_VERSION))
+KODI_INPUTSTREAM_ADAPTIVE_SITE = $(call github,xbmc,inputstream.adaptive,$(KODI_INPUTSTREAM_ADAPTIVE_VERSION))
 KODI_INPUTSTREAM_ADAPTIVE_LICENSE = GPL-2.0+
 KODI_INPUTSTREAM_ADAPTIVE_LICENSE_FILES = LICENSE.GPL
 KODI_INPUTSTREAM_ADAPTIVE_DEPENDENCIES = kodi
-- 
2.29.2
