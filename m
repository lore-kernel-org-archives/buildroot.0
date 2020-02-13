From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 12 Feb 2020 22:46:12 -0700
Subject: [Buildroot] [PATCH 1/1] package/python-pyopenssl: bump to version
 19.1.0
Message-ID: <20200213054612.35952-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pyopenssl/python-pyopenssl.hash | 4 ++--
 package/python-pyopenssl/python-pyopenssl.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyopenssl/python-pyopenssl.hash b/package/python-pyopenssl/python-pyopenssl.hash
index 30071cf9ff..b457aeacdd 100644
--- a/package/python-pyopenssl/python-pyopenssl.hash
+++ b/package/python-pyopenssl/python-pyopenssl.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyopenssl/json
-md5 b9876625dc1d5a5a662d748689191537  pyOpenSSL-19.0.0.tar.gz
-sha256 aeca66338f6de19d1aa46ed634c3b9ae519a64b458f8468aec688e7e3c20f200  pyOpenSSL-19.0.0.tar.gz
+md5 d9804fedbd1eb0c7d9243397b1fbf972  pyOpenSSL-19.1.0.tar.gz
+sha256 9a24494b2602aaf402be5c9e30a0b82d4a5c67528fe8fb475e3f3bc00dd69507  pyOpenSSL-19.1.0.tar.gz
 # Locally computed sha256
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-pyopenssl/python-pyopenssl.mk b/package/python-pyopenssl/python-pyopenssl.mk
index d341ef124d..bbbd836a1b 100644
--- a/package/python-pyopenssl/python-pyopenssl.mk
+++ b/package/python-pyopenssl/python-pyopenssl.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYOPENSSL_VERSION = 19.0.0
+PYTHON_PYOPENSSL_VERSION = 19.1.0
 PYTHON_PYOPENSSL_SOURCE = pyOpenSSL-$(PYTHON_PYOPENSSL_VERSION).tar.gz
-PYTHON_PYOPENSSL_SITE = https://files.pythonhosted.org/packages/40/d0/8efd61531f338a89b4efa48fcf1972d870d2b67a7aea9dcf70783c8464dc
+PYTHON_PYOPENSSL_SITE = https://files.pythonhosted.org/packages/0d/1d/6cc4bd4e79f78be6640fab268555a11af48474fac9df187c3361a1d1d2f0
 PYTHON_PYOPENSSL_LICENSE = Apache-2.0
 PYTHON_PYOPENSSL_LICENSE_FILES = LICENSE
 PYTHON_PYOPENSSL_SETUP_TYPE = setuptools
-- 
2.20.1
