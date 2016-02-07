From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  7 Feb 2016 17:02:49 +0100
Subject: [Buildroot] [PATCH 05/28] package/kodi-platform: bump version
In-Reply-To: <1454860992-25114-1-git-send-email-bernd.kuhls@t-online.de>
References: <1454860992-25114-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1454860992-25114-6-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-platform/kodi-platform.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/kodi-platform/kodi-platform.mk b/package/kodi-platform/kodi-platform.mk
index 0a7cc2e..4b642f9 100644
--- a/package/kodi-platform/kodi-platform.mk
+++ b/package/kodi-platform/kodi-platform.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PLATFORM_VERSION = 33b6390b5d2abe5b674f9eb04bdee19228543054
+KODI_PLATFORM_VERSION = 45d6ad1984fdb1dc855076ff18484dbec33939d1
 KODI_PLATFORM_SITE = $(call github,xbmc,kodi-platform,$(KODI_PLATFORM_VERSION))
 KODI_PLATFORM_LICENSE = GPLv2+
 KODI_PLATFORM_LICENSE_FILES = src/util/XMLUtils.h
-- 
2.7.0
