From: Petr Vorel <petr.vorel@gmail.com>
Date: Thu,  2 Nov 2017 21:12:58 +0100
Subject: [Buildroot] [PATCH 1/1] package/libglib2: Bump to version 2.54.2
Message-ID: <20171102201258.18370-1-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 package/libglib2/libglib2.hash | 4 ++--
 package/libglib2/libglib2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libglib2/libglib2.hash b/package/libglib2/libglib2.hash
index 4316378098..fb9321e397 100644
--- a/package/libglib2/libglib2.hash
+++ b/package/libglib2/libglib2.hash
@@ -1,2 +1,2 @@
-# https://download.gnome.org/sources/glib/2.54/glib-2.54.1.sha256sum
-sha256  50c01b1419324f10fbf9b9709ec2164b18586968bdce7540583bf32302cf47a3  glib-2.54.1.tar.xz
+# https://download.gnome.org/sources/glib/2.54/glib-2.54.2.sha256sum
+sha256  bb89e5c5aad33169a8c7f28b45671c7899c12f74caf707737f784d7102758e6c  glib-2.54.2.tar.xz
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index 2defcf05ec..b13da333d8 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBGLIB2_VERSION_MAJOR = 2.54
-LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).1
+LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).2
 LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.xz
 LIBGLIB2_SITE = http://ftp.gnome.org/pub/gnome/sources/glib/$(LIBGLIB2_VERSION_MAJOR)
 LIBGLIB2_LICENSE = LGPL-2.0+
-- 
2.14.2
