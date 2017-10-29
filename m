From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Oct 2017 18:25:59 +0100
Subject: [Buildroot] [git commit] package/libnfs: bump version to 2.0.0
Message-ID: <20171029172109.1E2AE805E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=271b8e19c634f1b3e6a60239ca2aa717e9822eb1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libnfs/libnfs.hash | 3 ++-
 package/libnfs/libnfs.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/libnfs/libnfs.hash b/package/libnfs/libnfs.hash
index 27a9e5d..cfe6678 100644
--- a/package/libnfs/libnfs.hash
+++ b/package/libnfs/libnfs.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256	7f6c62a05c7e0f0749f2b13f178a4ed7aaf17bd09e65a10bb147bfe9807da272	libnfs-libnfs-1.10.0.tar.gz
+sha256 7ea6cd8fa6c461d01091e584d424d28e137d23ff4b65b95d01a3fd0ef95d120e  libnfs-libnfs-2.0.0.tar.gz
+sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENCE-LGPL-2.1.txt
diff --git a/package/libnfs/libnfs.mk b/package/libnfs/libnfs.mk
index b66a9be..3636a2a 100644
--- a/package/libnfs/libnfs.mk
+++ b/package/libnfs/libnfs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNFS_VERSION = libnfs-1.10.0
+LIBNFS_VERSION = libnfs-2.0.0
 LIBNFS_SITE = $(call github,sahlberg,libnfs,$(LIBNFS_VERSION))
 LIBNFS_INSTALL_STAGING = YES
 LIBNFS_AUTORECONF = YES
