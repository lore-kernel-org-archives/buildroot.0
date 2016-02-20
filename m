From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 20 Feb 2016 23:09:10 +0100
Subject: [Buildroot] [PATCH/next 05/31] package/kodi-platform: bump version,
	add hash
In-Reply-To: <1456006176-21308-1-git-send-email-bernd.kuhls@t-online.de>
References: <1456006176-21308-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1456006176-21308-6-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-platform/kodi-platform.hash | 2 ++
 package/kodi-platform/kodi-platform.mk   | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)
 create mode 100644 package/kodi-platform/kodi-platform.hash

diff --git a/package/kodi-platform/kodi-platform.hash b/package/kodi-platform/kodi-platform.hash
new file mode 100644
index 0000000..a248448
--- /dev/null
+++ b/package/kodi-platform/kodi-platform.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  88741358d5d54a0031553ac28aa63bc56c44d994a76f8651bac94a1e244a6595  kodi-platform-45d6ad1984fdb1dc855076ff18484dbec33939d1.tar.gz
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
