From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 20 Apr 2021 23:22:30 +0200
Subject: [Buildroot] [git commit] package/libnl: add _CPE_ID_VENDOR
Message-ID: <20210420205903.3ADD6815BF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=56d54119b13a480e5c81a2808bb0462d8c062b43
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:libnl_project:libnl:* is a valid CPE identifier for this package:

 https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe:2.3:a:libnl_project:libnl

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
[yann.morin.1998 at free.fr: move up, right after license]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libnl/libnl.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libnl/libnl.mk b/package/libnl/libnl.mk
index 795dfc2316..fc9398b29a 100644
--- a/package/libnl/libnl.mk
+++ b/package/libnl/libnl.mk
@@ -8,6 +8,8 @@ LIBNL_VERSION = 3.5.0
 LIBNL_SITE = https://github.com/thom311/libnl/releases/download/libnl$(subst .,_,$(LIBNL_VERSION))
 LIBNL_LICENSE = LGPL-2.1+
 LIBNL_LICENSE_FILES = COPYING
+LIBNL_CPE_ID_VENDOR = libnl_project
+
 LIBNL_INSTALL_STAGING = YES
 LIBNL_DEPENDENCIES = host-bison host-flex host-pkgconf
 
