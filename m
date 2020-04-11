From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 11 Apr 2020 10:12:51 +0200
Subject: [Buildroot] [git commit] package/kodi-vfs-rar: bump version to
 2.3.0-Leia
Message-ID: <20200411075857.6C6E68E491@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1bf655cd79981c04c76583a81d710ddffe72013f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kodi-vfs-rar/kodi-vfs-rar.hash | 2 +-
 package/kodi-vfs-rar/kodi-vfs-rar.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-vfs-rar/kodi-vfs-rar.hash b/package/kodi-vfs-rar/kodi-vfs-rar.hash
index 80d04ebaca..592b82f878 100644
--- a/package/kodi-vfs-rar/kodi-vfs-rar.hash
+++ b/package/kodi-vfs-rar/kodi-vfs-rar.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256 17105acd5d2d83747a402b0782e4d7fe0f3e3f3a208ea9614af56c10186a757d  kodi-vfs-rar-2.2.3-Leia.tar.gz
+sha256 07ab4a4e5f2ad9e6c7e15badb3474d3f4d9d5e1405c4ff82815cc44452177e3b  kodi-vfs-rar-2.3.0-Leia.tar.gz
 # License files
 sha256 6ecc1687808b7d66b24f874755abfed7464d9751ed0001cd4e8e5d9bf397ff8a  lib/UnrarXLib/license.txt
 sha256 310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-vfs-rar/kodi-vfs-rar.mk b/package/kodi-vfs-rar/kodi-vfs-rar.mk
index be766080ed..3bbe7be95d 100644
--- a/package/kodi-vfs-rar/kodi-vfs-rar.mk
+++ b/package/kodi-vfs-rar/kodi-vfs-rar.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_VFS_RAR_VERSION = 2.2.3-Leia
+KODI_VFS_RAR_VERSION = 2.3.0-Leia
 KODI_VFS_RAR_SITE = $(call github,xbmc,vfs.rar,$(KODI_VFS_RAR_VERSION))
 KODI_VFS_RAR_LICENSE = unrar, GPL-2.0+
 KODI_VFS_RAR_LICENSE_FILES = lib/UnrarXLib/license.txt LICENSE.md
