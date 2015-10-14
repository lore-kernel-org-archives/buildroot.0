From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Oct 2015 22:28:01 +0200
Subject: [Buildroot] [git commit] libglib2: bump to version 2.46.1
Message-ID: <20151014202845.AD13281EB0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7a80202a851d71bf31a3daf45a6a750925ffc530
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libglib2/libglib2.hash |    4 ++--
 package/libglib2/libglib2.mk   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libglib2/libglib2.hash b/package/libglib2/libglib2.hash
index 9a54c3f..6032c30 100644
--- a/package/libglib2/libglib2.hash
+++ b/package/libglib2/libglib2.hash
@@ -1,2 +1,2 @@
-# https://download.gnome.org/sources/glib/2.46/glib-2.46.0.sha256sum
-sha256  b1cee83469ae7d80f17c267c37f090414e93960bd62d2b254a5a96fbc5baacb4  glib-2.46.0.tar.xz
+# https://download.gnome.org/sources/glib/2.46/glib-2.46.1.sha256sum
+sha256  5a1f03b952ebc3a7e9f612b8724f70898183e31503db329b4f15d07163c8fdfb  glib-2.46.1.tar.xz
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index b62e8b0..f9fbade 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBGLIB2_VERSION_MAJOR = 2.46
-LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).0
+LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).1
 LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.xz
 LIBGLIB2_SITE = http://ftp.gnome.org/pub/gnome/sources/glib/$(LIBGLIB2_VERSION_MAJOR)
 LIBGLIB2_LICENSE = LGPLv2+
