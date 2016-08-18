From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 18 Aug 2016 10:45:23 -0300
Subject: [Buildroot] [PATCH] libglib2: bump to version 2.48.2
Message-ID: <1471527923-2194-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libglib2/libglib2.hash | 4 ++--
 package/libglib2/libglib2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libglib2/libglib2.hash b/package/libglib2/libglib2.hash
index 6463759..35728e2 100644
--- a/package/libglib2/libglib2.hash
+++ b/package/libglib2/libglib2.hash
@@ -1,2 +1,2 @@
-# https://download.gnome.org/sources/glib/2.48/glib-2.48.1.sha256sum
-sha256  74411bff489cb2a3527bac743a51018841a56a4d896cc1e0d0d54f8166a14612  glib-2.48.1.tar.xz
+# https://download.gnome.org/sources/glib/2.48/glib-2.48.2.sha256sum
+sha256  f25e751589cb1a58826eac24fbd4186cda4518af772806b666a3f91f66e6d3f4  glib-2.48.2.tar.xz
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index e2bff6d..6b1a387 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBGLIB2_VERSION_MAJOR = 2.48
-LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).1
+LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).2
 LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.xz
 LIBGLIB2_SITE = http://ftp.gnome.org/pub/gnome/sources/glib/$(LIBGLIB2_VERSION_MAJOR)
 LIBGLIB2_LICENSE = LGPLv2+
-- 
2.7.3
