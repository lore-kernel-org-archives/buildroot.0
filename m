From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 30 Jan 2021 14:48:35 +0100
Subject: [Buildroot] [PATCH 1/1] package/vde2: add CPE variables
Message-ID: <20210130134835.2368583-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:vde_project:vde is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Avde_project%3Avde

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/vde2/vde2.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/vde2/vde2.mk b/package/vde2/vde2.mk
index 29337601c4..76d6f352b7 100644
--- a/package/vde2/vde2.mk
+++ b/package/vde2/vde2.mk
@@ -9,6 +9,8 @@ VDE2_SOURCE = vde2-$(VDE2_VERSION).tar.bz2
 VDE2_SITE = http://downloads.sourceforge.net/project/vde/vde2/$(VDE2_VERSION)
 VDE2_LICENSE = GPL-2.0+, LGPL-2.1+, BSD-3-Clause
 VDE2_LICENSE_FILES = COPYING COPYING.libvdeplug COPYING.slirpvde
+VDE2_CPE_ID_VENDOR = vde_project
+VDE2_CPE_ID_PRODUCT = vde
 VDE2_INSTALL_STAGING = YES
 
 # We touch configure.ac, so we need to autoreconf
-- 
2.29.2
