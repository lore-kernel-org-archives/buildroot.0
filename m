From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 9 May 2016 22:23:17 +0200
Subject: [Buildroot] [git commit] gvfs: bump to version 1.28.2
Message-ID: <20160509202324.D64FC81D32@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5d4b8cfb725450001bc0d52d7ea565c5602e738c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gvfs/gvfs.hash | 4 ++--
 package/gvfs/gvfs.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gvfs/gvfs.hash b/package/gvfs/gvfs.hash
index 66411c1..1fec32c 100644
--- a/package/gvfs/gvfs.hash
+++ b/package/gvfs/gvfs.hash
@@ -1,2 +1,2 @@
-# From http://ftp.gnome.org/pub/GNOME/sources/gvfs/1.28/gvfs-1.28.1.sha256sum
-sha256	4ecfe5ac35c1b3e61d6abddc98902b6c7faf243308c60b165f01990783f17999	gvfs-1.28.1.tar.xz
+# From http://ftp.gnome.org/pub/GNOME/sources/gvfs/1.28/gvfs-1.28.2.sha256sum
+sha256	bc6af45cff7e7e8d33c3a4be1d27e479f10f80105a6f2d1fae75c5c0d40636d9	gvfs-1.28.2.tar.xz
diff --git a/package/gvfs/gvfs.mk b/package/gvfs/gvfs.mk
index 5bf35fc..8e88573 100644
--- a/package/gvfs/gvfs.mk
+++ b/package/gvfs/gvfs.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GVFS_VERSION_MAJOR = 1.28
-GVFS_VERSION = $(GVFS_VERSION_MAJOR).1
+GVFS_VERSION = $(GVFS_VERSION_MAJOR).2
 GVFS_SOURCE = gvfs-$(GVFS_VERSION).tar.xz
 GVFS_SITE = http://ftp.gnome.org/pub/GNOME/sources/gvfs/$(GVFS_VERSION_MAJOR)
 GVFS_INSTALL_STAGING = YES
