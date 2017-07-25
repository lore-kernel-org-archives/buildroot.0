From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 25 Jul 2017 16:00:29 +0200
Subject: [Buildroot] [git commit] package/jpeg-turbo: bump version to 1.5.2
Message-ID: <20170725144738.548327F8EA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ab0cb70091912d370039557720b0f5a37a8874de
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changed _SITE to https.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/jpeg-turbo/jpeg-turbo.hash | 8 ++++----
 package/jpeg-turbo/jpeg-turbo.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/jpeg-turbo/jpeg-turbo.hash b/package/jpeg-turbo/jpeg-turbo.hash
index 93b245e..320bbb2 100644
--- a/package/jpeg-turbo/jpeg-turbo.hash
+++ b/package/jpeg-turbo/jpeg-turbo.hash
@@ -1,5 +1,5 @@
-# From http://sourceforge.net/projects/libjpeg-turbo/files/1.5.1/
-sha1	ebb3f9e94044c77831a3e8c809c7ea7506944622	libjpeg-turbo-1.5.1.tar.gz
-md5	55deb139b0cac3c8200b75d485fc13f3	libjpeg-turbo-1.5.1.tar.gz
+# From https://sourceforge.net/projects/libjpeg-turbo/files/1.5.2/
+sha1 e788f6defa58b4393a5e1685c018f3b962971457  libjpeg-turbo-1.5.2.tar.gz
+md5 6b4923e297a7eaa255f08511017a8818  libjpeg-turbo-1.5.2.tar.gz
 # Locally computed
-sha256 41429d3d253017433f66e3d472b8c7d998491d2f41caa7306b8d9a6f2a2c666c  libjpeg-turbo-1.5.1.tar.gz
+sha256 9098943b270388727ae61de82adec73cf9f0dbb240b3bc8b172595ebf405b528  libjpeg-turbo-1.5.2.tar.gz
diff --git a/package/jpeg-turbo/jpeg-turbo.mk b/package/jpeg-turbo/jpeg-turbo.mk
index c8c1747..bb1278f 100644
--- a/package/jpeg-turbo/jpeg-turbo.mk
+++ b/package/jpeg-turbo/jpeg-turbo.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-JPEG_TURBO_VERSION = 1.5.1
+JPEG_TURBO_VERSION = 1.5.2
 JPEG_TURBO_SOURCE = libjpeg-turbo-$(JPEG_TURBO_VERSION).tar.gz
-JPEG_TURBO_SITE = http://downloads.sourceforge.net/project/libjpeg-turbo/$(JPEG_TURBO_VERSION)
+JPEG_TURBO_SITE = https://downloads.sourceforge.net/project/libjpeg-turbo/$(JPEG_TURBO_VERSION)
 JPEG_TURBO_LICENSE = jpeg-license (BSD-3-Clause-like)
 JPEG_TURBO_LICENSE_FILES = LICENSE.md
 JPEG_TURBO_INSTALL_STAGING = YES
