From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu,  2 Feb 2017 08:27:23 +0100
Subject: [Buildroot] [PATCH 05/38] package/kodi-platform: bump version
In-Reply-To: <20170202072756.6624-1-bernd.kuhls@t-online.de>
References: <20170202072756.6624-1-bernd.kuhls@t-online.de>
Message-ID: <20170202072756.6624-5-bernd.kuhls@t-online.de>
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
index a2484484e..a8a58f4ef 100644
--- a/package/kodi-platform/kodi-platform.hash
+++ b/package/kodi-platform/kodi-platform.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  88741358d5d54a0031553ac28aa63bc56c44d994a76f8651bac94a1e244a6595  kodi-platform-45d6ad1984fdb1dc855076ff18484dbec33939d1.tar.gz
+sha256 951bd9d74ff34aca18f96bb5eae15533c3ec489eb8ec946cd4a8b4073d49f56d  kodi-platform-c8188d82678fec6b784597db69a68e74ff4986b5.tar.gz
diff --git a/package/kodi-platform/kodi-platform.mk b/package/kodi-platform/kodi-platform.mk
index 4b642f9cf..606ca1a9f 100644
--- a/package/kodi-platform/kodi-platform.mk
+++ b/package/kodi-platform/kodi-platform.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PLATFORM_VERSION = 45d6ad1984fdb1dc855076ff18484dbec33939d1
+KODI_PLATFORM_VERSION = c8188d82678fec6b784597db69a68e74ff4986b5
 KODI_PLATFORM_SITE = $(call github,xbmc,kodi-platform,$(KODI_PLATFORM_VERSION))
 KODI_PLATFORM_LICENSE = GPLv2+
 KODI_PLATFORM_LICENSE_FILES = src/util/XMLUtils.h
-- 
2.11.0
