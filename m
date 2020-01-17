From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 17 Jan 2020 23:04:55 +0100
Subject: [Buildroot] [PATCH 1/1] package/jpeg-turbo: bump to version 2.0.4
Message-ID: <20200117220455.2584118-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/jpeg-turbo/jpeg-turbo.hash | 8 ++++----
 package/jpeg-turbo/jpeg-turbo.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/jpeg-turbo/jpeg-turbo.hash b/package/jpeg-turbo/jpeg-turbo.hash
index ea6060f2b9..874f04fc82 100644
--- a/package/jpeg-turbo/jpeg-turbo.hash
+++ b/package/jpeg-turbo/jpeg-turbo.hash
@@ -1,7 +1,7 @@
-# From https://sourceforge.net/projects/libjpeg-turbo/files/2.0.3/
-sha1 539363a444f92421c098a1a3e7cebfda48d4cfb3  libjpeg-turbo-2.0.3.tar.gz
-md5  bd07fddf26f9def7bab02739eb655116 libjpeg-turbo-2.0.3.tar.gz
+# From https://sourceforge.net/projects/libjpeg-turbo/files/2.0.4/
+sha1 163d8f96d0999526a117de0388624241b54dcd67  libjpeg-turbo-2.0.4.tar.gz
+md5  d01d9e0c28c27bc0de9f4e2e8ff49855 libjpeg-turbo-2.0.4.tar.gz
 # Locally computed
-sha256 4246de500544d4ee408ee57048aa4aadc6f165fc17f141da87669f20ed3241b7  libjpeg-turbo-2.0.3.tar.gz
+sha256 33dd8547efd5543639e890efbf2ef52d5a21df81faf41bb940657af916a23406  libjpeg-turbo-2.0.4.tar.gz
 sha256 69e570a251515ced17d4492256d57c89db77ed949652f88a44c80c1ca9607920  LICENSE.md
 sha256 82fece2bff2669c476495f0fe70096b154e8bc5b40916a64e99836d9a01c3110  README.ijg
diff --git a/package/jpeg-turbo/jpeg-turbo.mk b/package/jpeg-turbo/jpeg-turbo.mk
index 0c75cf1db5..2767ce6de4 100644
--- a/package/jpeg-turbo/jpeg-turbo.mk
+++ b/package/jpeg-turbo/jpeg-turbo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JPEG_TURBO_VERSION = 2.0.3
+JPEG_TURBO_VERSION = 2.0.4
 JPEG_TURBO_SOURCE = libjpeg-turbo-$(JPEG_TURBO_VERSION).tar.gz
 JPEG_TURBO_SITE = https://downloads.sourceforge.net/project/libjpeg-turbo/$(JPEG_TURBO_VERSION)
 JPEG_TURBO_LICENSE = IJG (libjpeg), BSD-3-Clause (TurboJPEG), Zlib (SIMD)
-- 
2.24.1
