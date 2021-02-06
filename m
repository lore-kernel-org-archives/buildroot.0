From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  6 Feb 2021 16:50:11 +0100
Subject: [Buildroot] [PATCH 1/1] package/unbound: add UNBOUND_CPE_ID_VENDOR
Message-ID: <20210206155011.2004009-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:nlnetlabs:unbound is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Anlnetlabs%3Aunbound

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/unbound/unbound.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/unbound/unbound.mk b/package/unbound/unbound.mk
index 8b7d1e8e9f..faed60ccb9 100644
--- a/package/unbound/unbound.mk
+++ b/package/unbound/unbound.mk
@@ -9,6 +9,7 @@ UNBOUND_SITE = https://www.unbound.net/downloads
 UNBOUND_DEPENDENCIES = host-pkgconf expat libevent openssl
 UNBOUND_LICENSE = BSD-3-Clause
 UNBOUND_LICENSE_FILES = LICENSE
+UNBOUND_CPE_ID_VENDOR = nlnetlabs
 UNBOUND_CONF_OPTS = \
 	--disable-rpath \
 	--disable-debug \
-- 
2.29.2
