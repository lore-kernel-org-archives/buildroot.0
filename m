From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 Jul 2018 09:18:34 +0200
Subject: [Buildroot] [git commit branch/2018.05.x] package/imagemagick:
 security bump to version 7.0.7-38
Message-ID: <20180717072759.CEB5F88706@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3b624476bb1d3ecc097b9a924c5d81844132de27
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.05.x

Fixes CVE-2018-11625, CVE-2018-11624 & CVE-2018-10177.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit c3387c59bb6b5ccb89bb7acd7db05a8655eb71c5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/imagemagick/imagemagick.hash | 2 +-
 package/imagemagick/imagemagick.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/imagemagick/imagemagick.hash b/package/imagemagick/imagemagick.hash
index 170231c4b7..cf529b597c 100644
--- a/package/imagemagick/imagemagick.hash
+++ b/package/imagemagick/imagemagick.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 723a28f9cbc5c6130f496065fc01c839083e97bf3e4930f940a03c0155046170  7.0.7-27.tar.gz
+sha256 ac957ef303fb870cb92331947ebcdcef5b553e80c7897c0aec866889f35e1a23  7.0.7-38.tar.gz
 sha256 2318cc05bbd2c25c1b2d13af1aadccc45b9cf6f94757421ae59a3c8ea9064f1c  LICENSE
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index 116543888b..4aa9d56db2 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMAGEMAGICK_VERSION = 7.0.7-27
+IMAGEMAGICK_VERSION = 7.0.7-38
 IMAGEMAGICK_SOURCE = $(IMAGEMAGICK_VERSION).tar.gz
 IMAGEMAGICK_SITE = https://github.com/ImageMagick/ImageMagick/archive
 IMAGEMAGICK_LICENSE = Apache-2.0
