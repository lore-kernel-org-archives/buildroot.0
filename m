From: Pierre-Jean Texier <pjtexier@koncepto.io>
Date: Fri,  8 May 2020 23:27:34 +0200
Subject: [Buildroot] [PATCH/next] package/genimage: bump to version 13
Message-ID: <1588973254-20636-1-git-send-email-pjtexier@koncepto.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also update hash file formatting (2 spaces)

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 package/genimage/genimage.hash | 4 ++--
 package/genimage/genimage.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/genimage/genimage.hash b/package/genimage/genimage.hash
index fb5d235..fbec5ce 100644
--- a/package/genimage/genimage.hash
+++ b/package/genimage/genimage.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	2e9b43d1288f4e216d6c79de2a0c53ce1bd41f93cec750d8ab057aa2d0b0ee4a	genimage-12.tar.xz
-sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643	COPYING
+sha256  4206e253226a384386c01591251f2ed1ea3485ef63f1e696db03600e1213db79  genimage-13.tar.xz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/genimage/genimage.mk b/package/genimage/genimage.mk
index 8960393..dde8f8b 100644
--- a/package/genimage/genimage.mk
+++ b/package/genimage/genimage.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GENIMAGE_VERSION = 12
+GENIMAGE_VERSION = 13
 GENIMAGE_SOURCE = genimage-$(GENIMAGE_VERSION).tar.xz
 GENIMAGE_SITE = https://github.com/pengutronix/genimage/releases/download/v$(GENIMAGE_VERSION)
 HOST_GENIMAGE_DEPENDENCIES = host-pkgconf host-libconfuse
-- 
2.7.4
