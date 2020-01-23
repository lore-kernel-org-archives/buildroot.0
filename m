From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 23 Jan 2020 01:04:03 +0100
Subject: [Buildroot] [git commit] package/kodi-vfs-sftp: bump version
Message-ID: <20200122235422.0D7BB81427@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=27ea062ad0680626abc5822f2bfe7793be7cbeef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License hash has changed because it is a source file, but also because
the name changed from XBMC to Kodi, and the year bumped to 2019.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/kodi-vfs-sftp/kodi-vfs-sftp.hash | 4 ++--
 package/kodi-vfs-sftp/kodi-vfs-sftp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/kodi-vfs-sftp/kodi-vfs-sftp.hash b/package/kodi-vfs-sftp/kodi-vfs-sftp.hash
index dbf8231038..08115847bb 100644
--- a/package/kodi-vfs-sftp/kodi-vfs-sftp.hash
+++ b/package/kodi-vfs-sftp/kodi-vfs-sftp.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 f78561c460c7bf67be476eb485eaa0ac4497a6d1831b9955da46daa11219f53b  kodi-vfs-sftp-1.0.3-Leia.tar.gz
-sha256 2b1cdc44ec0b52abc2e4b61f827d407388dad49e4fdc25370824b5c21aadeb17  src/SFTPFile.cpp
+sha256 6a6d7fc777f574746bcc34b618700a4db3981aee470b68d60c3407eeeb0c16d9  kodi-vfs-sftp-1.0.5-Leia.tar.gz
+sha256 394c58f6cf5e728770c1ac7ea7d509fa54f950cad6e757a9f093344f5230b7b9  src/SFTPFile.cpp
diff --git a/package/kodi-vfs-sftp/kodi-vfs-sftp.mk b/package/kodi-vfs-sftp/kodi-vfs-sftp.mk
index eaaf7a2cb2..8657ebdcef 100644
--- a/package/kodi-vfs-sftp/kodi-vfs-sftp.mk
+++ b/package/kodi-vfs-sftp/kodi-vfs-sftp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_VFS_SFTP_VERSION = 1.0.3-Leia
+KODI_VFS_SFTP_VERSION = 1.0.5-Leia
 KODI_VFS_SFTP_SITE = $(call github,xbmc,vfs.sftp,$(KODI_VFS_SFTP_VERSION))
 KODI_VFS_SFTP_LICENSE = GPL-2.0+
 KODI_VFS_SFTP_LICENSE_FILES = src/SFTPFile.cpp
