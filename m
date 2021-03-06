From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 6 Mar 2021 22:56:50 +0100
Subject: [Buildroot] [git commit branch/next] package/kodi-vfs-rar: bump
 version to 4.0.0-Matrix
Message-ID: <20210306213556.289808183D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c01bff1a2b5abcd677e45929ed642b3165b5200c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kodi-vfs-rar/kodi-vfs-rar.hash | 2 +-
 package/kodi-vfs-rar/kodi-vfs-rar.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-vfs-rar/kodi-vfs-rar.hash b/package/kodi-vfs-rar/kodi-vfs-rar.hash
index 22ad584fb8..e4d0f7fe63 100644
--- a/package/kodi-vfs-rar/kodi-vfs-rar.hash
+++ b/package/kodi-vfs-rar/kodi-vfs-rar.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  5275c09eed7e8354849caa17c3d9699abcfa2437a7c7af3833bffd10fc1c577f  kodi-vfs-rar-2.3.2-Leia.tar.gz
+sha256  1111d1f90cc4addc2adb0884b779f4b47e30abb2766ba1708053e5f100b514bf  kodi-vfs-rar-4.0.0-Matrix.tar.gz
 # License files
 sha256  6ecc1687808b7d66b24f874755abfed7464d9751ed0001cd4e8e5d9bf397ff8a  lib/UnrarXLib/license.txt
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-vfs-rar/kodi-vfs-rar.mk b/package/kodi-vfs-rar/kodi-vfs-rar.mk
index c0d52a1d25..001bd7c61c 100644
--- a/package/kodi-vfs-rar/kodi-vfs-rar.mk
+++ b/package/kodi-vfs-rar/kodi-vfs-rar.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_VFS_RAR_VERSION = 2.3.2-Leia
+KODI_VFS_RAR_VERSION = 4.0.0-Matrix
 KODI_VFS_RAR_SITE = $(call github,xbmc,vfs.rar,$(KODI_VFS_RAR_VERSION))
 KODI_VFS_RAR_LICENSE = unrar, GPL-2.0+
 KODI_VFS_RAR_LICENSE_FILES = lib/UnrarXLib/license.txt LICENSE.md
