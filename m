From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 4 Mar 2021 19:53:39 +0100
Subject: [Buildroot] [git commit] package/minicom: set MINICOM_CPE_ID_VALID
Message-ID: <20210304183428.B8C4F8704B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d282eaebb0d903120fd69ccada968530bd6868fc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:minicom_project:minicom is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aminicom_project%3Aminicom

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/minicom/minicom.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/minicom/minicom.mk b/package/minicom/minicom.mk
index 1e12725983..7a8b2ef369 100644
--- a/package/minicom/minicom.mk
+++ b/package/minicom/minicom.mk
@@ -10,6 +10,7 @@ MINICOM_SITE = \
 	https://salsa.debian.org/minicom-team/minicom/-/archive/$(MINICOM_VERSION)
 MINICOM_LICENSE = GPL-2.0+
 MINICOM_LICENSE_FILES = COPYING
+MINICOM_CPE_ID_VALID = YES
 MINICOM_AUTORECONF = YES
 
 MINICOM_DEPENDENCIES = ncurses $(if $(BR2_ENABLE_LOCALE),,libiconv) \
