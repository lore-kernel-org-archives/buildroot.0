From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Dec 2016 21:40:20 +0100
Subject: [Buildroot] [git commit] package/jpeg-turbo: bump version to 1.5.1
Message-ID: <20161210204026.3BF0C8177A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dac3cdd0cf4157348b6a2e8e926a152a03d9aec5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/jpeg-turbo/jpeg-turbo.hash | 8 ++++----
 package/jpeg-turbo/jpeg-turbo.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/jpeg-turbo/jpeg-turbo.hash b/package/jpeg-turbo/jpeg-turbo.hash
index a38a5af..93b245e 100644
--- a/package/jpeg-turbo/jpeg-turbo.hash
+++ b/package/jpeg-turbo/jpeg-turbo.hash
@@ -1,5 +1,5 @@
-# From http://sourceforge.net/projects/libjpeg-turbo/files/1.4.2/
-sha1	2666158ccd5318513f875867bbc4af52f6eb9f0b	libjpeg-turbo-1.4.2.tar.gz
-md5	86b0d5f7507c2e6c21c00219162c3c44	libjpeg-turbo-1.4.2.tar.gz
+# From http://sourceforge.net/projects/libjpeg-turbo/files/1.5.1/
+sha1	ebb3f9e94044c77831a3e8c809c7ea7506944622	libjpeg-turbo-1.5.1.tar.gz
+md5	55deb139b0cac3c8200b75d485fc13f3	libjpeg-turbo-1.5.1.tar.gz
 # Locally computed
-sha256	521bb5d3043e7ac063ce3026d9a59cc2ab2e9636c655a2515af5f4706122233e	libjpeg-turbo-1.4.2.tar.gz
+sha256 41429d3d253017433f66e3d472b8c7d998491d2f41caa7306b8d9a6f2a2c666c  libjpeg-turbo-1.5.1.tar.gz
diff --git a/package/jpeg-turbo/jpeg-turbo.mk b/package/jpeg-turbo/jpeg-turbo.mk
index 454b648..c0a430c 100644
--- a/package/jpeg-turbo/jpeg-turbo.mk
+++ b/package/jpeg-turbo/jpeg-turbo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JPEG_TURBO_VERSION = 1.4.2
+JPEG_TURBO_VERSION = 1.5.1
 JPEG_TURBO_SOURCE = libjpeg-turbo-$(JPEG_TURBO_VERSION).tar.gz
 JPEG_TURBO_SITE = http://downloads.sourceforge.net/project/libjpeg-turbo/$(JPEG_TURBO_VERSION)
 JPEG_TURBO_LICENSE = jpeg-license (BSD-3c-like)
