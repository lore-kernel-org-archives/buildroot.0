From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 17 Dec 2016 08:40:36 +0100
Subject: [Buildroot] [git commit] gvfs: bump to version 1.30.3
Message-ID: <20161217081950.45FD581898@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e47b26e3c0703ee91719201f2dc3ec1e8b48b589
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gvfs/gvfs.hash | 4 ++--
 package/gvfs/gvfs.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gvfs/gvfs.hash b/package/gvfs/gvfs.hash
index 82e29b9..63ad77d 100644
--- a/package/gvfs/gvfs.hash
+++ b/package/gvfs/gvfs.hash
@@ -1,2 +1,2 @@
-# From http://ftp.gnome.org/pub/GNOME/sources/gvfs/1.30/gvfs-1.30.2.sha256sum
-sha256	dd897a13af0728765baead44426e2cf968cd2c9caad3bee4d589970f7612c5d7	gvfs-1.30.2.tar.xz
+# From http://ftp.gnome.org/pub/GNOME/sources/gvfs/1.30/gvfs-1.30.3.sha256sum
+sha256	b824a29489cae7f39e1a0fc0d154ac7b7bf43d8edd98ba83ffcad2f766d0f175	gvfs-1.30.3.tar.xz
diff --git a/package/gvfs/gvfs.mk b/package/gvfs/gvfs.mk
index ae2709c..f3b5fc4 100644
--- a/package/gvfs/gvfs.mk
+++ b/package/gvfs/gvfs.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GVFS_VERSION_MAJOR = 1.30
-GVFS_VERSION = $(GVFS_VERSION_MAJOR).2
+GVFS_VERSION = $(GVFS_VERSION_MAJOR).3
 GVFS_SOURCE = gvfs-$(GVFS_VERSION).tar.xz
 GVFS_SITE = http://ftp.gnome.org/pub/GNOME/sources/gvfs/$(GVFS_VERSION_MAJOR)
 GVFS_INSTALL_STAGING = YES
