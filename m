From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 31 Jul 2015 22:03:26 +0200
Subject: [Buildroot] [PATCH 1/4] package/kodi-pvr-hts: bump version
Message-ID: <1438373009-5745-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-pvr-hts/kodi-pvr-hts.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/kodi-pvr-hts/kodi-pvr-hts.mk b/package/kodi-pvr-hts/kodi-pvr-hts.mk
index 05ce503..726a155 100644
--- a/package/kodi-pvr-hts/kodi-pvr-hts.mk
+++ b/package/kodi-pvr-hts/kodi-pvr-hts.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_HTS_VERSION = 5c2244044a00ecd3320fc6ce15dd208c16578588
+KODI_PVR_HTS_VERSION = 9b05d4cbdda80d12cc8d90b6cc2c80ab6f65e4d2
 KODI_PVR_HTS_SITE = $(call github,kodi-pvr,pvr.hts,$(KODI_PVR_HTS_VERSION))
 KODI_PVR_HTS_LICENSE = GPLv2+
 KODI_PVR_HTS_LICENSE_FILES = src/client.h
-- 
2.1.4
