From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 20 Oct 2015 21:42:18 +0200
Subject: [Buildroot] [PATCH 02/10] package/kodi-pvr-argustv: bump version
In-Reply-To: <1445370146-12033-1-git-send-email-bernd.kuhls@t-online.de>
References: <1445370146-12033-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1445370146-12033-3-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-pvr-argustv/kodi-pvr-argustv.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/kodi-pvr-argustv/kodi-pvr-argustv.mk b/package/kodi-pvr-argustv/kodi-pvr-argustv.mk
index 8fb5c89..0ce333a 100644
--- a/package/kodi-pvr-argustv/kodi-pvr-argustv.mk
+++ b/package/kodi-pvr-argustv/kodi-pvr-argustv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_ARGUSTV_VERSION = 96c80267935d8edc4f6f92d16b540ef77cdcb1db
+KODI_PVR_ARGUSTV_VERSION = 32f03271cc3fb1b50edfacd2793d5ac70a98dd20
 KODI_PVR_ARGUSTV_SITE = $(call github,kodi-pvr,pvr.argustv,$(KODI_PVR_ARGUSTV_VERSION))
 KODI_PVR_ARGUSTV_LICENSE = GPLv2+
 KODI_PVR_ARGUSTV_LICENSE_FILES = src/client.h
-- 
2.6.1
