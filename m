From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 29 Apr 2020 18:08:48 +0200
Subject: [Buildroot] [PATCH 1/1] package/kodi-vfs-rar: bump version to 2.3.1
Message-ID: <20200429160848.251676-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Reformatted hashes.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-vfs-rar/kodi-vfs-rar.hash | 6 +++---
 package/kodi-vfs-rar/kodi-vfs-rar.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/kodi-vfs-rar/kodi-vfs-rar.hash b/package/kodi-vfs-rar/kodi-vfs-rar.hash
index 592b82f878..0fcf7f795b 100644
--- a/package/kodi-vfs-rar/kodi-vfs-rar.hash
+++ b/package/kodi-vfs-rar/kodi-vfs-rar.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256 07ab4a4e5f2ad9e6c7e15badb3474d3f4d9d5e1405c4ff82815cc44452177e3b  kodi-vfs-rar-2.3.0-Leia.tar.gz
+sha256  0ca45226b071d50595f2c06471761713765a83484bb2b9629c694d4b310007c1  kodi-vfs-rar-2.3.1-Leia.tar.gz
 # License files
-sha256 6ecc1687808b7d66b24f874755abfed7464d9751ed0001cd4e8e5d9bf397ff8a  lib/UnrarXLib/license.txt
-sha256 310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
+sha256  6ecc1687808b7d66b24f874755abfed7464d9751ed0001cd4e8e5d9bf397ff8a  lib/UnrarXLib/license.txt
+sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-vfs-rar/kodi-vfs-rar.mk b/package/kodi-vfs-rar/kodi-vfs-rar.mk
index 3bbe7be95d..315a77903e 100644
--- a/package/kodi-vfs-rar/kodi-vfs-rar.mk
+++ b/package/kodi-vfs-rar/kodi-vfs-rar.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_VFS_RAR_VERSION = 2.3.0-Leia
+KODI_VFS_RAR_VERSION = 2.3.1-Leia
 KODI_VFS_RAR_SITE = $(call github,xbmc,vfs.rar,$(KODI_VFS_RAR_VERSION))
 KODI_VFS_RAR_LICENSE = unrar, GPL-2.0+
 KODI_VFS_RAR_LICENSE_FILES = lib/UnrarXLib/license.txt LICENSE.md
-- 
2.26.2
