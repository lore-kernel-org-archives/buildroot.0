From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 14 Feb 2021 17:45:16 +0100
Subject: [Buildroot] [git commit branch/2020.02.x]
 package/kodi-inputstream-adaptive: update project URL
Message-ID: <20210214162623.3BC4383DF3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8d865ac2e4443e3b5992eda912db408ecc8041d0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Reference: https://github.com/xbmc/repo-binary-addons/pull/143

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit fd72673d91a4b3326640bfb799d1af1926acd3ad)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
index 1a083b188b..78cbfe92a5 100644
--- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
+++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 KODI_INPUTSTREAM_ADAPTIVE_VERSION = 2.4.2-Leia
-KODI_INPUTSTREAM_ADAPTIVE_SITE = $(call github,peak3d,inputstream.adaptive,$(KODI_INPUTSTREAM_ADAPTIVE_VERSION))
+KODI_INPUTSTREAM_ADAPTIVE_SITE = $(call github,xbmc,inputstream.adaptive,$(KODI_INPUTSTREAM_ADAPTIVE_VERSION))
 KODI_INPUTSTREAM_ADAPTIVE_LICENSE = GPL-2.0+
 KODI_INPUTSTREAM_ADAPTIVE_LICENSE_FILES = LICENSE.GPL
 KODI_INPUTSTREAM_ADAPTIVE_DEPENDENCIES = kodi
