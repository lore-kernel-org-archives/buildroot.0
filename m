From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  3 Apr 2021 10:55:30 +0200
Subject: [Buildroot] [PATCH 1/1] package/libvpx: add LIBVPX_CPE_ID_VENDOR
Message-ID: <20210403085530.2217219-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:webmproject:libvpx is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Awebmproject%3Alibvpx

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libvpx/libvpx.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libvpx/libvpx.mk b/package/libvpx/libvpx.mk
index 26d211cf86..3093242d14 100644
--- a/package/libvpx/libvpx.mk
+++ b/package/libvpx/libvpx.mk
@@ -8,6 +8,7 @@ LIBVPX_VERSION = 1.9.0
 LIBVPX_SITE = $(call github,webmproject,libvpx,v$(LIBVPX_VERSION))
 LIBVPX_LICENSE = BSD-3-Clause
 LIBVPX_LICENSE_FILES = LICENSE PATENTS
+LIBVPX_CPE_ID_VENDOR = webmproject
 LIBVPX_INSTALL_STAGING = YES
 
 # ld is being used with cc options. therefore, pretend ld is cc.
-- 
2.30.2
