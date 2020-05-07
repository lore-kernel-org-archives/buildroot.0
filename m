From: aduskett at gmail.com <aduskett@gmail.com>
Date: Thu,  7 May 2020 16:41:51 -0700
Subject: [Buildroot] [PATCH/next 1/1] package/python-gobject: bump version
 to 3.36.1
Message-ID: <20200507234151.2317342-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/python-gobject/python-gobject.hash | 4 ++--
 package/python-gobject/python-gobject.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-gobject/python-gobject.hash b/package/python-gobject/python-gobject.hash
index 5ae7553abb..fd2235f201 100644
--- a/package/python-gobject/python-gobject.hash
+++ b/package/python-gobject/python-gobject.hash
@@ -1,3 +1,3 @@
-# from http://ftp.gnome.org/pub/GNOME/sources/pygobject/3.36/pygobject-3.36.0.sha256sum
-sha256  8683d2dfb5baa9e501a9a64eeba5c2c1117eadb781ab1cd7a9d255834af6daef  pygobject-3.36.0.tar.xz
+# from http://ftp.gnome.org/pub/GNOME/sources/pygobject/3.36/pygobject-3.36.1.sha256sum
+sha256  d1bf42802d1cec113b5adaa0e7bf7f3745b44521dc2163588d276d5cd61d718f  pygobject-3.36.1.tar.xz
 sha256  32434afcc8666ba060e111d715bfdb6c2d5dd8a35fa4d3ab8ad67d8f850d2f2b  COPYING
diff --git a/package/python-gobject/python-gobject.mk b/package/python-gobject/python-gobject.mk
index c93140fc66..0cada82fb7 100644
--- a/package/python-gobject/python-gobject.mk
+++ b/package/python-gobject/python-gobject.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON_GOBJECT_VERSION_MAJOR = 3.36
-PYTHON_GOBJECT_VERSION = $(PYTHON_GOBJECT_VERSION_MAJOR).0
+PYTHON_GOBJECT_VERSION = $(PYTHON_GOBJECT_VERSION_MAJOR).1
 PYTHON_GOBJECT_SOURCE = pygobject-$(PYTHON_GOBJECT_VERSION).tar.xz
 PYTHON_GOBJECT_SITE = https://ftp.gnome.org/pub/gnome/sources/pygobject/$(PYTHON_GOBJECT_VERSION_MAJOR)
 PYTHON_GOBJECT_LICENSE = LGPL-2.1+
-- 
2.26.2
