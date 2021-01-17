From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 17 Jan 2021 19:15:56 +0100
Subject: [Buildroot] [PATCH 1/1] package/graphicsmagick: add
 GRAPHICSMAGICK_CPE_ID_VENDOR
Message-ID: <20210117181556.368049-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:graphicsmagick:graphicsmagick is a valid CPE identifier for
this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Agraphicsmagick%3Agraphicsmagick

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
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
-- 
2.29.2
