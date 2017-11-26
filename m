From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 Nov 2017 22:31:25 +0100
Subject: [Buildroot] [git commit branch/2017.02.x] package/imagemagick:
 security bump to version 7.0.7-10
Message-ID: <20171126213911.D585A802D0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=331edb02ba21cfde85294d1b950e6d2ce5e2c2e5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Version 7.0.7-3 fixes CVE-2017-15218:
Stop potential leaks in the JNG decoder

Changelog: https://www.imagemagick.org/script/changelog.php

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 3c8dc542936484cf94efd06d96161c8a04fb17a5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/imagemagick/imagemagick.hash | 2 +-
 package/imagemagick/imagemagick.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/imagemagick/imagemagick.hash b/package/imagemagick/imagemagick.hash
index 92880a9..2468bdb 100644
--- a/package/imagemagick/imagemagick.hash
+++ b/package/imagemagick/imagemagick.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 5a45e29509dbb23793a9c8db5c47ef1114c1ee82c9ca60053eaf06b3fc243e2c  7.0.7-1.tar.gz
+sha256 924d1161ed2399bcb72f98419072b3130a466e07d9a6fce43d27458ffa907ffa  7.0.7-10.tar.gz
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index 9043ce8..c2171a7 100644
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
