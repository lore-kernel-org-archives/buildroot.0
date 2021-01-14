From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 14 Jan 2021 23:19:49 +0100
Subject: [Buildroot] [git commit] package/thrift: add THRIFT_CPE_ID_VENDOR
Message-ID: <20210114220107.5E179877A5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0f100d333b9d7bb01440bb34a36c31c54b7cb254
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:apache:thrift is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aapache%3Athrift

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/thrift/thrift.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/thrift/thrift.mk b/package/thrift/thrift.mk
index 8ad37b6b2e..0f2a8eb071 100644
--- a/package/thrift/thrift.mk
+++ b/package/thrift/thrift.mk
@@ -8,6 +8,7 @@ THRIFT_VERSION = 0.13.0
 THRIFT_SITE = http://www.us.apache.org/dist/thrift/$(THRIFT_VERSION)
 THRIFT_LICENSE = Apache-2.0
 THRIFT_LICENSE_FILES = LICENSE
+THRIFT_CPE_ID_VENDOR = apache
 
 THRIFT_DEPENDENCIES = host-pkgconf host-thrift boost \
 	libevent openssl zlib
