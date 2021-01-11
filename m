From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 11 Jan 2021 22:13:43 +0100
Subject: [Buildroot] [git commit] package/links: add LINKS_CPE_ID_VENDOR
Message-ID: <20210111205522.42C07873BB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=31b2274c5b2a9a8677640703ea64c32508525735
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:twibright:links is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Atwibright%3Alinks

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Matthew Weber >matthew.weber at rockwellcollins.com
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/links/links.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/links/links.mk b/package/links/links.mk
index 815b4dd733..5213e02bd5 100644
--- a/package/links/links.mk
+++ b/package/links/links.mk
@@ -10,6 +10,7 @@ LINKS_SITE = http://links.twibright.com/download
 LINKS_DEPENDENCIES = host-pkgconf
 LINKS_LICENSE = GPL-2.0+
 LINKS_LICENSE_FILES = COPYING
+LINKS_CPE_ID_VENDOR = twibright
 
 ifeq ($(BR2_PACKAGE_LINKS_GRAPHICS),y)
 LINKS_CONF_OPTS += --enable-graphics
