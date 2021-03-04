From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 4 Mar 2021 08:06:50 +0100
Subject: [Buildroot] [git commit] package/libvorbis: add
 LIBVORBIS_CPE_ID_VENDOR
Message-ID: <20210304065254.C964B86F0C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=24b1b6489b6d49e88daef102ab93d0d991490c66
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:xiph.org:libvorbis is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Axiph.org%3Alibvorbis

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libvorbis/libvorbis.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libvorbis/libvorbis.mk b/package/libvorbis/libvorbis.mk
index 95c43d959e..c1baa18515 100644
--- a/package/libvorbis/libvorbis.mk
+++ b/package/libvorbis/libvorbis.mk
@@ -12,5 +12,6 @@ LIBVORBIS_CONF_OPTS = --disable-oggtest
 LIBVORBIS_DEPENDENCIES = host-pkgconf libogg
 LIBVORBIS_LICENSE = BSD-3-Clause
 LIBVORBIS_LICENSE_FILES = COPYING
+LIBVORBIS_CPE_ID_VENDOR = xiph.org
 
 $(eval $(autotools-package))
