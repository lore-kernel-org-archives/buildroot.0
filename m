From: Pierre-Jean Texier <texier.pj2@gmail.com>
Date: Tue, 23 Feb 2021 19:19:10 +0100
Subject: [Buildroot] [PATCH] package/genimage: bump to version 14
Message-ID: <20210223181910.20099-1-texier.pj2@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Pierre-Jean Texier <texier.pj2@gmail.com>
---
 package/genimage/genimage.hash | 2 +-
 package/genimage/genimage.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/genimage/genimage.hash b/package/genimage/genimage.hash
index fbec5ce57b..9f60261b53 100644
--- a/package/genimage/genimage.hash
+++ b/package/genimage/genimage.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  4206e253226a384386c01591251f2ed1ea3485ef63f1e696db03600e1213db79  genimage-13.tar.xz
+sha256  9d1d53b33309fe24ea367ea057eb689bdb8ea33cb99d796de31127ca44ccf44c  genimage-14.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/genimage/genimage.mk b/package/genimage/genimage.mk
index dde8f8b9e0..1934223b23 100644
--- a/package/genimage/genimage.mk
+++ b/package/genimage/genimage.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GENIMAGE_VERSION = 13
+GENIMAGE_VERSION = 14
 GENIMAGE_SOURCE = genimage-$(GENIMAGE_VERSION).tar.xz
 GENIMAGE_SITE = https://github.com/pengutronix/genimage/releases/download/v$(GENIMAGE_VERSION)
 HOST_GENIMAGE_DEPENDENCIES = host-pkgconf host-libconfuse
-- 
2.17.1
