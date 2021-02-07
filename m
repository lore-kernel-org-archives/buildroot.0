From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 7 Feb 2021 10:26:36 +0100
Subject: [Buildroot] [git commit] package/freetype: add
 FREETYPE_CPE_ID_VENDOR
Message-ID: <20210207091615.BC06A8122F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cfc54b3d7054cf799f0d105cd838ed4c3bb18730
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:freetype:freetype is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Afreetype%3Afreetype

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/freetype/freetype.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
index e543aee0b2..59d6dc0eb8 100644
--- a/package/freetype/freetype.mk
+++ b/package/freetype/freetype.mk
@@ -11,6 +11,7 @@ FREETYPE_INSTALL_STAGING = YES
 FREETYPE_MAKE_OPTS = CCexe="$(HOSTCC)"
 FREETYPE_LICENSE = Dual FTL/GPL-2.0+
 FREETYPE_LICENSE_FILES = docs/LICENSE.TXT docs/FTL.TXT docs/GPLv2.TXT
+FREETYPE_CPE_ID_VENDOR = freetype
 FREETYPE_DEPENDENCIES = host-pkgconf
 FREETYPE_CONFIG_SCRIPTS = freetype-config
 
