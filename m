From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 22 May 2021 21:59:44 +0200
Subject: [Buildroot] [git commit] package/pigz: add PIGZ_CPE_ID_VENDOR
Message-ID: <20210522193402.C55AF86D89@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1ee888c2481c6bdf3dc00644cee1970411de9a1a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:zlib:pigz is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Azlib%3Apigz

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pigz/pigz.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pigz/pigz.mk b/package/pigz/pigz.mk
index fdf5fa40e8..3e5e892797 100644
--- a/package/pigz/pigz.mk
+++ b/package/pigz/pigz.mk
@@ -10,6 +10,7 @@ PIGZ_DEPENDENCIES = zlib
 HOST_PIGZ_DEPENDENCIES = host-zlib
 PIGZ_LICENSE = Zlib
 PIGZ_LICENSE_FILES = README
+PIGZ_CPE_ID_VENDOR = zlib
 
 define PIGZ_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
