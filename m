From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 30 Jan 2015 20:09:24 +0100
Subject: [Buildroot] [PATCH 2/2] package/kodi-pvr-addons: bump version
In-Reply-To: <1422644964-18997-1-git-send-email-bernd.kuhls@t-online.de>
References: <1422644964-18997-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1422644964-18997-2-git-send-email-bernd.kuhls@t-online.de>
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
index 0ca0457..2db8d3a 100644
--- a/package/kodi-pvr-addons/kodi-pvr-addons.mk
+++ b/package/kodi-pvr-addons/kodi-pvr-addons.mk
@@ -6,7 +6,7 @@
 
 # This cset is on the branch 'helix'
 # When Kodi is updated, this should be updated to the corresponding branch
-KODI_PVR_ADDONS_VERSION = 7aec58f67c799e83e0c1c490ceda39dc119f2c7d
+KODI_PVR_ADDONS_VERSION = a0a437eac14c9532ea0c6d38f8f222a612aea147
 KODI_PVR_ADDONS_SITE = $(call github,opdenkamp,xbmc-pvr-addons,$(KODI_PVR_ADDONS_VERSION))
 KODI_PVR_ADDONS_LICENSE = GPLv3+
 KODI_PVR_ADDONS_LICENSE_FILES = COPYING
-- 
1.7.10.4
