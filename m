From: Jianhui Zhao <zhaojh329@gmail.com>
Date: Mon,  7 Jun 2021 10:42:38 +0800
Subject: [Buildroot] [PATCH 1/1] package/libuhttpd: bump version to 3.11.0
Message-ID: <20210607024239.2657720-1-zhaojh329@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jianhui Zhao <zhaojh329@gmail.com>
---
 package/libuhttpd/libuhttpd.hash | 2 +-
 package/libuhttpd/libuhttpd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libuhttpd/libuhttpd.hash b/package/libuhttpd/libuhttpd.hash
index 4b0b5027c6..19a02e5be0 100644
--- a/package/libuhttpd/libuhttpd.hash
+++ b/package/libuhttpd/libuhttpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  6e7a9ad61e3d0ab5bd4d20b274b850542dff8057a8fcf6c36ce59eb34818f61f  libuhttpd-3.10.1.tar.gz
+sha256  dcd95fac7b29d43f57e942db6e9fb4c8745d4284684cd627d60c8a7f8c76cd32  libuhttpd-3.11.0.tar.gz
 sha256  99efed4bbc0b62f96f999ef23399e38234fb91651af734fd389a52b033a85b55  LICENSE
diff --git a/package/libuhttpd/libuhttpd.mk b/package/libuhttpd/libuhttpd.mk
index 326c78face..61afec701e 100644
--- a/package/libuhttpd/libuhttpd.mk
+++ b/package/libuhttpd/libuhttpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUHTTPD_VERSION = 3.10.1
+LIBUHTTPD_VERSION = 3.11.0
 LIBUHTTPD_SITE = https://github.com/zhaojh329/libuhttpd/releases/download/v$(LIBUHTTPD_VERSION)
 LIBUHTTPD_LICENSE = MIT
 LIBUHTTPD_LICENSE_FILES = LICENSE
-- 
2.25.1
