From: Francois Perrad <fperrad@gmail.com>
Date: Sat, 10 Jul 2021 17:58:38 +0200
Subject: [Buildroot] [PATCH] package/libgtk3: bump to version 3.24.29
Message-ID: <20210710155838.76712-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/libgtk3/0001-no-gtk-doc.patch | 2 +-
 package/libgtk3/libgtk3.hash          | 4 ++--
 package/libgtk3/libgtk3.mk            | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libgtk3/0001-no-gtk-doc.patch b/package/libgtk3/0001-no-gtk-doc.patch
index db15c6cba..e1d320802 100644
--- a/package/libgtk3/0001-no-gtk-doc.patch
+++ b/package/libgtk3/0001-no-gtk-doc.patch
@@ -14,7 +14,7 @@ Signed-off-by: Hadrien Boutteville <hadrien.boutteville@gmail.com>
 
 --- a/gtk-doc.make
 +++ b/gtk-doc.make
-@@ -299,7 +299,7 @@
+@@ -300,7 +300,7 @@
  #
  # Require gtk-doc when making dist
  #
diff --git a/package/libgtk3/libgtk3.hash b/package/libgtk3/libgtk3.hash
index 22cf16dad..d5638780d 100644
--- a/package/libgtk3/libgtk3.hash
+++ b/package/libgtk3/libgtk3.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/gtk+/3.24/gtk+-3.24.24.sha256sum
-sha256  cc9d4367c55b724832f6b09ab85481738ea456871f0381768a6a99335a98378a  gtk+-3.24.24.tar.xz
+# From https://download.gnome.org/sources/gtk+/3.24/gtk+-3.24.29.sha256sum
+sha256  f57ec4ade8f15cab0c23a80dcaee85b876e70a8823d9105f067ce335a8268caa  gtk+-3.24.29.tar.xz
 
 # Hash for license file:
 sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/libgtk3/libgtk3.mk b/package/libgtk3/libgtk3.mk
index 9ece409ba..0c40bff80 100644
--- a/package/libgtk3/libgtk3.mk
+++ b/package/libgtk3/libgtk3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBGTK3_VERSION_MAJOR = 3.24
-LIBGTK3_VERSION = $(LIBGTK3_VERSION_MAJOR).24
+LIBGTK3_VERSION = $(LIBGTK3_VERSION_MAJOR).29
 LIBGTK3_SOURCE = gtk+-$(LIBGTK3_VERSION).tar.xz
 LIBGTK3_SITE = http://ftp.gnome.org/pub/gnome/sources/gtk+/$(LIBGTK3_VERSION_MAJOR)
 LIBGTK3_LICENSE = LGPL-2.0+
-- 
2.30.2
