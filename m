From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 15 Jul 2020 23:28:52 +0200
Subject: [Buildroot] [git commit] package/libglib2: bump version to 2.64.4
Message-ID: <20200715212459.6187986D78@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bee1675d1ac1a55e1f71aeb1b66f59dd72053a85
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libglib2/0003-remove-cpp-requirement.patch | 2 +-
 package/libglib2/libglib2.hash                     | 4 ++--
 package/libglib2/libglib2.mk                       | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libglib2/0003-remove-cpp-requirement.patch b/package/libglib2/0003-remove-cpp-requirement.patch
index 4f06ad588d..7e447a9efc 100644
--- a/package/libglib2/0003-remove-cpp-requirement.patch
+++ b/package/libglib2/0003-remove-cpp-requirement.patch
@@ -35,7 +35,7 @@ index 4bbf4c2..ac59f4e 100644
 @@ -1,4 +1,4 @@
 -project('glib', 'c', 'cpp',
 +project('glib', 'c',
-   version : '2.64.3',
+   version : '2.64.4',
    # NOTE: We keep this pinned at 0.49 because that's what Debian 10 ships
    meson_version : '>= 0.49.2',
 @@ -10,7 +10,6 @@ project('glib', 'c', 'cpp',
diff --git a/package/libglib2/libglib2.hash b/package/libglib2/libglib2.hash
index 4e9b25165e..55f0bb1678 100644
--- a/package/libglib2/libglib2.hash
+++ b/package/libglib2/libglib2.hash
@@ -1,4 +1,4 @@
-# https://download.gnome.org/sources/glib/2.64/glib-2.64.3.sha256sum
-sha256  fe9cbc97925d14c804935f067a3ad77ef55c0bbe9befe68962318f5a767ceb22  glib-2.64.3.tar.xz
+# https://download.gnome.org/sources/glib/2.64/glib-2.64.4.sha256sum
+sha256  f7e0b325b272281f0462e0f7fff25a833820cac19911ff677251daf6d87bce50  glib-2.64.4.tar.xz
 # License files, locally calculated
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index d1c75d8a43..fda04334f5 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBGLIB2_VERSION_MAJOR = 2.64
-LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).3
+LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).4
 LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.xz
 LIBGLIB2_SITE = http://ftp.gnome.org/pub/gnome/sources/glib/$(LIBGLIB2_VERSION_MAJOR)
 LIBGLIB2_LICENSE = LGPL-2.1+
