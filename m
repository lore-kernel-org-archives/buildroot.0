From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 14 Jun 2020 16:22:19 +0200
Subject: [Buildroot] [PATCH 1/1] package/kodi-platform: bump version
Message-ID: <20200614142219.2773474-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sent patch upstream and added URL for reference.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...01-kodiplatform-config.cmake-fix-for-cross-compilation.patch | 2 ++
 package/kodi-platform/kodi-platform.hash                        | 2 +-
 package/kodi-platform/kodi-platform.mk                          | 2 +-
 3 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/kodi-platform/0001-kodiplatform-config.cmake-fix-for-cross-compilation.patch b/package/kodi-platform/0001-kodiplatform-config.cmake-fix-for-cross-compilation.patch
index 18a74e7b54..cc514b002b 100644
--- a/package/kodi-platform/0001-kodiplatform-config.cmake-fix-for-cross-compilation.patch
+++ b/package/kodi-platform/0001-kodiplatform-config.cmake-fix-for-cross-compilation.patch
@@ -6,6 +6,8 @@ Subject: [PATCH] kodiplatform-config.cmake: fix for cross-compilation
 Use CMAKE_FIND_ROOT_PATH in kodiplatform-config.cmake in order to make
 it cross-compilation friendly.
 
+Patch sent upstream: https://github.com/xbmc/kodi-platform/pull/30
+
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 ---
  CMakeLists.txt               | 2 +-
diff --git a/package/kodi-platform/kodi-platform.hash b/package/kodi-platform/kodi-platform.hash
index 28363888e5..29a43cf021 100644
--- a/package/kodi-platform/kodi-platform.hash
+++ b/package/kodi-platform/kodi-platform.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  d5b9b61c1c22b471d948b2c8de50f77ccadbd908869b13b5d98c42f447268d56  kodi-platform-915da086fa7b4ea72796052a04ed6de95501b95c.tar.gz
+sha256  159165ae641da5eb273885ce53b8a4b84e62a595c4974f9d12c1b5d1428ef25c  kodi-platform-809c5e9d711e378561440a896fcb7dbcd009eb3d.tar.gz
 sha256  2f4bc4c1244b679121749378ff1a2b4b4e318897dac3d346a236432948ebeea7  debian/copyright
diff --git a/package/kodi-platform/kodi-platform.mk b/package/kodi-platform/kodi-platform.mk
index 8c42bfd953..f1b97e3259 100644
--- a/package/kodi-platform/kodi-platform.mk
+++ b/package/kodi-platform/kodi-platform.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PLATFORM_VERSION = 915da086fa7b4ea72796052a04ed6de95501b95c
+KODI_PLATFORM_VERSION = 809c5e9d711e378561440a896fcb7dbcd009eb3d
 KODI_PLATFORM_SITE = $(call github,xbmc,kodi-platform,$(KODI_PLATFORM_VERSION))
 KODI_PLATFORM_LICENSE = GPL-2.0+
 KODI_PLATFORM_LICENSE_FILES = debian/copyright
-- 
2.26.2
