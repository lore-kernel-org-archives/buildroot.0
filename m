From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 12 Feb 2021 18:27:24 +0100
Subject: [Buildroot] [PATCH/next 1/2] package/kodi-pvr-iptvsimple: bump
 version to 3.10.0-Leia
Message-ID: <20210212172725.37205-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash | 2 +-
 package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash
index 2de9a4a15b..f90ff8b737 100644
--- a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash
+++ b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  0812e359a943f4ffb763b47fc0440768a8aa09f12172ef8dff4440b0a48f9c96  kodi-pvr-iptvsimple-3.9.8-Leia.tar.gz
+sha256  906d023b4713be558445902ff703ae65e03733d47dd7d0e1b16d02c05679c7ed  kodi-pvr-iptvsimple-3.10.0-Leia.tar.gz
 sha256  50e33ec3cddb75e6c5c5eb1b3d38cc0adee7dec71d7244925106d4a2c4d5e31d  debian/copyright
diff --git a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk
index f1a087100c..0b31024556 100644
--- a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk
+++ b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_IPTVSIMPLE_VERSION = 3.9.8-Leia
+KODI_PVR_IPTVSIMPLE_VERSION = 3.10.0-Leia
 KODI_PVR_IPTVSIMPLE_SITE = $(call github,kodi-pvr,pvr.iptvsimple,$(KODI_PVR_IPTVSIMPLE_VERSION))
 KODI_PVR_IPTVSIMPLE_LICENSE = GPL-2.0+
 KODI_PVR_IPTVSIMPLE_LICENSE_FILES = debian/copyright
-- 
2.29.2
