From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 9 Jan 2015 22:52:22 +0100
Subject: [Buildroot] [git commit] jpeg-turbo: bump version
Message-ID: <20150109232317.241F280E08@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=53e5f5e1d0df3be58220692eca9c439ad3c32a33
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/jpeg-turbo/jpeg-turbo.hash |    5 +++--
 package/jpeg-turbo/jpeg-turbo.mk   |    2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/jpeg-turbo/jpeg-turbo.hash b/package/jpeg-turbo/jpeg-turbo.hash
index 0e54704..bbc62f2 100644
--- a/package/jpeg-turbo/jpeg-turbo.hash
+++ b/package/jpeg-turbo/jpeg-turbo.hash
@@ -1,2 +1,3 @@
-# Locally computed:
-sha256  c132907417ddc40ed552fe53d6b91d5fecbb14a356a60ddc7ea50d6be9666fb9  libjpeg-turbo-1.3.1.tar.gz
+# From http://sourceforge.net/projects/libjpeg-turbo/files/1.4.0/
+sha1	a9ed7a99a6090e0848836c5df8e836f300a098b9  libjpeg-turbo-1.4.0.tar.gz
+md5	039153dabe61e1ac8d9323b5522b56b0  libjpeg-turbo-1.4.0.tar.gz
diff --git a/package/jpeg-turbo/jpeg-turbo.mk b/package/jpeg-turbo/jpeg-turbo.mk
index 8fc0b95..dd3ae19 100644
--- a/package/jpeg-turbo/jpeg-turbo.mk
+++ b/package/jpeg-turbo/jpeg-turbo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JPEG_TURBO_VERSION = 1.3.1
+JPEG_TURBO_VERSION = 1.4.0
 JPEG_TURBO_SOURCE = libjpeg-turbo-$(JPEG_TURBO_VERSION).tar.gz
 JPEG_TURBO_SITE = http://downloads.sourceforge.net/project/libjpeg-turbo/$(JPEG_TURBO_VERSION)
 JPEG_TURBO_LICENSE = jpeg-license (BSD-3c-like)
