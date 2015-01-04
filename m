From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  4 Jan 2015 13:17:32 +0100
Subject: [Buildroot] [PATCH 5/6] package/kodi-pvr-addons: bump version
In-Reply-To: <1420373853-20008-1-git-send-email-bernd.kuhls@t-online.de>
References: <1420373853-20008-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1420373853-20008-5-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-pvr-addons/kodi-pvr-addons.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/kodi-pvr-addons/kodi-pvr-addons.mk b/package/kodi-pvr-addons/kodi-pvr-addons.mk
index acd431c..fc59bc2 100644
--- a/package/kodi-pvr-addons/kodi-pvr-addons.mk
+++ b/package/kodi-pvr-addons/kodi-pvr-addons.mk
@@ -6,7 +6,7 @@
 
 # This cset is on the branch 'master'
 # When Kodi is released this should be updated to the corresponding branch
-KODI_PVR_ADDONS_VERSION = 89ba5bb6917a820b278688b9f43b23834002e9b5
+KODI_PVR_ADDONS_VERSION = 78397afa33774b484a1649c379d9b5e6eb3180c0
 KODI_PVR_ADDONS_SITE = $(call github,opdenkamp,xbmc-pvr-addons,$(KODI_PVR_ADDONS_VERSION))
 KODI_PVR_ADDONS_LICENSE = GPLv3+
 KODI_PVR_ADDONS_LICENSE_FILES = COPYING
-- 
1.7.10.4
