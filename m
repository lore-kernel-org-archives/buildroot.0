From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 16 May 2021 18:30:45 +0200
Subject: [Buildroot] [git commit] package/frr: add CPE variables
Message-ID: <20210516161236.5D1248793E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c4c11c2e1a9df5f9c674186a4595c469c563ef98
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:linuxfoundation:free_range_routing is a valid CPE identifier
for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alinuxfoundation%3Afree_range_routing

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/frr/frr.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/frr/frr.mk b/package/frr/frr.mk
index 0907c0ad97..d1ca6e0b18 100644
--- a/package/frr/frr.mk
+++ b/package/frr/frr.mk
@@ -8,6 +8,8 @@ FRR_VERSION = 7.5.1
 FRR_SITE = $(call github,FRRouting,frr,frr-$(FRR_VERSION))
 FRR_LICENSE = GPL-2.0
 FRR_LICENSE_FILES = COPYING
+FRR_CPE_ID_VENDOR = linuxfoundation
+FRR_CPE_ID_PRODUCT = free_range_routing
 FRR_AUTORECONF = YES
 
 FRR_DEPENDENCIES = host-frr readline json-c \
