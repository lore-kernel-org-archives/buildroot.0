From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 5 Mar 2021 13:59:54 +0100
Subject: [Buildroot] [git commit] package/poppler: add POPPLER_CPE_ID_VENDOR
Message-ID: <20210305123920.1F094812AF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3bf012797135b91cbf3027ff2846b4e0787ad7d4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:freedesktop:poppler is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Afreedesktop%3Apoppler

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/poppler/poppler.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/poppler/poppler.mk b/package/poppler/poppler.mk
index aba8602e06..44ad04bf7c 100644
--- a/package/poppler/poppler.mk
+++ b/package/poppler/poppler.mk
@@ -10,6 +10,7 @@ POPPLER_SITE = http://poppler.freedesktop.org
 POPPLER_DEPENDENCIES = fontconfig host-pkgconf
 POPPLER_LICENSE = GPL-2.0+
 POPPLER_LICENSE_FILES = COPYING
+POPPLER_CPE_ID_VENDOR = freedesktop
 POPPLER_INSTALL_STAGING = YES
 
 POPPLER_CONF_OPTS = \
