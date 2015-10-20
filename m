From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 20 Oct 2015 21:42:24 +0200
Subject: [Buildroot] [PATCH 08/10] package/kodi-pvr-pctv: bump version
In-Reply-To: <1445370146-12033-1-git-send-email-bernd.kuhls@t-online.de>
References: <1445370146-12033-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1445370146-12033-9-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-pvr-pctv/kodi-pvr-pctv.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/kodi-pvr-pctv/kodi-pvr-pctv.mk b/package/kodi-pvr-pctv/kodi-pvr-pctv.mk
index 4f3994a..0cda85a 100644
--- a/package/kodi-pvr-pctv/kodi-pvr-pctv.mk
+++ b/package/kodi-pvr-pctv/kodi-pvr-pctv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_PCTV_VERSION = d23160c043b0cd0a86463f6a3590a8126ff8af9d
+KODI_PVR_PCTV_VERSION = bca81657a2879a1ab76404e5b5441e2491f35350
 KODI_PVR_PCTV_SITE = $(call github,kodi-pvr,pvr.pctv,$(KODI_PVR_PCTV_VERSION))
 KODI_PVR_PCTV_LICENSE = GPLv2+
 KODI_PVR_PCTV_LICENSE_FILES = src/client.h
-- 
2.6.1
