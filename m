From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  4 Jul 2021 14:45:35 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-m2crypto: bump to version
 0.38.0
Message-ID: <20210704124535.3279143-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update indentation in hash file (two spaces)

https://gitlab.com/m2crypto/m2crypto/-/tags/0.38.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-m2crypto/python-m2crypto.hash | 4 ++--
 package/python-m2crypto/python-m2crypto.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-m2crypto/python-m2crypto.hash b/package/python-m2crypto/python-m2crypto.hash
index 1ccc786f51..879f232565 100644
--- a/package/python-m2crypto/python-m2crypto.hash
+++ b/package/python-m2crypto/python-m2crypto.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/m2crypto/json
-md5 1f3095440092ca5e54007d1f3fa2562a M2Crypto-0.37.1.tar.gz
-sha256 e4e42f068b78ccbf113e5d0a72ae5f480f6c3ace4940b91e4fff5598cfff6fb3 M2Crypto-0.37.1.tar.gz
+md5  8f39bfac730b6567e0c2179d15318c60  M2Crypto-0.38.0.tar.gz
+sha256  99f2260a30901c949a8dc6d5f82cd5312ffb8abc92e76633baf231bbbcb2decb  M2Crypto-0.38.0.tar.gz
 # Locally computed sha256 checksums
 sha256  4eca478396f4b2b020729a111fce3f096456d74500bfd8f2b0388c3c69f997c0  LICENCE
diff --git a/package/python-m2crypto/python-m2crypto.mk b/package/python-m2crypto/python-m2crypto.mk
index 995c5cd626..02ad76d3f4 100644
--- a/package/python-m2crypto/python-m2crypto.mk
+++ b/package/python-m2crypto/python-m2crypto.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_M2CRYPTO_VERSION = 0.37.1
+PYTHON_M2CRYPTO_VERSION = 0.38.0
 PYTHON_M2CRYPTO_SOURCE = M2Crypto-$(PYTHON_M2CRYPTO_VERSION).tar.gz
-PYTHON_M2CRYPTO_SITE = https://files.pythonhosted.org/packages/aa/36/9fef97358e378c1d3bd567c4e8f8ca0428a8d7e869852cef445ee6da91fd
+PYTHON_M2CRYPTO_SITE = https://files.pythonhosted.org/packages/2c/52/c35ec79dd97a8ecf6b2bbd651df528abb47705def774a4a15b99977274e8
 PYTHON_M2CRYPTO_SETUP_TYPE = setuptools
 PYTHON_M2CRYPTO_LICENSE = MIT
 PYTHON_M2CRYPTO_LICENSE_FILES = LICENCE
-- 
2.30.2
