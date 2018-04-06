From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 6 Apr 2018 22:21:42 +0200
Subject: [Buildroot] [git commit] libglib2: bump to 2.56.0
Message-ID: <20180406202239.54D4187767@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6637ee635ead33c4672551be843d35464bc9e544
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libglib2/libglib2.hash | 4 ++--
 package/libglib2/libglib2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libglib2/libglib2.hash b/package/libglib2/libglib2.hash
index cf1c9557f8..b957bf4b10 100644
--- a/package/libglib2/libglib2.hash
+++ b/package/libglib2/libglib2.hash
@@ -1,4 +1,4 @@
-# https://download.gnome.org/sources/glib/2.54/glib-2.54.2.sha256sum
-sha256  bb89e5c5aad33169a8c7f28b45671c7899c12f74caf707737f784d7102758e6c  glib-2.54.2.tar.xz
+# https://download.gnome.org/sources/glib/2.56/glib-2.56.0.sha256sum
+sha256  ecef6e17e97b8d9150d0e8a4b3edee1ac37331213b8a2a87a083deea408a0fc7  glib-2.56.0.tar.xz
 # License files, locally calculated
 sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index 097c980393..41ec7ee377 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBGLIB2_VERSION_MAJOR = 2.54
-LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).2
+LIBGLIB2_VERSION_MAJOR = 2.56
+LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).0
 LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.xz
 LIBGLIB2_SITE = http://ftp.gnome.org/pub/gnome/sources/glib/$(LIBGLIB2_VERSION_MAJOR)
 LIBGLIB2_LICENSE = LGPL-2.0+
