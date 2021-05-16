From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 16 May 2021 18:30:45 +0200
Subject: [Buildroot] [git commit] package/enlightenment: add
 ENLIGHTENMENT_CPE_ID_VENDOR
Message-ID: <20210516161236.3516387939@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e7b8832a5e9dc50712b58e28f3be2b1a8497a6d3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:enlightenment:enlightenment is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aenlightenment%3Aenlightenment

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/enlightenment/enlightenment.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/enlightenment/enlightenment.mk b/package/enlightenment/enlightenment.mk
index 12827964e1..969b391cdc 100644
--- a/package/enlightenment/enlightenment.mk
+++ b/package/enlightenment/enlightenment.mk
@@ -10,6 +10,7 @@ ENLIGHTENMENT_SITE = http://download.enlightenment.org/rel/apps/enlightenment
 ENLIGHTENMENT_LICENSE = BSD-2-Clause, OFL-1.1 (font)
 ENLIGHTENMENT_LICENSE_FILES = COPYING \
 	src/modules/wl_weekeyboard/themes/default/fonts/LICENSE.txt
+ENLIGHTENMENT_CPE_ID_VENDOR = enlightenment
 
 ENLIGHTENMENT_DEPENDENCIES = \
 	host-pkgconf \
