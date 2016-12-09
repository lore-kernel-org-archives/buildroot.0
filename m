From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 9 Dec 2016 18:12:18 +0100
Subject: [Buildroot] [git commit] gvfs: bump to version 1.30.2
Message-ID: <20161209171846.60F6F80102@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c35dfdb0379215f2d1d9deacc78ba154ef137a37
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gvfs/gvfs.hash | 4 ++--
 package/gvfs/gvfs.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gvfs/gvfs.hash b/package/gvfs/gvfs.hash
index f54d239..82e29b9 100644
--- a/package/gvfs/gvfs.hash
+++ b/package/gvfs/gvfs.hash
@@ -1,2 +1,2 @@
-# From http://ftp.gnome.org/pub/GNOME/sources/gvfs/1.30/gvfs-1.30.1.1.sha256sum
-sha256	585b5de66eb99a09c020f34955db31e4764c8260a8afbb761ae264a958152ecc	gvfs-1.30.1.1.tar.xz
+# From http://ftp.gnome.org/pub/GNOME/sources/gvfs/1.30/gvfs-1.30.2.sha256sum
+sha256	dd897a13af0728765baead44426e2cf968cd2c9caad3bee4d589970f7612c5d7	gvfs-1.30.2.tar.xz
diff --git a/package/gvfs/gvfs.mk b/package/gvfs/gvfs.mk
index 60bfb59..ae2709c 100644
--- a/package/gvfs/gvfs.mk
+++ b/package/gvfs/gvfs.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GVFS_VERSION_MAJOR = 1.30
-GVFS_VERSION = $(GVFS_VERSION_MAJOR).1.1
+GVFS_VERSION = $(GVFS_VERSION_MAJOR).2
 GVFS_SOURCE = gvfs-$(GVFS_VERSION).tar.xz
 GVFS_SITE = http://ftp.gnome.org/pub/GNOME/sources/gvfs/$(GVFS_VERSION_MAJOR)
 GVFS_INSTALL_STAGING = YES
