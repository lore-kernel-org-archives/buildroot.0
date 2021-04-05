From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon,  5 Apr 2021 11:30:25 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-m2crypto: add CPE variables
Message-ID: <20210405093025.3530666-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:m2crypto_project:m2crypto is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Am2crypto_project%3Am2crypto

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-m2crypto/python-m2crypto.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-m2crypto/python-m2crypto.mk b/package/python-m2crypto/python-m2crypto.mk
index 557985eb0e..995c5cd626 100644
--- a/package/python-m2crypto/python-m2crypto.mk
+++ b/package/python-m2crypto/python-m2crypto.mk
@@ -10,6 +10,8 @@ PYTHON_M2CRYPTO_SITE = https://files.pythonhosted.org/packages/aa/36/9fef97358e3
 PYTHON_M2CRYPTO_SETUP_TYPE = setuptools
 PYTHON_M2CRYPTO_LICENSE = MIT
 PYTHON_M2CRYPTO_LICENSE_FILES = LICENCE
+PYTHON_M2CRYPTO_CPE_ID_VENDOR = m2crypto_project
+PYTHON_M2CRYPTO_CPE_ID_PRODUCT = m2crypto
 PYTHON_M2CRYPTO_DEPENDENCIES = openssl host-swig
 PYTHON_M2CRYPTO_BUILD_OPTS = --openssl=$(STAGING_DIR)/usr
 
-- 
2.30.2
