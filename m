From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 18 Jan 2020 21:06:20 +0100
Subject: [Buildroot] [PATCH v8 20/20] package/kodi-vfs-sftp: bump version
In-Reply-To: <20200118200620.3967240-1-bernd.kuhls@t-online.de>
References: <20200118200620.3967240-1-bernd.kuhls@t-online.de>
Message-ID: <20200118200620.3967240-21-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-vfs-sftp/kodi-vfs-sftp.hash | 3 +--
 package/kodi-vfs-sftp/kodi-vfs-sftp.mk   | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/kodi-vfs-sftp/kodi-vfs-sftp.hash b/package/kodi-vfs-sftp/kodi-vfs-sftp.hash
index dbf8231038..ba7804b3ce 100644
--- a/package/kodi-vfs-sftp/kodi-vfs-sftp.hash
+++ b/package/kodi-vfs-sftp/kodi-vfs-sftp.hash
@@ -1,3 +1,2 @@
 # Locally computed
-sha256 f78561c460c7bf67be476eb485eaa0ac4497a6d1831b9955da46daa11219f53b  kodi-vfs-sftp-1.0.3-Leia.tar.gz
-sha256 2b1cdc44ec0b52abc2e4b61f827d407388dad49e4fdc25370824b5c21aadeb17  src/SFTPFile.cpp
+sha256 6a6d7fc777f574746bcc34b618700a4db3981aee470b68d60c3407eeeb0c16d9  kodi-vfs-sftp-1.0.5-Leia.tar.gz
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
-- 
2.20.1
