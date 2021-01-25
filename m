From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 25 Jan 2021 23:42:19 +0100
Subject: [Buildroot] [PATCH 1/1] package/beecrypt: set BEECRYPT_CPE_ID_VALID
Message-ID: <20210125224219.1358226-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:beecrypt_project:beecrypt is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Abeecrypt_project%3Abeecrypt

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/beecrypt/beecrypt.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/beecrypt/beecrypt.mk b/package/beecrypt/beecrypt.mk
index f13f72c8ac..20e1a122d0 100644
--- a/package/beecrypt/beecrypt.mk
+++ b/package/beecrypt/beecrypt.mk
@@ -10,6 +10,7 @@ BEECRYPT_AUTORECONF = YES
 BEECRYPT_INSTALL_STAGING = YES
 BEECRYPT_LICENSE = LGPL-2.1+
 BEECRYPT_LICENSE_FILES = COPYING.LIB
+BEECRYPT_CPE_ID_VALID = YES
 
 BEECRYPT_CONF_OPTS = \
 	--disable-expert-mode \
-- 
2.29.2
