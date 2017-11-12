From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 12 Nov 2017 13:54:11 +0100
Subject: [Buildroot] [PATCH 1/1] package/imagemagick: security bump to
 version 7.0.7-10
Message-ID: <20171112125411.17303-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Version 7.0.7-3 fixes CVE-2017-15218:
Stop potential leaks in the JNG decoder

Changelog: https://www.imagemagick.org/script/changelog.php

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/imagemagick/imagemagick.hash | 2 +-
 package/imagemagick/imagemagick.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/imagemagick/imagemagick.hash b/package/imagemagick/imagemagick.hash
index 92880a9aec..2468bdbc23 100644
--- a/package/imagemagick/imagemagick.hash
+++ b/package/imagemagick/imagemagick.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 5a45e29509dbb23793a9c8db5c47ef1114c1ee82c9ca60053eaf06b3fc243e2c  7.0.7-1.tar.gz
+sha256 924d1161ed2399bcb72f98419072b3130a466e07d9a6fce43d27458ffa907ffa  7.0.7-10.tar.gz
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index 9043ce8e5e..c2171a7564 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMAGEMAGICK_VERSION = 7.0.7-1
+IMAGEMAGICK_VERSION = 7.0.7-10
 IMAGEMAGICK_SOURCE = $(IMAGEMAGICK_VERSION).tar.gz
 IMAGEMAGICK_SITE = https://github.com/ImageMagick/ImageMagick/archive
 IMAGEMAGICK_LICENSE = Apache-2.0
-- 
2.11.0
