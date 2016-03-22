From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Mar 2016 20:19:04 +0100
Subject: [Buildroot] [git commit] gvfs: bump to version 1.28.0
Message-ID: <20160322191927.0552881851@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fdcfc771a44d793110f0dc072ce306b63c3285eb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gvfs/gvfs.hash | 4 ++--
 package/gvfs/gvfs.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/gvfs/gvfs.hash b/package/gvfs/gvfs.hash
index 5cc8857..38afe7b 100644
--- a/package/gvfs/gvfs.hash
+++ b/package/gvfs/gvfs.hash
@@ -1,2 +1,2 @@
-# From http://ftp.gnome.org/pub/GNOME/sources/gvfs/1.26/gvfs-1.26.3.sha256sum
-sha256	a70f75fa60d66f3f478c0c8aec43d0e43455a8cc75a4dfa8029e51c816401b4a	gvfs-1.26.3.tar.xz
+# From http://ftp.gnome.org/pub/GNOME/sources/gvfs/1.28/gvfs-1.28.0.sha256sum
+sha256	cf72fc0adf0ca702ead5b3fab3c1fa46b09678eb7c1290de7e30bb7cbaf5f704	gvfs-1.28.0.tar.xz
diff --git a/package/gvfs/gvfs.mk b/package/gvfs/gvfs.mk
index f566fc7..f63d9dc 100644
--- a/package/gvfs/gvfs.mk
+++ b/package/gvfs/gvfs.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-GVFS_VERSION_MAJOR = 1.26
-GVFS_VERSION = $(GVFS_VERSION_MAJOR).3
+GVFS_VERSION_MAJOR = 1.28
+GVFS_VERSION = $(GVFS_VERSION_MAJOR).0
 GVFS_SOURCE = gvfs-$(GVFS_VERSION).tar.xz
 GVFS_SITE = http://ftp.gnome.org/pub/GNOME/sources/gvfs/$(GVFS_VERSION_MAJOR)
 GVFS_INSTALL_STAGING = YES
