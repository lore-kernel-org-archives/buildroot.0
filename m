From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  1 Jan 2017 21:21:13 +0100
Subject: [Buildroot] [PATCH 1/1] package/zlib: bump version to 1.2.9
Message-ID: <20170101202113.7449-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/zlib/zlib.hash | 2 +-
 package/zlib/zlib.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/zlib/zlib.hash b/package/zlib/zlib.hash
index d6382f8d3..0fa4897dc 100644
--- a/package/zlib/zlib.hash
+++ b/package/zlib/zlib.hash
@@ -1,2 +1,2 @@
 # From http://www.zlib.net/
-md5	28f1205d8dd2001f26fec1e8c2cebe37	zlib-1.2.8.tar.xz
+sha256 03d9c7f67976cf1389589782de46f45011053ea7f4222c2fb8c2cf9fd813bb68  zlib-1.2.9.tar.xz
diff --git a/package/zlib/zlib.mk b/package/zlib/zlib.mk
index 53eb84e15..04e9349a2 100644
--- a/package/zlib/zlib.mk
+++ b/package/zlib/zlib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZLIB_VERSION = 1.2.8
+ZLIB_VERSION = 1.2.9
 ZLIB_SOURCE = zlib-$(ZLIB_VERSION).tar.xz
 ZLIB_SITE = http://downloads.sourceforge.net/project/libpng/zlib/$(ZLIB_VERSION)
 ZLIB_LICENSE = zlib license
-- 
2.11.0
