From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 12 Oct 2016 13:56:00 +0200
Subject: [Buildroot] [git commit] gvfs: bump to version 1.30.1
Message-ID: <20161012115607.5789982275@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=59fe141496f95d5db91039e8a018ea4964ac3c5d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gvfs/gvfs.hash | 4 ++--
 package/gvfs/gvfs.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gvfs/gvfs.hash b/package/gvfs/gvfs.hash
index 9c53487..a7f0b89 100644
--- a/package/gvfs/gvfs.hash
+++ b/package/gvfs/gvfs.hash
@@ -1,2 +1,2 @@
-# From http://ftp.gnome.org/pub/GNOME/sources/gvfs/1.30/gvfs-1.30.0.sha256sum
-sha256	2285d387213eef528f09df4b113d9d2e54ce7108c50587355d07f2a885840da4	gvfs-1.30.0.tar.xz
+# From http://ftp.gnome.org/pub/GNOME/sources/gvfs/1.30/gvfs-1.30.1.sha256sum
+sha256	e752e7bb46e64e4025f63428d4f5247e3e5c0d0b5eeb4f81dbf1cd7b75f59d7b	gvfs-1.30.1.tar.xz
diff --git a/package/gvfs/gvfs.mk b/package/gvfs/gvfs.mk
index 50a2fa2..897b1a9 100644
--- a/package/gvfs/gvfs.mk
+++ b/package/gvfs/gvfs.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GVFS_VERSION_MAJOR = 1.30
-GVFS_VERSION = $(GVFS_VERSION_MAJOR).0
+GVFS_VERSION = $(GVFS_VERSION_MAJOR).1
 GVFS_SOURCE = gvfs-$(GVFS_VERSION).tar.xz
 GVFS_SITE = http://ftp.gnome.org/pub/GNOME/sources/gvfs/$(GVFS_VERSION_MAJOR)
 GVFS_INSTALL_STAGING = YES
