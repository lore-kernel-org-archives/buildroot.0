From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 18 Jan 2021 21:49:10 +0100
Subject: [Buildroot] [git commit] package/imagemagick: add
 IMAGEMAGICK_CPE_ID_VENDOR
Message-ID: <20210118203943.94D7E818AD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=249e40d7adbd7b67ac514d755c5e4b2075b4b5b1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:imagemagick:imagemagick is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aimagemagick%3Aimagemagick

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/imagemagick/imagemagick.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index f30d3dfc2b..ea181c97f9 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -8,6 +8,7 @@ IMAGEMAGICK_VERSION = 7.0.10-51
 IMAGEMAGICK_SITE = $(call github,ImageMagick,ImageMagick,$(IMAGEMAGICK_VERSION))
 IMAGEMAGICK_LICENSE = Apache-2.0
 IMAGEMAGICK_LICENSE_FILES = LICENSE
+IMAGEMAGICK_CPE_ID_VENDOR = imagemagick
 
 IMAGEMAGICK_INSTALL_STAGING = YES
 IMAGEMAGICK_CONFIG_SCRIPTS = \
