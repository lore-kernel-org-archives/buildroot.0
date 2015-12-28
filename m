From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 28 Dec 2015 12:51:09 -0300
Subject: [Buildroot] [PATCH] libjpeg-turbo: bump to version 1.4.2
Message-ID: <1451317869-30666-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/jpeg-turbo/jpeg-turbo.hash | 8 ++++----
 package/jpeg-turbo/jpeg-turbo.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/jpeg-turbo/jpeg-turbo.hash b/package/jpeg-turbo/jpeg-turbo.hash
index dd61b2c..a38a5af 100644
--- a/package/jpeg-turbo/jpeg-turbo.hash
+++ b/package/jpeg-turbo/jpeg-turbo.hash
@@ -1,5 +1,5 @@
-# From http://sourceforge.net/projects/libjpeg-turbo/files/1.4.1/
-sha1	363a149f644211462c45138a19674f38100036d3	libjpeg-turbo-1.4.1.tar.gz
-md5	b1f6b84859a16b8ebdcda951fa07c3f2	libjpeg-turbo-1.4.1.tar.gz
+# From http://sourceforge.net/projects/libjpeg-turbo/files/1.4.2/
+sha1	2666158ccd5318513f875867bbc4af52f6eb9f0b	libjpeg-turbo-1.4.2.tar.gz
+md5	86b0d5f7507c2e6c21c00219162c3c44	libjpeg-turbo-1.4.2.tar.gz
 # Locally computed
-sha256 4bf5bad4ce85625bffbbd9912211e06790e00fb982b77724af7211034efafb08	libjpeg-turbo-1.4.1.tar.gz
+sha256	521bb5d3043e7ac063ce3026d9a59cc2ab2e9636c655a2515af5f4706122233e	libjpeg-turbo-1.4.2.tar.gz
diff --git a/package/jpeg-turbo/jpeg-turbo.mk b/package/jpeg-turbo/jpeg-turbo.mk
index 25434b1..047e925 100644
--- a/package/jpeg-turbo/jpeg-turbo.mk
+++ b/package/jpeg-turbo/jpeg-turbo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JPEG_TURBO_VERSION = 1.4.1
+JPEG_TURBO_VERSION = 1.4.2
 JPEG_TURBO_SOURCE = libjpeg-turbo-$(JPEG_TURBO_VERSION).tar.gz
 JPEG_TURBO_SITE = http://downloads.sourceforge.net/project/libjpeg-turbo/$(JPEG_TURBO_VERSION)
 JPEG_TURBO_LICENSE = jpeg-license (BSD-3c-like)
-- 
2.4.10
