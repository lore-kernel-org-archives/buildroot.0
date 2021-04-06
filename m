From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 6 Apr 2021 11:23:52 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/python-m2crypto:
 add CPE variables
Message-ID: <20210406090707.8E39082AA2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d42544c303e1eb5eb292401e216e48039f2b9920
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

cpe:2.3:a:m2crypto_project:m2crypto is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Am2crypto_project%3Am2crypto

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 4dcd1dcf6787a3b1b6d49f7703e751bb3efdf7e3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-m2crypto/python-m2crypto.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-m2crypto/python-m2crypto.mk b/package/python-m2crypto/python-m2crypto.mk
index ccc63058ce..fb26be46dc 100644
--- a/package/python-m2crypto/python-m2crypto.mk
+++ b/package/python-m2crypto/python-m2crypto.mk
@@ -10,6 +10,8 @@ PYTHON_M2CRYPTO_SITE = https://files.pythonhosted.org/packages/ff/df/84609ed874b
 PYTHON_M2CRYPTO_SETUP_TYPE = setuptools
 PYTHON_M2CRYPTO_LICENSE = MIT
 PYTHON_M2CRYPTO_LICENSE_FILES = LICENCE
+PYTHON_M2CRYPTO_CPE_ID_VENDOR = m2crypto_project
+PYTHON_M2CRYPTO_CPE_ID_PRODUCT = m2crypto
 PYTHON_M2CRYPTO_DEPENDENCIES = openssl host-swig
 PYTHON_M2CRYPTO_BUILD_OPTS = --openssl=$(STAGING_DIR)/usr
 
