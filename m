From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 21 Mar 2021 11:26:05 +0100
Subject: [Buildroot] [git commit] package/gettext-gnu: add CPE variables
Message-ID: <20210321100356.BC7AE88D17@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=15b6cae49a8f1e48362732ed1845307fdd505f04
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:gnu:gettext is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Agnu%3Agettext

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/gettext-gnu/gettext-gnu.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/gettext-gnu/gettext-gnu.mk b/package/gettext-gnu/gettext-gnu.mk
index ee7e97baf7..9a1eabd0df 100644
--- a/package/gettext-gnu/gettext-gnu.mk
+++ b/package/gettext-gnu/gettext-gnu.mk
@@ -11,6 +11,8 @@ GETTEXT_GNU_SOURCE = gettext-$(GETTEXT_GNU_VERSION).tar.xz
 GETTEXT_GNU_INSTALL_STAGING = YES
 GETTEXT_GNU_LICENSE = LGPL-2.1+ (libintl), GPL-3.0+ (the rest)
 GETTEXT_GNU_LICENSE_FILES = COPYING gettext-runtime/intl/COPYING.LIB
+GETTEXT_GNU_CPE_ID_VENDOR = gnu
+GETTEXT_GNU_CPE_ID_PRODUCT = gettext
 # 0002-restore-the-ability-to-buld-gettext-tools-seperately-part1.patch
 GETTEXT_GNU_AUTORECONF = YES
 GETTEXT_GNU_PROVIDES = gettext
