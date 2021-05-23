From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 May 2021 13:47:17 +0200
Subject: [Buildroot] [git commit] package/shellinabox: add
 SHELLINABOX_CPE_ID_VENDOR
Message-ID: <20210523112054.11E14813CA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=81009e31d9d79a125dfaf402baeb6e0acf2c6fed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:shellinabox_project:shellinabox is a valid CPE identifier for
this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Ashellinabox_project%3Ashellinabox

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/shellinabox/shellinabox.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/shellinabox/shellinabox.mk b/package/shellinabox/shellinabox.mk
index 4c93fdccef..58c1668112 100644
--- a/package/shellinabox/shellinabox.mk
+++ b/package/shellinabox/shellinabox.mk
@@ -8,6 +8,7 @@ SHELLINABOX_VERSION = 2.20
 SHELLINABOX_SITE = $(call github,shellinabox,shellinabox,v$(SHELLINABOX_VERSION))
 SHELLINABOX_LICENSE = GPL-2.0 with OpenSSL exception
 SHELLINABOX_LICENSE_FILES = COPYING GPL-2
+SHELLINABOX_CPE_ID_VENDOR = shellinabox_project
 
 # 0002-CVE-2018-16789-fix-for-broken-multipart-form-data.patch
 SHELLINABOX_IGNORE_CVES += CVE-2018-16789
