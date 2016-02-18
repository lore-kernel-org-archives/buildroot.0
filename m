From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 18 Feb 2016 12:08:51 -0300
Subject: [Buildroot] [PATCH] gvfs: bump to version 1.26.3
Message-ID: <1455808131-19134-1-git-send-email-gustavo@zacarias.com.ar>
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
index 19e820a..5cc8857 100644
--- a/package/gvfs/gvfs.hash
+++ b/package/gvfs/gvfs.hash
@@ -1,2 +1,2 @@
-# From http://ftp.gnome.org/pub/GNOME/sources/gvfs/1.26/gvfs-1.26.2.sha256sum
-sha256	695b6e0f3de5ac2cb4d188917edef3f13299328150a2413f1a7131d9b2d48d18	gvfs-1.26.2.tar.xz
+# From http://ftp.gnome.org/pub/GNOME/sources/gvfs/1.26/gvfs-1.26.3.sha256sum
+sha256	a70f75fa60d66f3f478c0c8aec43d0e43455a8cc75a4dfa8029e51c816401b4a	gvfs-1.26.3.tar.xz
diff --git a/package/gvfs/gvfs.mk b/package/gvfs/gvfs.mk
index 48d2b50..f566fc7 100644
--- a/package/gvfs/gvfs.mk
+++ b/package/gvfs/gvfs.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GVFS_VERSION_MAJOR = 1.26
-GVFS_VERSION = $(GVFS_VERSION_MAJOR).2
+GVFS_VERSION = $(GVFS_VERSION_MAJOR).3
 GVFS_SOURCE = gvfs-$(GVFS_VERSION).tar.xz
 GVFS_SITE = http://ftp.gnome.org/pub/GNOME/sources/gvfs/$(GVFS_VERSION_MAJOR)
 GVFS_INSTALL_STAGING = YES
-- 
2.4.10
