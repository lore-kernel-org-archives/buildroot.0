From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 16 May 2021 13:25:04 +0200
Subject: [Buildroot] [PATCH 1/1] package/libldns: add CPE variables
Message-ID: <20210516112504.3774346-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:nlnetlabs:ldns is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Anlnetlabs%3Aldns

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libldns/libldns.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libldns/libldns.mk b/package/libldns/libldns.mk
index 75159389de..9c248bbc19 100644
--- a/package/libldns/libldns.mk
+++ b/package/libldns/libldns.mk
@@ -9,6 +9,8 @@ LIBLDNS_SOURCE = ldns-$(LIBLDNS_VERSION).tar.gz
 LIBLDNS_SITE = http://www.nlnetlabs.nl/downloads/ldns
 LIBLDNS_LICENSE = BSD-3-Clause
 LIBLDNS_LICENSE_FILES = LICENSE
+LIBLDNS_CPE_ID_VENDOR = nlnetlabs
+LIBLDNS_CPE_ID_PRODUCT = ldns
 LIBLDNS_INSTALL_STAGING = YES
 LIBLDNS_DEPENDENCIES = openssl
 # --disable-dane-verify can be removed after openssl bump to 1.1.x
-- 
2.30.2
