From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 30 Jul 2019 17:27:51 +0200
Subject: [Buildroot] [git commit] package/libglib2: bump to version 2.60.6
Message-ID: <20190730155429.7CE188868B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=45a63abf1a9b194ae695e464e9bc986e357a33e4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libglib2/0003-remove-cpp-requirement.patch | 2 +-
 package/libglib2/libglib2.hash                     | 4 ++--
 package/libglib2/libglib2.mk                       | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libglib2/0003-remove-cpp-requirement.patch b/package/libglib2/0003-remove-cpp-requirement.patch
index 808e1b560a..f418369476 100644
--- a/package/libglib2/0003-remove-cpp-requirement.patch
+++ b/package/libglib2/0003-remove-cpp-requirement.patch
@@ -35,7 +35,7 @@ index c96289a..b694bb7 100644
 @@ -1,4 +1,4 @@
 -project('glib', 'c', 'cpp',
 +project('glib', 'c',
-   version : '2.60.5',
+   version : '2.60.6',
    meson_version : '>= 0.48.0',
    default_options : [
 @@ -9,7 +9,6 @@ project('glib', 'c', 'cpp',
diff --git a/package/libglib2/libglib2.hash b/package/libglib2/libglib2.hash
index 679a7715d7..ee8bd5bd6d 100644
--- a/package/libglib2/libglib2.hash
+++ b/package/libglib2/libglib2.hash
@@ -1,4 +1,4 @@
-# https://download.gnome.org/sources/glib/2.60/glib-2.60.5.sha256sum
-sha256  3edf1df576ee82b2ecb8ba85c343644e48ee62e68290e71e6084b00d6ba2622e  glib-2.60.5.tar.xz
+# https://download.gnome.org/sources/glib/2.60/glib-2.60.6.sha256sum
+sha256  ff8fab8d8deaa4fd0536c90f90d9769a09071779c7e6183907f6855645bffb6c  glib-2.60.6.tar.xz
 # License files, locally calculated
 sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index 39021757b5..4f8de31e99 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBGLIB2_VERSION_MAJOR = 2.60
-LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).5
+LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).6
 LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.xz
 LIBGLIB2_SITE = http://ftp.gnome.org/pub/gnome/sources/glib/$(LIBGLIB2_VERSION_MAJOR)
 LIBGLIB2_LICENSE = LGPL-2.1+
