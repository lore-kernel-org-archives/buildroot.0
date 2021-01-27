From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 27 Jan 2021 20:58:38 +0100
Subject: [Buildroot] [PATCH 1/1] package/libuhttpd: bump to version 3.9.0
Message-ID: <20210127195838.3121348-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix build without dlopen thanks to
https://github.com/zhaojh329/libuhttpd/commit/117ae812a4eb114f46f4d9dfd395618c74836710

https://github.com/zhaojh329/libuhttpd/releases/tag/v3.9.0

Fixes:
 - http://autobuild.buildroot.org/results/3d14502c87ecee5b1eeeec3f85b8d6b659d61bbc

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libuhttpd/libuhttpd.hash | 2 +-
 package/libuhttpd/libuhttpd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libuhttpd/libuhttpd.hash b/package/libuhttpd/libuhttpd.hash
index 98ae64bf70..68f1f21733 100644
--- a/package/libuhttpd/libuhttpd.hash
+++ b/package/libuhttpd/libuhttpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  cdf97020be8ef73e74f12e0703e0f871ebd26c641ce2cb31f67c90a79483c372  libuhttpd-3.8.0.tar.gz
+sha256  9939cd5f9aaad2c118bc04417fb2d21994fb1cdca7fff475a0930a1374635af0  libuhttpd-3.9.0.tar.gz
 sha256  99efed4bbc0b62f96f999ef23399e38234fb91651af734fd389a52b033a85b55  LICENSE
diff --git a/package/libuhttpd/libuhttpd.mk b/package/libuhttpd/libuhttpd.mk
index 60f0455ddd..a90fe666a8 100644
--- a/package/libuhttpd/libuhttpd.mk
+++ b/package/libuhttpd/libuhttpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUHTTPD_VERSION = 3.8.0
+LIBUHTTPD_VERSION = 3.9.0
 LIBUHTTPD_SITE = https://github.com/zhaojh329/libuhttpd/releases/download/v$(LIBUHTTPD_VERSION)
 LIBUHTTPD_LICENSE = MIT
 LIBUHTTPD_LICENSE_FILES = LICENSE
-- 
2.29.2
