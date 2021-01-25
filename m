From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 25 Jan 2021 23:45:25 +0100
Subject: [Buildroot] [PATCH 1/1] package/nettle: set NETTLE_CPE_ID_VALID
Message-ID: <20210125224525.1358685-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:nettle_project:nettle is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Anettle_project%3Anettle

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/nettle/nettle.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/nettle/nettle.mk b/package/nettle/nettle.mk
index 50ebdc706b..68844976ea 100644
--- a/package/nettle/nettle.mk
+++ b/package/nettle/nettle.mk
@@ -10,6 +10,7 @@ NETTLE_DEPENDENCIES = gmp
 NETTLE_INSTALL_STAGING = YES
 NETTLE_LICENSE = Dual GPL-2.0+/LGPL-3.0+
 NETTLE_LICENSE_FILES = COPYING.LESSERv3 COPYINGv2
+NETTLE_CPE_ID_VALID = YES
 # don't include openssl support for (unused) examples as it has problems
 # with static linking
 NETTLE_CONF_OPTS = --disable-openssl
-- 
2.29.2
