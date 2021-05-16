From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 16 May 2021 19:10:04 +0200
Subject: [Buildroot] [PATCH 1/1] package/libuv: add LIBUV_CPE_ID_VENDOR
Message-ID: <20210516171004.4307-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:libuv:libuv is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alibuv%3Alibuv

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libuv/libuv.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libuv/libuv.mk b/package/libuv/libuv.mk
index 5876ab8935..403a049037 100644
--- a/package/libuv/libuv.mk
+++ b/package/libuv/libuv.mk
@@ -13,6 +13,7 @@ LIBUV_INSTALL_STAGING = YES
 LIBUV_AUTORECONF = YES
 LIBUV_LICENSE = BSD-2-Clause, BSD-3-Clause, ISC, MIT
 LIBUV_LICENSE_FILES = LICENSE
+LIBUV_CPE_ID_VENDOR = libuv
 
 # Upstream needs tests to be run sequentially. This is the default in
 # automake 1.11 and before, but not starting in 1.12. To maintain
-- 
2.30.2
