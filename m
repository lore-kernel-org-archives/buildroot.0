From: Jonathan Ben-Avraham <yba@tkos.co.il>
Date: Wed,  5 Aug 2015 07:17:20 +0300
Subject: [Buildroot] [PATCH v3 1/1] jpeg-turbo: bump version from 1.4.0 to
	1.4.1
Message-ID: <1438748241-22774-1-git-send-email-yba@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jonathan Ben Avraham <yba@tkos.co.il>


Signed-off-by: Jonathan Ben Avraham <yba@tkos.co.il>
---
 package/jpeg-turbo/jpeg-turbo.hash |    8 +++++---
 package/jpeg-turbo/jpeg-turbo.mk   |    2 +-
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/jpeg-turbo/jpeg-turbo.hash b/package/jpeg-turbo/jpeg-turbo.hash
index bbc62f2..dd61b2c 100644
--- a/package/jpeg-turbo/jpeg-turbo.hash
+++ b/package/jpeg-turbo/jpeg-turbo.hash
@@ -1,3 +1,5 @@
-# From http://sourceforge.net/projects/libjpeg-turbo/files/1.4.0/
-sha1	a9ed7a99a6090e0848836c5df8e836f300a098b9  libjpeg-turbo-1.4.0.tar.gz
-md5	039153dabe61e1ac8d9323b5522b56b0  libjpeg-turbo-1.4.0.tar.gz
+# From http://sourceforge.net/projects/libjpeg-turbo/files/1.4.1/
+sha1	363a149f644211462c45138a19674f38100036d3	libjpeg-turbo-1.4.1.tar.gz
+md5	b1f6b84859a16b8ebdcda951fa07c3f2	libjpeg-turbo-1.4.1.tar.gz
+# Locally computed
+sha256 4bf5bad4ce85625bffbbd9912211e06790e00fb982b77724af7211034efafb08	libjpeg-turbo-1.4.1.tar.gz
diff --git a/package/jpeg-turbo/jpeg-turbo.mk b/package/jpeg-turbo/jpeg-turbo.mk
index dd3ae19..25434b1 100644
--- a/package/jpeg-turbo/jpeg-turbo.mk
+++ b/package/jpeg-turbo/jpeg-turbo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JPEG_TURBO_VERSION = 1.4.0
+JPEG_TURBO_VERSION = 1.4.1
 JPEG_TURBO_SOURCE = libjpeg-turbo-$(JPEG_TURBO_VERSION).tar.gz
 JPEG_TURBO_SITE = http://downloads.sourceforge.net/project/libjpeg-turbo/$(JPEG_TURBO_VERSION)
 JPEG_TURBO_LICENSE = jpeg-license (BSD-3c-like)
-- 
1.7.9.5
