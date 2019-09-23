From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 23 Sep 2019 08:02:42 +0200
Subject: [Buildroot] [PATCH 1/1] package/meson: bump version to 0.51.2
Message-ID: <20190923060242.7110-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/meson/meson.hash | 4 ++--
 package/meson/meson.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/meson/meson.hash b/package/meson/meson.hash
index 80828b2a17..cfe859d2ee 100644
--- a/package/meson/meson.hash
+++ b/package/meson/meson.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://github.com/mesonbuild/meson/releases/download/0.51.1/meson-0.51.1.tar.gz.asc
-sha256 f27b7a60f339ba66fe4b8f81f0d1072e090a08eabbd6aa287683b2c2b9dd2d82 meson-0.51.1.tar.gz
+# https://github.com/mesonbuild/meson/releases/download/0.51.2/meson-0.51.2.tar.gz.asc
+sha256 23688f0fc90be623d98e80e1defeea92bbb7103bf9336a5f5b9865d36e892d76 meson-0.51.2.tar.gz
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30 COPYING
diff --git a/package/meson/meson.mk b/package/meson/meson.mk
index 3267581fc6..a664c55f55 100644
--- a/package/meson/meson.mk
+++ b/package/meson/meson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MESON_VERSION = 0.51.1
+MESON_VERSION = 0.51.2
 MESON_SITE = https://github.com/mesonbuild/meson/releases/download/$(MESON_VERSION)
 MESON_LICENSE = Apache-2.0
 MESON_LICENSE_FILES = COPYING
-- 
2.20.1
