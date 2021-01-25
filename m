From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 25 Jan 2021 23:43:05 +0100
Subject: [Buildroot] [PATCH 1/1] package/trousers: add TROUSERS_CPE_ID_VENDOR
Message-ID: <20210125224305.1358348-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:trustedcomputinggroup:trousers is a valid CPE identifier for
this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Atrustedcomputinggroup%3Atrousers

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/trousers/trousers.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/trousers/trousers.mk b/package/trousers/trousers.mk
index b2cfef0968..b84425dea4 100644
--- a/package/trousers/trousers.mk
+++ b/package/trousers/trousers.mk
@@ -8,6 +8,7 @@ TROUSERS_VERSION = 0.3.15
 TROUSERS_SITE = http://downloads.sourceforge.net/project/trousers/trousers/$(TROUSERS_VERSION)
 TROUSERS_LICENSE = BSD-3-Clause
 TROUSERS_LICENSE_FILES = LICENSE
+TROUSERS_CPE_ID_VENDOR = trustedcomputinggroup
 TROUSERS_INSTALL_STAGING = YES
 # Need autoreconf because of a patch touching configure.in and Makefile.am
 TROUSERS_AUTORECONF = YES
-- 
2.29.2
