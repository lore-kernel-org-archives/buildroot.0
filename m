From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 19 Jun 2021 22:38:09 +0200
Subject: [Buildroot] [PATCH 1/1] package/libqb: add LIBQB_CPE_ID_VENDOR
Message-ID: <20210619203809.387843-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:clusterlabs:libqb is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aclusterlabs%3Alibqb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
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
-- 
2.30.2
