From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 May 2021 13:47:21 +0200
Subject: [Buildroot] [git commit] package/p7zip: add P7ZIP_CPE_ID_VENDOR
Message-ID: <20210523112054.30A1B813CA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=77d1a1be546aac3773e390b2a15647114567da1f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:7-zip:p7zip is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3A7-zip%3Ap7zip

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/p7zip/p7zip.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/p7zip/p7zip.mk b/package/p7zip/p7zip.mk
index 59cd9b7e95..43fbe775dc 100644
--- a/package/p7zip/p7zip.mk
+++ b/package/p7zip/p7zip.mk
@@ -9,6 +9,7 @@ P7ZIP_SOURCE = p7zip_$(P7ZIP_VERSION)_src_all.tar.bz2
 P7ZIP_SITE = http://downloads.sourceforge.net/project/p7zip/p7zip/$(P7ZIP_VERSION)
 P7ZIP_LICENSE = LGPL-2.1+ with unRAR restriction
 P7ZIP_LICENSE_FILES = DOC/License.txt
+P7ZIP_CPE_ID_VENDOR = 7-zip
 
 # 0001-CVE-2016-9296.patch
 P7ZIP_IGNORE_CVES += CVE-2016-9296
