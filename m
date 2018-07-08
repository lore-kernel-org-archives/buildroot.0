From: 50ty-one <50ty-one@live.de>
Date: Sun, 8 Jul 2018 16:14:33 +0000
Subject: [Buildroot] [PATCH 1/1] genimage: bump to version 10
Message-ID: <DB3PR0402MB38023CF77C8DC4EF166C655482450@DB3PR0402MB3802.eurprd04.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Rommel, Stefan <50ty-one@live.de>
---
 package/genimage/genimage.hash | 2 +-
 package/genimage/genimage.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/genimage/genimage.hash b/package/genimage/genimage.hash
index 4be2fca873..095eb1413f 100644
--- a/package/genimage/genimage.hash
+++ b/package/genimage/genimage.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	69f35af7edf6f4dbdac7a18ddc69dcf38c501e43d8b50c524555754c51479078	genimage-9.tar.xz
+sha256	5a36b2c1387007c2d6535a722ee257a387d0913bddcf8a94d460e6acd4d01859	genimage-10.tar.xz
diff --git a/package/genimage/genimage.mk b/package/genimage/genimage.mk
index 8d11c66a25..393c3e9b94 100644
--- a/package/genimage/genimage.mk
+++ b/package/genimage/genimage.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GENIMAGE_VERSION = 9
+GENIMAGE_VERSION = 10
 GENIMAGE_SOURCE = genimage-$(GENIMAGE_VERSION).tar.xz
 GENIMAGE_SITE = https://github.com/pengutronix/genimage/releases/download/v$(GENIMAGE_VERSION)
 HOST_GENIMAGE_DEPENDENCIES = host-pkgconf host-libconfuse
-- 
2.17.1
