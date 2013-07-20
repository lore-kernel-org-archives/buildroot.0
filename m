From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 20 Jul 2013 21:12:41 +0200
Subject: [Buildroot] [git commit] zlib: bump to version 1.2.8
Message-ID: <20130720191900.264219A161@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4b23af70216b24be35378d9aee7c271790525728
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/zlib/zlib.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

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
