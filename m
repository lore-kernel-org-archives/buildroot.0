From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 25 Feb 2019 22:22:14 +0100
Subject: [Buildroot] [git commit branch/next] package/imagemagick: bump to
 version 7.0.8-27
Message-ID: <20190225212018.4837B81369@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=109e5c83dc9c05412cfc6139f2846268f73d76e5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This patch bumps imagemagick to version 7.0.8-27
Hash for license file is changed becasue the updated the copyright year
for 2019:

https://github.com/ImageMagick/ImageMagick/commit/252dd2c52bcc591ccd673abdbb70113b42388150

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/imagemagick/imagemagick.hash | 4 ++--
 package/imagemagick/imagemagick.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/imagemagick/imagemagick.hash b/package/imagemagick/imagemagick.hash
index 9d5a39567e..09bfb2a2e9 100644
--- a/package/imagemagick/imagemagick.hash
+++ b/package/imagemagick/imagemagick.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 e7c1b19923bb97ed456c78b63b3259b809ebc8e3967c6d086450370c67eedf06  7.0.7-39.tar.gz
-sha256 2318cc05bbd2c25c1b2d13af1aadccc45b9cf6f94757421ae59a3c8ea9064f1c  LICENSE
+sha256 94866968a447f8f92a969bf5342d612d05a64c71fc75e63bb2d8ecf887dc7fa2  7.0.8-27.tar.gz
+sha256 5b47db932754743460eba7a226aea85b63e3408d3c7affb4d0117f70c9594ded  LICENSE
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index 7678980582..b5d0d56284 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMAGEMAGICK_VERSION = 7.0.7-39
+IMAGEMAGICK_VERSION = 7.0.8-27
 IMAGEMAGICK_SOURCE = $(IMAGEMAGICK_VERSION).tar.gz
 IMAGEMAGICK_SITE = https://github.com/ImageMagick/ImageMagick/archive
 IMAGEMAGICK_LICENSE = Apache-2.0
