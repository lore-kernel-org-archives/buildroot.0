From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon,  8 Mar 2021 10:35:57 +0100
Subject: [Buildroot] [PATCH 1/4] package/kodi-inputstream-adaptive: update
 project URL
Message-ID: <20210308093600.1610397-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Reference: https://github.com/xbmc/repo-binary-addons/pull/143

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
https://git.buildroot.net/buildroot/commit/?id=fd72673d91a4b3326640bfb799d1af1926acd3ad
partly got lost while branch 'next' was merged

 package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
index 6b085e49ce..d6d86817ce 100644
--- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
+++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 KODI_INPUTSTREAM_ADAPTIVE_VERSION = 2.6.7-Matrix
-KODI_INPUTSTREAM_ADAPTIVE_SITE = $(call github,peak3d,inputstream.adaptive,$(KODI_INPUTSTREAM_ADAPTIVE_VERSION))
+KODI_INPUTSTREAM_ADAPTIVE_SITE = $(call github,xbmc,inputstream.adaptive,$(KODI_INPUTSTREAM_ADAPTIVE_VERSION))
 KODI_INPUTSTREAM_ADAPTIVE_LICENSE = GPL-2.0+
 KODI_INPUTSTREAM_ADAPTIVE_LICENSE_FILES = LICENSE.GPL
 KODI_INPUTSTREAM_ADAPTIVE_DEPENDENCIES = expat kodi
-- 
2.29.2
