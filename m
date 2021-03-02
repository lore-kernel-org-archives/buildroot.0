From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue,  2 Mar 2021 14:59:09 +0100
Subject: [Buildroot] [PATCH 1/1] package/gd: add CPE variables
Message-ID: <20210302135909.364187-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:libgd:libgd is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alibgd%3Alibgd

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gd/gd.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/gd/gd.mk b/package/gd/gd.mk
index f54c2b37a2..c7037f8dbc 100644
--- a/package/gd/gd.mk
+++ b/package/gd/gd.mk
@@ -10,6 +10,8 @@ GD_SITE = https://github.com/libgd/libgd/releases/download/gd-$(GD_VERSION)
 GD_INSTALL_STAGING = YES
 GD_LICENSE = GD license
 GD_LICENSE_FILES = COPYING
+GD_CPE_ID_VENDOR = libgd
+GD_CPE_ID_PRODUCT = libgd
 GD_CONF_OPTS = --without-x --disable-rpath --disable-werror
 GD_DEPENDENCIES = host-pkgconf
 
-- 
2.30.0
