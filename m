From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 19 Oct 2016 07:05:18 -0300
Subject: [Buildroot] [PATCH] gvfs: bump to version 1.30.1.1
Message-ID: <1476871518-736-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gvfs/gvfs.hash | 4 ++--
 package/gvfs/gvfs.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gvfs/gvfs.hash b/package/gvfs/gvfs.hash
index a7f0b89..f54d239 100644
--- a/package/gvfs/gvfs.hash
+++ b/package/gvfs/gvfs.hash
@@ -1,2 +1,2 @@
-# From http://ftp.gnome.org/pub/GNOME/sources/gvfs/1.30/gvfs-1.30.1.sha256sum
-sha256	e752e7bb46e64e4025f63428d4f5247e3e5c0d0b5eeb4f81dbf1cd7b75f59d7b	gvfs-1.30.1.tar.xz
+# From http://ftp.gnome.org/pub/GNOME/sources/gvfs/1.30/gvfs-1.30.1.1.sha256sum
+sha256	585b5de66eb99a09c020f34955db31e4764c8260a8afbb761ae264a958152ecc	gvfs-1.30.1.1.tar.xz
diff --git a/package/gvfs/gvfs.mk b/package/gvfs/gvfs.mk
index 897b1a9..60bfb59 100644
--- a/package/gvfs/gvfs.mk
+++ b/package/gvfs/gvfs.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GVFS_VERSION_MAJOR = 1.30
-GVFS_VERSION = $(GVFS_VERSION_MAJOR).1
+GVFS_VERSION = $(GVFS_VERSION_MAJOR).1.1
 GVFS_SOURCE = gvfs-$(GVFS_VERSION).tar.xz
 GVFS_SITE = http://ftp.gnome.org/pub/GNOME/sources/gvfs/$(GVFS_VERSION_MAJOR)
 GVFS_INSTALL_STAGING = YES
-- 
2.7.3
