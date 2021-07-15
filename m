From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 15 Jul 2021 22:25:44 +0200
Subject: [Buildroot] [git commit] package/libqb: add LIBQB_CPE_ID_VENDOR
Message-ID: <20210715195212.0F10690F64@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

commit: https://git.buildroot.net/buildroot/commit/?id=6112db301ac6a3adbda821f0c42d41456d21b266
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:clusterlabs:libqb is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aclusterlabs%3Alibqb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libqb/libqb.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libqb/libqb.mk b/package/libqb/libqb.mk
index 9da6d7f900..a0d97d5eb8 100644
--- a/package/libqb/libqb.mk
+++ b/package/libqb/libqb.mk
@@ -8,6 +8,7 @@ LIBQB_VERSION = 2.0.2
 LIBQB_SITE = $(call github,ClusterLabs,libqb,v$(LIBQB_VERSION))
 LIBQB_LICENSE = LGPL-2.1+
 LIBQB_LICENSE_FILES = COPYING
+LIBQB_CPE_ID_VENDOR = clusterlabs
 LIBQB_INSTALL_STAGING = YES
 LIBQB_AUTORECONF = YES
 LIBQB_DEPENDENCIES = libxml2
