From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed,  3 Mar 2021 10:29:19 +0100
Subject: [Buildroot] [PATCH 1/1] package/netatalk: set NETATALK_CPE_ID_VALID
Message-ID: <20210303092919.469107-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:netatalk_project:netatalk is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Anetatalk_project%3Anetatalk

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/netatalk/netatalk.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/netatalk/netatalk.mk b/package/netatalk/netatalk.mk
index 1214fc3bf5..afe87bb409 100644
--- a/package/netatalk/netatalk.mk
+++ b/package/netatalk/netatalk.mk
@@ -14,6 +14,7 @@ NETATALK_DEPENDENCIES = host-pkgconf openssl berkeleydb libgcrypt libgpg-error \
 	libevent
 NETATALK_LICENSE = GPL-2.0+, LGPL-3.0+, MIT-like
 NETATALK_LICENSE_FILES = COPYING COPYRIGHT
+NETATALK_CPE_ID_VALID = YES
 
 # Don't run ldconfig!
 NETATALK_CONF_ENV += CC="$(TARGET_CC) -std=gnu99" \
-- 
2.30.0
