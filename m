From: Adam Duskett <aduskett@gmail.com>
Date: Tue,  5 Sep 2017 08:20:06 -0400
Subject: [Buildroot] [PATCH 1/1] cairo: bump to 1.14.10
In-Reply-To: <20170905122010.19409-1-aduskett@gmail.com>
References: <20170905122010.19409-1-aduskett@gmail.com>
Message-ID: <20170905122010.19409-2-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/cairo/cairo.hash | 6 +++---
 package/cairo/cairo.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/cairo/cairo.hash b/package/cairo/cairo.hash
index dd5365ba7..f3aa01f2c 100644
--- a/package/cairo/cairo.hash
+++ b/package/cairo/cairo.hash
@@ -1,4 +1,4 @@
-# From http://cairographics.org/releases/cairo-1.14.8.tar.xz.sha1
-sha1	c6f7b99986f93c9df78653c3e6a3b5043f65145e	cairo-1.14.8.tar.xz
+# From http://cairographics.org/releases/cairo-1.14.10.tar.xz.sha1
+sha1	28c59d85d6b790c21b8b59ece73a6a1dda28d69a	cairo-1.14.10.tar.xz
 # Calculated based on the hash above
-sha256	d1f2d98ae9a4111564f6de4e013d639cf77155baf2556582295a0f00a9bc5e20	cairo-1.14.8.tar.xz
+sha256	7e87878658f2c9951a14fc64114d4958c0e65ac47530b8ac3078b2ce41b66a09	cairo-1.14.10.tar.xz
diff --git a/package/cairo/cairo.mk b/package/cairo/cairo.mk
index 0d62dc393..974905677 100644
--- a/package/cairo/cairo.mk
+++ b/package/cairo/cairo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CAIRO_VERSION = 1.14.8
+CAIRO_VERSION = 1.14.10
 CAIRO_SOURCE = cairo-$(CAIRO_VERSION).tar.xz
 CAIRO_LICENSE = LGPL-2.1 or MPL-1.1 (library)
 CAIRO_LICENSE_FILES = COPYING COPYING-LGPL-2.1 COPYING-MPL-1.1
-- 
2.13.5
