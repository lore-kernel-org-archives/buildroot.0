From: Jianhui Zhao <zhaojh329@gmail.com>
Date: Sun,  7 Mar 2021 22:19:33 +0800
Subject: [Buildroot] [PATCH 1/1] package/libuhttpd: bump version to 3.10.1
Message-ID: <20210307141933.3187167-1-zhaojh329@gmail.com>
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
index e772cc84ee..4b0b5027c6 100644
--- a/package/libuhttpd/libuhttpd.hash
+++ b/package/libuhttpd/libuhttpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  78b1c670e4f259346a1e49e57d158c619eace23f0b72821b0ff2ba991f7dcc51  libuhttpd-3.10.0.tar.gz
+sha256  6e7a9ad61e3d0ab5bd4d20b274b850542dff8057a8fcf6c36ce59eb34818f61f  libuhttpd-3.10.1.tar.gz
 sha256  99efed4bbc0b62f96f999ef23399e38234fb91651af734fd389a52b033a85b55  LICENSE
diff --git a/package/libuhttpd/libuhttpd.mk b/package/libuhttpd/libuhttpd.mk
index 06d7bc7d5e..326c78face 100644
--- a/package/libuhttpd/libuhttpd.mk
+++ b/package/libuhttpd/libuhttpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUHTTPD_VERSION = 3.10.0
+LIBUHTTPD_VERSION = 3.10.1
 LIBUHTTPD_SITE = https://github.com/zhaojh329/libuhttpd/releases/download/v$(LIBUHTTPD_VERSION)
 LIBUHTTPD_LICENSE = MIT
 LIBUHTTPD_LICENSE_FILES = LICENSE
-- 
2.25.1
