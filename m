From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 Nov 2015 15:11:41 +0100
Subject: [Buildroot] [git commit branch/next] gvfs: bump to version 1.26.2
Message-ID: <20151111141413.D2DF67FCBE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2db62b3164b6b14a7a83baecc51c355def70bdd8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gvfs/gvfs.hash |    4 ++--
 package/gvfs/gvfs.mk   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gvfs/gvfs.hash b/package/gvfs/gvfs.hash
index cc9e4f6..19e820a 100644
--- a/package/gvfs/gvfs.hash
+++ b/package/gvfs/gvfs.hash
@@ -1,2 +1,2 @@
-# From http://ftp.gnome.org/pub/GNOME/sources/gvfs/1.26/gvfs-1.26.1.1.sha256sum
-sha256	2dadf986e464db1d7f007b178a5432b30ba93ef0cb31a2795156540d496dc06d	gvfs-1.26.1.1.tar.xz
+# From http://ftp.gnome.org/pub/GNOME/sources/gvfs/1.26/gvfs-1.26.2.sha256sum
+sha256	695b6e0f3de5ac2cb4d188917edef3f13299328150a2413f1a7131d9b2d48d18	gvfs-1.26.2.tar.xz
diff --git a/package/gvfs/gvfs.mk b/package/gvfs/gvfs.mk
index e1da18f..48d2b50 100644
--- a/package/gvfs/gvfs.mk
+++ b/package/gvfs/gvfs.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GVFS_VERSION_MAJOR = 1.26
-GVFS_VERSION = $(GVFS_VERSION_MAJOR).1.1
+GVFS_VERSION = $(GVFS_VERSION_MAJOR).2
 GVFS_SOURCE = gvfs-$(GVFS_VERSION).tar.xz
 GVFS_SITE = http://ftp.gnome.org/pub/GNOME/sources/gvfs/$(GVFS_VERSION_MAJOR)
 GVFS_INSTALL_STAGING = YES
