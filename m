From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 Oct 2015 22:02:17 +0200
Subject: [Buildroot] [git commit] package/kodi-pvr-filmon: bump version
Message-ID: <20151020200500.32C717F91D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ac7fec027d663913411d7a8330bb98ec3d46660c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/kodi-pvr-filmon/kodi-pvr-filmon.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/kodi-pvr-filmon/kodi-pvr-filmon.mk b/package/kodi-pvr-filmon/kodi-pvr-filmon.mk
index 76e4ca9..7e49268 100644
--- a/package/kodi-pvr-filmon/kodi-pvr-filmon.mk
+++ b/package/kodi-pvr-filmon/kodi-pvr-filmon.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_FILMON_VERSION = 5c41f4e361c9bcdd6e53cffd541222c5aa131a27
+KODI_PVR_FILMON_VERSION = 67abb5696798aa954b38de2cc7b4a74e6554d627
 KODI_PVR_FILMON_SITE = $(call github,kodi-pvr,pvr.filmon,$(KODI_PVR_FILMON_VERSION))
 KODI_PVR_FILMON_LICENSE = GPLv2+
 KODI_PVR_FILMON_LICENSE_FILES = src/client.h
