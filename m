From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Feb 2016 23:42:57 +0100
Subject: [Buildroot] [git commit branch/next] package/kodi-platform: bump
	version, add hash
Message-ID: <20160229224442.033ED8027D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=349c9c4a9e6962960fb20bf5ba651040e6316341
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kodi-platform/kodi-platform.hash | 2 ++
 package/kodi-platform/kodi-platform.mk   | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

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
