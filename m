From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu,  4 Feb 2021 20:03:22 +0100
Subject: [Buildroot] [PATCH 1/1] package/capnproto: add
 CAPNPROTO_CPE_ID_VENDOR
Message-ID: <20210204190322.1270491-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:capnproto:capnproto is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Acapnproto%3Acapnproto

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/capnproto/capnproto.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/capnproto/capnproto.mk b/package/capnproto/capnproto.mk
index 2e7b095cbf..901b57ecda 100644
--- a/package/capnproto/capnproto.mk
+++ b/package/capnproto/capnproto.mk
@@ -8,6 +8,7 @@ CAPNPROTO_VERSION = 0.8.0
 CAPNPROTO_SITE = $(call github,capnproto,capnproto,v$(CAPNPROTO_VERSION))
 CAPNPROTO_LICENSE = MIT
 CAPNPROTO_LICENSE_FILES = LICENSE
+CAPNPROTO_CPE_ID_VENDOR = capnproto
 CAPNPROTO_INSTALL_STAGING = YES
 # Fetched from Github with no configure script
 CAPNPROTO_AUTORECONF = YES
-- 
2.29.2
