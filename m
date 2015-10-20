From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 Oct 2015 22:02:24 +0200
Subject: [Buildroot] [git commit] package/kodi-pvr-hts: bump version
Message-ID: <20151020200500.3DE4D81E84@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=141ee34dcd480dcd6e6736c8415d5b60d079053c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/kodi-pvr-hts/kodi-pvr-hts.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/kodi-pvr-hts/kodi-pvr-hts.mk b/package/kodi-pvr-hts/kodi-pvr-hts.mk
index 726a155..f8b0359 100644
--- a/package/kodi-pvr-hts/kodi-pvr-hts.mk
+++ b/package/kodi-pvr-hts/kodi-pvr-hts.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_HTS_VERSION = 9b05d4cbdda80d12cc8d90b6cc2c80ab6f65e4d2
+KODI_PVR_HTS_VERSION = 016b0b3251d6d5bffaf68baf59010e4347759c4a
 KODI_PVR_HTS_SITE = $(call github,kodi-pvr,pvr.hts,$(KODI_PVR_HTS_VERSION))
 KODI_PVR_HTS_LICENSE = GPLv2+
 KODI_PVR_HTS_LICENSE_FILES = src/client.h
