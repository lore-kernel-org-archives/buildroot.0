From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 9 Jul 2018 23:46:39 +0200
Subject: [Buildroot] [git commit] genimage: bump to version 10
Message-ID: <20180709214918.7303E7FADB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3a66d0df644b8f3ad5c595e844015f7e65449366
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Adds cramfs and FIT image support.

Signed-off-by: Rommel, Stefan <50ty-one@live.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
