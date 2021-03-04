From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 4 Mar 2021 08:12:21 +0100
Subject: [Buildroot] [git commit] package/libpjsip: add CPE variables
Message-ID: <20210304065255.1CB8686AA7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e51733c12617e29c53a21e78a7d648669b594b1e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:pjsip:pjsip is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Apjsip%3Apjsip

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libpjsip/libpjsip.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
index f0956d11ae..8feec9bcb2 100644
--- a/package/libpjsip/libpjsip.mk
+++ b/package/libpjsip/libpjsip.mk
@@ -12,6 +12,8 @@ LIBPJSIP_SITE = $(call github,pjsip,pjproject,$(LIBPJSIP_VERSION))
 LIBPJSIP_DEPENDENCIES = libsrtp
 LIBPJSIP_LICENSE = GPL-2.0+
 LIBPJSIP_LICENSE_FILES = COPYING
+LIBPJSIP_CPE_ID_VENDOR = pjsip
+LIBPJSIP_CPE_ID_PRODUCT = pjsip
 LIBPJSIP_INSTALL_STAGING = YES
 LIBPJSIP_MAKE = $(MAKE1)
 
