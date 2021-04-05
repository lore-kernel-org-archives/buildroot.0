From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 5 Apr 2021 09:29:06 +0200
Subject: [Buildroot] [git commit] package/python-pyopenssl: add CPE variables
Message-ID: <20210405070517.8468E7FB91@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c16848b938e6f7b4652dd487766f18086c2c0730
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:pyopenssl:pyopenssl is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Apyopenssl%3Apyopenssl

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-pyopenssl/python-pyopenssl.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-pyopenssl/python-pyopenssl.mk b/package/python-pyopenssl/python-pyopenssl.mk
index bbbd836a1b..a7ea7edfde 100644
--- a/package/python-pyopenssl/python-pyopenssl.mk
+++ b/package/python-pyopenssl/python-pyopenssl.mk
@@ -9,6 +9,8 @@ PYTHON_PYOPENSSL_SOURCE = pyOpenSSL-$(PYTHON_PYOPENSSL_VERSION).tar.gz
 PYTHON_PYOPENSSL_SITE = https://files.pythonhosted.org/packages/0d/1d/6cc4bd4e79f78be6640fab268555a11af48474fac9df187c3361a1d1d2f0
 PYTHON_PYOPENSSL_LICENSE = Apache-2.0
 PYTHON_PYOPENSSL_LICENSE_FILES = LICENSE
+PYTHON_PYOPENSSL_CPE_ID_VENDOR = pyopenssl
+PYTHON_PYOPENSSL_CPE_ID_PRODUCT = pyopenssl
 PYTHON_PYOPENSSL_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
