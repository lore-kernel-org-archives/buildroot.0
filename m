From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 18 Jan 2020 21:06:01 +0100
Subject: [Buildroot] [PATCH v8 01/20] package/kodi-platform: bump version
In-Reply-To: <20200118200620.3967240-1-bernd.kuhls@t-online.de>
References: <20200118200620.3967240-1-bernd.kuhls@t-online.de>
Message-ID: <20200118200620.3967240-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-platform/kodi-platform.hash | 2 +-
 package/kodi-platform/kodi-platform.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-platform/kodi-platform.hash b/package/kodi-platform/kodi-platform.hash
index d99c6225cb..0b2ab6b147 100644
--- a/package/kodi-platform/kodi-platform.hash
+++ b/package/kodi-platform/kodi-platform.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 c53f37888d752e233f5adabc6ecfb8a1ea02728e010007200bbf671f6b9462de  kodi-platform-36fb49371dbce49bf470a5bb1fc51b74b4a3612d.tar.gz
+sha256 d5b9b61c1c22b471d948b2c8de50f77ccadbd908869b13b5d98c42f447268d56  kodi-platform-915da086fa7b4ea72796052a04ed6de95501b95c.tar.gz
diff --git a/package/kodi-platform/kodi-platform.mk b/package/kodi-platform/kodi-platform.mk
index 53f8ce956b..8bf517fa5d 100644
--- a/package/kodi-platform/kodi-platform.mk
+++ b/package/kodi-platform/kodi-platform.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PLATFORM_VERSION = 36fb49371dbce49bf470a5bb1fc51b74b4a3612d
+KODI_PLATFORM_VERSION = 915da086fa7b4ea72796052a04ed6de95501b95c
 KODI_PLATFORM_SITE = $(call github,xbmc,kodi-platform,$(KODI_PLATFORM_VERSION))
 KODI_PLATFORM_LICENSE = GPL-2.0+
 KODI_PLATFORM_LICENSE_FILES = src/util/XMLUtils.h
-- 
2.20.1
