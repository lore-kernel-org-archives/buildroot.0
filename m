From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Apr 2017 11:25:41 +0200
Subject: [Buildroot] [git commit] package/kodi-platform: bump version
Message-ID: <20170429101426.0FD0D827B4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b62fbde744eba4129b9ae90294e8b2847812b411
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kodi-platform/kodi-platform.hash | 2 +-
 package/kodi-platform/kodi-platform.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-platform/kodi-platform.hash b/package/kodi-platform/kodi-platform.hash
index a248448..d99c622 100644
--- a/package/kodi-platform/kodi-platform.hash
+++ b/package/kodi-platform/kodi-platform.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  88741358d5d54a0031553ac28aa63bc56c44d994a76f8651bac94a1e244a6595  kodi-platform-45d6ad1984fdb1dc855076ff18484dbec33939d1.tar.gz
+sha256 c53f37888d752e233f5adabc6ecfb8a1ea02728e010007200bbf671f6b9462de  kodi-platform-36fb49371dbce49bf470a5bb1fc51b74b4a3612d.tar.gz
diff --git a/package/kodi-platform/kodi-platform.mk b/package/kodi-platform/kodi-platform.mk
index 9658918..53f8ce9 100644
--- a/package/kodi-platform/kodi-platform.mk
+++ b/package/kodi-platform/kodi-platform.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PLATFORM_VERSION = 45d6ad1984fdb1dc855076ff18484dbec33939d1
+KODI_PLATFORM_VERSION = 36fb49371dbce49bf470a5bb1fc51b74b4a3612d
 KODI_PLATFORM_SITE = $(call github,xbmc,kodi-platform,$(KODI_PLATFORM_VERSION))
 KODI_PLATFORM_LICENSE = GPL-2.0+
 KODI_PLATFORM_LICENSE_FILES = src/util/XMLUtils.h
