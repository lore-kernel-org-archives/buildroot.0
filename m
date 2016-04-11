From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 11 Apr 2016 15:12:28 -0300
Subject: [Buildroot] [PATCH] gvfs: bump to version 1.28.1
Message-ID: <1460398348-31810-1-git-send-email-gustavo@zacarias.com.ar>
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
index 38afe7b..66411c1 100644
--- a/package/gvfs/gvfs.hash
+++ b/package/gvfs/gvfs.hash
@@ -1,2 +1,2 @@
-# From http://ftp.gnome.org/pub/GNOME/sources/gvfs/1.28/gvfs-1.28.0.sha256sum
-sha256	cf72fc0adf0ca702ead5b3fab3c1fa46b09678eb7c1290de7e30bb7cbaf5f704	gvfs-1.28.0.tar.xz
+# From http://ftp.gnome.org/pub/GNOME/sources/gvfs/1.28/gvfs-1.28.1.sha256sum
+sha256	4ecfe5ac35c1b3e61d6abddc98902b6c7faf243308c60b165f01990783f17999	gvfs-1.28.1.tar.xz
diff --git a/package/gvfs/gvfs.mk b/package/gvfs/gvfs.mk
index f63d9dc..5bf35fc 100644
--- a/package/gvfs/gvfs.mk
+++ b/package/gvfs/gvfs.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GVFS_VERSION_MAJOR = 1.28
-GVFS_VERSION = $(GVFS_VERSION_MAJOR).0
+GVFS_VERSION = $(GVFS_VERSION_MAJOR).1
 GVFS_SOURCE = gvfs-$(GVFS_VERSION).tar.xz
 GVFS_SITE = http://ftp.gnome.org/pub/GNOME/sources/gvfs/$(GVFS_VERSION_MAJOR)
 GVFS_INSTALL_STAGING = YES
-- 
2.7.3
