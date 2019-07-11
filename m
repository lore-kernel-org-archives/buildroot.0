From: aduskett at gmail.com <aduskett@gmail.com>
Date: Thu, 11 Jul 2019 11:10:19 -0400
Subject: [Buildroot] [PATCH 1/1] package/libglib2: bump to version 2.60.5
Message-ID: <20190711151020.55218-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/libglib2/0003-remove-cpp-requirement.patch | 2 +-
 package/libglib2/libglib2.hash                     | 4 ++--
 package/libglib2/libglib2.mk                       | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libglib2/0003-remove-cpp-requirement.patch b/package/libglib2/0003-remove-cpp-requirement.patch
index e7e48f1a8b..808e1b560a 100644
--- a/package/libglib2/0003-remove-cpp-requirement.patch
+++ b/package/libglib2/0003-remove-cpp-requirement.patch
@@ -35,7 +35,7 @@ index c96289a..b694bb7 100644
 @@ -1,4 +1,4 @@
 -project('glib', 'c', 'cpp',
 +project('glib', 'c',
-   version : '2.60.4',
+   version : '2.60.5',
    meson_version : '>= 0.48.0',
    default_options : [
 @@ -9,7 +9,6 @@ project('glib', 'c', 'cpp',
diff --git a/package/libglib2/libglib2.hash b/package/libglib2/libglib2.hash
index 6cbcba702a..679a7715d7 100644
--- a/package/libglib2/libglib2.hash
+++ b/package/libglib2/libglib2.hash
@@ -1,4 +1,4 @@
-# https://download.gnome.org/sources/glib/2.60/glib-2.60.4.sha256sum
-sha256  2b941ec5dcb92e5ea83fe42f9eb55a827bc8a12c153ad2489d551c31d04733dd  glib-2.60.4.tar.xz
+# https://download.gnome.org/sources/glib/2.60/glib-2.60.5.sha256sum
+sha256  3edf1df576ee82b2ecb8ba85c343644e48ee62e68290e71e6084b00d6ba2622e  glib-2.60.5.tar.xz
 # License files, locally calculated
 sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index 38941ca79d..39021757b5 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBGLIB2_VERSION_MAJOR = 2.60
-LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).4
+LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).5
 LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.xz
 LIBGLIB2_SITE = http://ftp.gnome.org/pub/gnome/sources/glib/$(LIBGLIB2_VERSION_MAJOR)
 LIBGLIB2_LICENSE = LGPL-2.1+
-- 
2.21.0
