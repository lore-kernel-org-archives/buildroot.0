From: Jianhui Zhao <zhaojh329@gmail.com>
Date: Sat, 27 Feb 2021 01:12:33 +0800
Subject: [Buildroot] [PATCH 1/1] package/libuhttpd: bump version to 3.10.0
Message-ID: <20210226171233.8056-1-zhaojh329@gmail.com>
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
index 68f1f21733..e772cc84ee 100644
--- a/package/libuhttpd/libuhttpd.hash
+++ b/package/libuhttpd/libuhttpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  9939cd5f9aaad2c118bc04417fb2d21994fb1cdca7fff475a0930a1374635af0  libuhttpd-3.9.0.tar.gz
+sha256  78b1c670e4f259346a1e49e57d158c619eace23f0b72821b0ff2ba991f7dcc51  libuhttpd-3.10.0.tar.gz
 sha256  99efed4bbc0b62f96f999ef23399e38234fb91651af734fd389a52b033a85b55  LICENSE
diff --git a/package/libuhttpd/libuhttpd.mk b/package/libuhttpd/libuhttpd.mk
index a90fe666a8..06d7bc7d5e 100644
--- a/package/libuhttpd/libuhttpd.mk
+++ b/package/libuhttpd/libuhttpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUHTTPD_VERSION = 3.9.0
+LIBUHTTPD_VERSION = 3.10.0
 LIBUHTTPD_SITE = https://github.com/zhaojh329/libuhttpd/releases/download/v$(LIBUHTTPD_VERSION)
 LIBUHTTPD_LICENSE = MIT
 LIBUHTTPD_LICENSE_FILES = LICENSE
-- 
2.25.1
