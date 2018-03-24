From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 24 Mar 2018 11:51:34 +0100
Subject: [Buildroot] [git commit] package/imagemagick: security bump version
 to 7.0.7-27
Message-ID: <20180324105507.83BDB81524@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=31086ea1de511b57e8377d9fa6b0fe7350b1e753
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes CVE-2018-6405 (upstream Github PR 964) and many others:
http://www.imagemagick.org/script/changelog.php

Added license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/imagemagick/imagemagick.hash | 3 ++-
 package/imagemagick/imagemagick.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/imagemagick/imagemagick.hash b/package/imagemagick/imagemagick.hash
index 2468bdbc23..170231c4b7 100644
--- a/package/imagemagick/imagemagick.hash
+++ b/package/imagemagick/imagemagick.hash
@@ -1,2 +1,3 @@
 # Locally computed
-sha256 924d1161ed2399bcb72f98419072b3130a466e07d9a6fce43d27458ffa907ffa  7.0.7-10.tar.gz
+sha256 723a28f9cbc5c6130f496065fc01c839083e97bf3e4930f940a03c0155046170  7.0.7-27.tar.gz
+sha256 2318cc05bbd2c25c1b2d13af1aadccc45b9cf6f94757421ae59a3c8ea9064f1c  LICENSE
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index c2171a7564..116543888b 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMAGEMAGICK_VERSION = 7.0.7-10
+IMAGEMAGICK_VERSION = 7.0.7-27
 IMAGEMAGICK_SOURCE = $(IMAGEMAGICK_VERSION).tar.gz
 IMAGEMAGICK_SITE = https://github.com/ImageMagick/ImageMagick/archive
 IMAGEMAGICK_LICENSE = Apache-2.0
