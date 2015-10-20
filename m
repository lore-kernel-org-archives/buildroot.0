From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 20 Oct 2015 21:42:19 +0200
Subject: [Buildroot] [PATCH 03/10] package/kodi-pvr-filmon: bump version
In-Reply-To: <1445370146-12033-1-git-send-email-bernd.kuhls@t-online.de>
References: <1445370146-12033-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1445370146-12033-4-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-pvr-filmon/kodi-pvr-filmon.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
-- 
2.6.1
