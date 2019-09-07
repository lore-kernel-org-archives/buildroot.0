From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 7 Sep 2019 14:30:12 +0200
Subject: [Buildroot] [git commit] package/libglib2: bump to version 2.60.7
Message-ID: <20190907122732.134358B80D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bdc1bdf3a9a21ce141e33312a3b312adad2623db
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libglib2/0003-remove-cpp-requirement.patch | 2 +-
 package/libglib2/libglib2.hash                     | 2 +-
 package/libglib2/libglib2.mk                       | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libglib2/0003-remove-cpp-requirement.patch b/package/libglib2/0003-remove-cpp-requirement.patch
index f418369476..444ed2464c 100644
--- a/package/libglib2/0003-remove-cpp-requirement.patch
+++ b/package/libglib2/0003-remove-cpp-requirement.patch
@@ -35,7 +35,7 @@ index c96289a..b694bb7 100644
 @@ -1,4 +1,4 @@
 -project('glib', 'c', 'cpp',
 +project('glib', 'c',
-   version : '2.60.6',
+   version : '2.60.7',
    meson_version : '>= 0.48.0',
    default_options : [
 @@ -9,7 +9,6 @@ project('glib', 'c', 'cpp',
diff --git a/package/libglib2/libglib2.hash b/package/libglib2/libglib2.hash
index ee8bd5bd6d..39d880ee1d 100644
--- a/package/libglib2/libglib2.hash
+++ b/package/libglib2/libglib2.hash
@@ -1,4 +1,4 @@
 # https://download.gnome.org/sources/glib/2.60/glib-2.60.6.sha256sum
-sha256  ff8fab8d8deaa4fd0536c90f90d9769a09071779c7e6183907f6855645bffb6c  glib-2.60.6.tar.xz
+sha256  8b12c0af569afd3b71200556ad751bad4cf4bf7bc4b5f880638459a42ca86310  glib-2.60.7.tar.xz
 # License files, locally calculated
 sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index 4f8de31e99..f2f752851a 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBGLIB2_VERSION_MAJOR = 2.60
-LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).6
+LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).7
 LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.xz
 LIBGLIB2_SITE = http://ftp.gnome.org/pub/gnome/sources/glib/$(LIBGLIB2_VERSION_MAJOR)
 LIBGLIB2_LICENSE = LGPL-2.1+
