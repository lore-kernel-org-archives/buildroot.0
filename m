From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 31 Oct 2019 22:01:07 +0100
Subject: [Buildroot] [git commit] package/kodi-vfs-sftp: bump version to
 1.0.3
Message-ID: <20191031205540.CAF9F8E32A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7fa856caea2f116de52c3c28dc2012d2c86de34e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kodi-vfs-sftp/kodi-vfs-sftp.hash | 2 +-
 package/kodi-vfs-sftp/kodi-vfs-sftp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-vfs-sftp/kodi-vfs-sftp.hash b/package/kodi-vfs-sftp/kodi-vfs-sftp.hash
index f90bc6d105..dbf8231038 100644
--- a/package/kodi-vfs-sftp/kodi-vfs-sftp.hash
+++ b/package/kodi-vfs-sftp/kodi-vfs-sftp.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 6cfc59f322d1bce2dfc14daad0ae84fbc105f7543216413b9c208af821d92308  kodi-vfs-sftp-4e385ae0f82c062add44bce4a2d6a9058a3e0f48.tar.gz
+sha256 f78561c460c7bf67be476eb485eaa0ac4497a6d1831b9955da46daa11219f53b  kodi-vfs-sftp-1.0.3-Leia.tar.gz
 sha256 2b1cdc44ec0b52abc2e4b61f827d407388dad49e4fdc25370824b5c21aadeb17  src/SFTPFile.cpp
diff --git a/package/kodi-vfs-sftp/kodi-vfs-sftp.mk b/package/kodi-vfs-sftp/kodi-vfs-sftp.mk
index a5ba1acf18..eaaf7a2cb2 100644
--- a/package/kodi-vfs-sftp/kodi-vfs-sftp.mk
+++ b/package/kodi-vfs-sftp/kodi-vfs-sftp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_VFS_SFTP_VERSION = 4e385ae0f82c062add44bce4a2d6a9058a3e0f48
+KODI_VFS_SFTP_VERSION = 1.0.3-Leia
 KODI_VFS_SFTP_SITE = $(call github,xbmc,vfs.sftp,$(KODI_VFS_SFTP_VERSION))
 KODI_VFS_SFTP_LICENSE = GPL-2.0+
 KODI_VFS_SFTP_LICENSE_FILES = src/SFTPFile.cpp
