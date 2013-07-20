From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Sat, 20 Jul 2013 11:47:23 +0200
Subject: [Buildroot] [PATCH v2 1/1] zlib: bump to version 1.2.8
Message-ID: <1374313643-19001-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
v2
- fix white space

 package/zlib/zlib.mk |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/zlib/zlib.mk b/package/zlib/zlib.mk
index 25d40a5..f26fe4a 100644
--- a/package/zlib/zlib.mk
+++ b/package/zlib/zlib.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-ZLIB_VERSION = 1.2.7
-ZLIB_SOURCE =zlib-$(ZLIB_VERSION).tar.bz2
+ZLIB_VERSION = 1.2.8
+ZLIB_SOURCE = zlib-$(ZLIB_VERSION).tar.xz
 ZLIB_SITE = http://downloads.sourceforge.net/project/libpng/zlib/$(ZLIB_VERSION)
 ZLIB_LICENSE = zlib license
 ZLIB_LICENSE_FILES = README
-- 
1.7.9.5
