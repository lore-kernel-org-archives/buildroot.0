From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 14 Mar 2021 23:17:16 +0100
Subject: [Buildroot] [git commit] package/kodi-inputstream-adaptive: update
 project URL
Message-ID: <20210314215352.0DE5D8678A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9486de722722c61630387d275af0984537fa2109
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Reference: https://github.com/xbmc/repo-binary-addons/pull/143

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
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
