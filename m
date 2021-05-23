From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 May 2021 19:49:23 +0200
Subject: [Buildroot] [git commit] package/minizip: add MINIZIP_CPE_ID_VENDOR
Message-ID: <20210523172850.8559E88F9F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=425339dcdfb2d4fa16ee11231752a5cc8250e78f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:minizip_project:minizip is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aminizip_project%3Aminizip

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998 at free.fr: fix typo MINZIP -> MINIZIP]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/minizip/minizip.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/minizip/minizip.mk b/package/minizip/minizip.mk
index b2294fb530..53f33fb9c1 100644
--- a/package/minizip/minizip.mk
+++ b/package/minizip/minizip.mk
@@ -14,6 +14,7 @@ MINIZIP_CONF_OPTS = \
 	-DMZ_FETCH_LIBS=OFF
 MINIZIP_LICENSE = Zlib
 MINIZIP_LICENSE_FILES = LICENSE
+MINIZIP_CPE_ID_VENDOR = minizip_project
 
 ifeq ($(BR2_PACKAGE_BZIP2),y)
 MINIZIP_DEPENDENCIES += bzip2
