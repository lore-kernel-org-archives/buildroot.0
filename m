From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 20 Oct 2015 21:42:23 +0200
Subject: [Buildroot] [PATCH 07/10] package/kodi-pvr-vbox: bump version
In-Reply-To: <1445370146-12033-1-git-send-email-bernd.kuhls@t-online.de>
References: <1445370146-12033-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1445370146-12033-8-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-pvr-vbox/kodi-pvr-vbox.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/kodi-pvr-vbox/kodi-pvr-vbox.mk b/package/kodi-pvr-vbox/kodi-pvr-vbox.mk
index 338c29a..6bb7769 100644
--- a/package/kodi-pvr-vbox/kodi-pvr-vbox.mk
+++ b/package/kodi-pvr-vbox/kodi-pvr-vbox.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_VBOX_VERSION = 874eb8812db1dd1b2626ed6c9f8391790f0e6818
+KODI_PVR_VBOX_VERSION = 0b1d571f0259583671c9654febf2bf45a8e9920c
 KODI_PVR_VBOX_SITE = $(call github,kodi-pvr,pvr.vbox,$(KODI_PVR_VBOX_VERSION))
 KODI_PVR_VBOX_LICENSE = GPLv2+
 KODI_PVR_VBOX_LICENSE_FILES = src/client.h
-- 
2.6.1
