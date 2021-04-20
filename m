From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 20 Apr 2021 23:27:51 +0200
Subject: [Buildroot] [git commit] package/libtool: add _CPE_ID_VENDOR
Message-ID: <20210420210150.CDB1083D68@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8c9724026c90aafcebe2b3152b323e733eeeb86f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:gnu:libtool:2.4.6:* is a valid CPE identifier for this package:

 https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe:2.3:a:gnu:libtool

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
[yann.morin.1998 at free.fr: drop version from reference URL]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libtool/libtool.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libtool/libtool.mk b/package/libtool/libtool.mk
index 10af8cf715..6342e70a39 100644
--- a/package/libtool/libtool.mk
+++ b/package/libtool/libtool.mk
@@ -7,6 +7,7 @@
 LIBTOOL_VERSION = 2.4.6
 LIBTOOL_SOURCE = libtool-$(LIBTOOL_VERSION).tar.xz
 LIBTOOL_SITE = $(BR2_GNU_MIRROR)/libtool
+LIBTOOL_CPE_ID_VENDOR = gnu
 
 # For the target variant, we only want to build/install libltdl
 LIBTOOL_SUBDIR = libltdl
