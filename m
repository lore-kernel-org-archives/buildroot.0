From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 18 Jan 2021 21:49:11 +0100
Subject: [Buildroot] [git commit] package/graphicsmagick: add
 GRAPHICSMAGICK_CPE_ID_VENDOR
Message-ID: <20210118203943.9F519818AD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f880fbe7ac18608a6d2866842ebf32942f2dd659
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:graphicsmagick:graphicsmagick is a valid CPE identifier for
this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Agraphicsmagick%3Agraphicsmagick

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/graphicsmagick/graphicsmagick.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/graphicsmagick/graphicsmagick.mk b/package/graphicsmagick/graphicsmagick.mk
index 8b96d7235d..2a22936fcc 100644
--- a/package/graphicsmagick/graphicsmagick.mk
+++ b/package/graphicsmagick/graphicsmagick.mk
@@ -9,6 +9,7 @@ GRAPHICSMAGICK_SOURCE = GraphicsMagick-$(GRAPHICSMAGICK_VERSION).tar.xz
 GRAPHICSMAGICK_SITE = https://downloads.sourceforge.net/project/graphicsmagick/graphicsmagick/$(GRAPHICSMAGICK_VERSION)
 GRAPHICSMAGICK_LICENSE = MIT
 GRAPHICSMAGICK_LICENSE_FILES = Copyright.txt
+GRAPHICSMAGICK_CPE_ID_VENDOR = graphicsmagick
 
 GRAPHICSMAGICK_INSTALL_STAGING = YES
 GRAPHICSMAGICK_CONFIG_SCRIPTS = GraphicsMagick-config GraphicsMagickWand-config
