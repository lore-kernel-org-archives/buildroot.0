From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 22 Nov 2020 15:32:25 +0100
Subject: [Buildroot] [git commit] package/jpeg-turbo: bump to version 2.0.6
Message-ID: <20201122141842.672767FA87@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=74cce093b047860e5fde45676fcdeabc6f2d0fef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update hash of README.ijg (URLs updated and Usenet info removed with
https://github.com/libjpeg-turbo/libjpeg-turbo/commit/26e3aedbe569329d8ab005bad5481bcbd1f43ac8)

https://sourceforge.net/projects/libjpeg-turbo/files/2.0.6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/jpeg-turbo/jpeg-turbo.hash | 10 +++++-----
 package/jpeg-turbo/jpeg-turbo.mk   |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/jpeg-turbo/jpeg-turbo.hash b/package/jpeg-turbo/jpeg-turbo.hash
index c4d4a0274f..1a22b1d6ff 100644
--- a/package/jpeg-turbo/jpeg-turbo.hash
+++ b/package/jpeg-turbo/jpeg-turbo.hash
@@ -1,7 +1,7 @@
-# From https://sourceforge.net/projects/libjpeg-turbo/files/2.0.5/
-sha1  9d4c565d402b2f5661be78d76098073ec7e30f10  libjpeg-turbo-2.0.5.tar.gz
-md5  3a7dc293918775fc933f81e2bce36464  libjpeg-turbo-2.0.5.tar.gz
+# From https://sourceforge.net/projects/libjpeg-turbo/files/2.0.6/
+sha1  5406c7676d7df89fb4da791ad5af51202910fb25  libjpeg-turbo-2.0.6.tar.gz
+md5  4cada3f0bdc93d826fa31bf9e4469ef6  libjpeg-turbo-2.0.6.tar.gz
 # Locally computed
-sha256  16f8f6f2715b3a38ab562a84357c793dd56ae9899ce130563c72cd93d8357b5d  libjpeg-turbo-2.0.5.tar.gz
+sha256  d74b92ac33b0e3657123ddcf6728788c90dc84dcb6a52013d758af3c4af481bb  libjpeg-turbo-2.0.6.tar.gz
 sha256  0b7a24c3906d26dfbe24e96e9415549b387c3227140dc6b7ab2fb924254e37a1  LICENSE.md
-sha256  82fece2bff2669c476495f0fe70096b154e8bc5b40916a64e99836d9a01c3110  README.ijg
+sha256  01ccef626ec864773c681d4a4056f72af9052d619e0609df0d369117f8b3efdf  README.ijg
diff --git a/package/jpeg-turbo/jpeg-turbo.mk b/package/jpeg-turbo/jpeg-turbo.mk
index ddb22bc20b..cd12756618 100644
--- a/package/jpeg-turbo/jpeg-turbo.mk
+++ b/package/jpeg-turbo/jpeg-turbo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JPEG_TURBO_VERSION = 2.0.5
+JPEG_TURBO_VERSION = 2.0.6
 JPEG_TURBO_SOURCE = libjpeg-turbo-$(JPEG_TURBO_VERSION).tar.gz
 JPEG_TURBO_SITE = https://downloads.sourceforge.net/project/libjpeg-turbo/$(JPEG_TURBO_VERSION)
 JPEG_TURBO_LICENSE = IJG (libjpeg), BSD-3-Clause (TurboJPEG), Zlib (SIMD)
