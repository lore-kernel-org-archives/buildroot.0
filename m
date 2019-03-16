From: Petr Vorel <petr.vorel@gmail.com>
Date: Sat, 16 Mar 2019 16:42:38 +0100
Subject: [Buildroot] [RFC PATCH v3 1/1] libglib2: Bump to version 2.56.4
Message-ID: <20190316154238.864-1-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Hi,

using still 2.56.x, but I'll have a look into 2.60.x, whether it suffers the
same problem as 2.58.x [1] [2]


Kind regards,
Petr

[1] https://git.buildroot.org/buildroot/commit/package/libglib2?id=2694222c3d3663d9fcc55e6cf44a45b74b43793f
[2] http://lists.busybox.net/pipermail/buildroot/2018-December/237663.html
---
 package/libglib2/libglib2.hash | 4 ++--
 package/libglib2/libglib2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libglib2/libglib2.hash b/package/libglib2/libglib2.hash
index 57403a2154..faa01ef563 100644
--- a/package/libglib2/libglib2.hash
+++ b/package/libglib2/libglib2.hash
@@ -1,4 +1,4 @@
-# https://download.gnome.org/sources/glib/2.56/glib-2.56.3.sha256sum
-sha256  a9a4c5b4c81b6c75bc140bdf5e32120ef3ce841b7413214ecf5f987acec74cb2  glib-2.56.3.tar.xz
+# https://download.gnome.org/sources/glib/2.56/glib-2.56.4.sha256sum
+sha256  27f703d125efb07f8a743666b580df0b4095c59fc8750e8890132c91d437504c  glib-2.56.4.tar.xz
 # License files, locally calculated
 sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index f602c371f5..d34bfabd52 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBGLIB2_VERSION_MAJOR = 2.56
-LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).3
+LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).4
 LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.xz
 LIBGLIB2_SITE = http://ftp.gnome.org/pub/gnome/sources/glib/$(LIBGLIB2_VERSION_MAJOR)
 LIBGLIB2_LICENSE = LGPL-2.1+
-- 
2.21.0
