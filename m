From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 11 Apr 2020 10:12:55 +0200
Subject: [Buildroot] [git commit] package/kodi-vfs-sftp: bump version to
 1.0.6-Leia
Message-ID: <20200411075857.7AA0F8E478@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c1d892d837385c5a9f1dce9e4c4420451964ae24
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switch license file to LICENSE.md.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kodi-vfs-sftp/kodi-vfs-sftp.hash | 4 ++--
 package/kodi-vfs-sftp/kodi-vfs-sftp.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/kodi-vfs-sftp/kodi-vfs-sftp.hash b/package/kodi-vfs-sftp/kodi-vfs-sftp.hash
index 9cfe9e5c08..bc861627d3 100644
--- a/package/kodi-vfs-sftp/kodi-vfs-sftp.hash
+++ b/package/kodi-vfs-sftp/kodi-vfs-sftp.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 6a6d7fc777f574746bcc34b618700a4db3981aee470b68d60c3407eeeb0c16d9  kodi-vfs-sftp-1.0.5-Leia.tar.gz
-sha256 65fd90626c2d3d9aa3f9908f524174fa46bb359f3edecb6d86044dbd31652465  debian/copyright
+sha256 dc3db18b6cef90cd518b741e5c9bc7b3f4412774ee60bf70b451a8d2fc88a091  kodi-vfs-sftp-1.0.6-Leia.tar.gz
+sha256 310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-vfs-sftp/kodi-vfs-sftp.mk b/package/kodi-vfs-sftp/kodi-vfs-sftp.mk
index c01a584f71..3870ff9b5b 100644
--- a/package/kodi-vfs-sftp/kodi-vfs-sftp.mk
+++ b/package/kodi-vfs-sftp/kodi-vfs-sftp.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-KODI_VFS_SFTP_VERSION = 1.0.5-Leia
+KODI_VFS_SFTP_VERSION = 1.0.6-Leia
 KODI_VFS_SFTP_SITE = $(call github,xbmc,vfs.sftp,$(KODI_VFS_SFTP_VERSION))
 KODI_VFS_SFTP_LICENSE = GPL-2.0+
-KODI_VFS_SFTP_LICENSE_FILES = debian/copyright
+KODI_VFS_SFTP_LICENSE_FILES = LICENSE.md
 KODI_VFS_SFTP_DEPENDENCIES = kodi-platform libplatform libssh
 
 $(eval $(cmake-package))
