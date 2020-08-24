From: Jianhui Zhao <zhaojh329@gmail.com>
Date: Tue, 25 Aug 2020 00:14:17 +0800
Subject: [Buildroot] [PATCH 1/1] package/libuhttpd: bump version to 3.2.0
Message-ID: <20200824161417.16610-1-zhaojh329@gmail.com>
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
index 49b40688b5..22357cd5eb 100644
--- a/package/libuhttpd/libuhttpd.hash
+++ b/package/libuhttpd/libuhttpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  cd76cf9a5d8c7f81832ab1b229ce3ff10137f161085f0170c128e43c49e905a4  libuhttpd-3.1.4.tar.gz
+sha256  b47623f023d6a1218f2cb078bcc9019949a7f30acce79423e524a481d4bc834d  libuhttpd-3.2.0.tar.gz
 sha256  99efed4bbc0b62f96f999ef23399e38234fb91651af734fd389a52b033a85b55  LICENSE
diff --git a/package/libuhttpd/libuhttpd.mk b/package/libuhttpd/libuhttpd.mk
index 9c026cff02..1bb071b3e4 100644
--- a/package/libuhttpd/libuhttpd.mk
+++ b/package/libuhttpd/libuhttpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUHTTPD_VERSION = 3.1.4
+LIBUHTTPD_VERSION = 3.2.0
 LIBUHTTPD_SITE = https://github.com/zhaojh329/libuhttpd/releases/download/v$(LIBUHTTPD_VERSION)
 LIBUHTTPD_LICENSE = MIT
 LIBUHTTPD_LICENSE_FILES = LICENSE
-- 
2.17.1
