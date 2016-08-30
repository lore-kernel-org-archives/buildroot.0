From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 30 Aug 2016 08:37:11 +0200
Subject: [Buildroot] [git commit] gvfs: bump to version 1.28.3
Message-ID: <20160902142941.5DB767FA6D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3e1a10746303a61dac219939be870231b2621f9c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gvfs/gvfs.hash | 4 ++--
 package/gvfs/gvfs.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gvfs/gvfs.hash b/package/gvfs/gvfs.hash
index 1fec32c..440671f 100644
--- a/package/gvfs/gvfs.hash
+++ b/package/gvfs/gvfs.hash
@@ -1,2 +1,2 @@
-# From http://ftp.gnome.org/pub/GNOME/sources/gvfs/1.28/gvfs-1.28.2.sha256sum
-sha256	bc6af45cff7e7e8d33c3a4be1d27e479f10f80105a6f2d1fae75c5c0d40636d9	gvfs-1.28.2.tar.xz
+# From http://ftp.gnome.org/pub/GNOME/sources/gvfs/1.28/gvfs-1.28.3.sha256sum
+sha256	458c4cb68570f6ef4a9e152995c62d0057c3e0a07ed64d84c7200cdd22f0bd17	gvfs-1.28.3.tar.xz
diff --git a/package/gvfs/gvfs.mk b/package/gvfs/gvfs.mk
index 8e88573..e2947fd 100644
--- a/package/gvfs/gvfs.mk
+++ b/package/gvfs/gvfs.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GVFS_VERSION_MAJOR = 1.28
-GVFS_VERSION = $(GVFS_VERSION_MAJOR).2
+GVFS_VERSION = $(GVFS_VERSION_MAJOR).3
 GVFS_SOURCE = gvfs-$(GVFS_VERSION).tar.xz
 GVFS_SITE = http://ftp.gnome.org/pub/GNOME/sources/gvfs/$(GVFS_VERSION_MAJOR)
 GVFS_INSTALL_STAGING = YES
