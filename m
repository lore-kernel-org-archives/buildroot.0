From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 19 Jan 2021 21:22:57 +0100
Subject: [Buildroot] [git commit] package/libbluray: add
 LIBBLURAY_CPE_ID_VENDOR
Message-ID: <20210119200359.2227C82A54@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9bde558f646f1c0dd7399b0e4e94511aab59f659
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:videolan:libbluray is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Avideolan%3Alibbluray

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libbluray/libbluray.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libbluray/libbluray.mk b/package/libbluray/libbluray.mk
index e2d7fc0c7d..36f59190b1 100644
--- a/package/libbluray/libbluray.mk
+++ b/package/libbluray/libbluray.mk
@@ -10,6 +10,7 @@ LIBBLURAY_SOURCE = libbluray-$(LIBBLURAY_VERSION).tar.bz2
 LIBBLURAY_INSTALL_STAGING = YES
 LIBBLURAY_LICENSE = LGPL-2.1+
 LIBBLURAY_LICENSE_FILES = COPYING
+LIBBLURAY_CPE_ID_VENDOR = videolan
 LIBBLURAY_DEPENDENCIES = host-pkgconf
 
 LIBBLURAY_CONF_OPTS = --disable-bdjava-jar
