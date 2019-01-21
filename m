From: Asaf Kahlon <asafka7@gmail.com>
Date: Mon, 21 Jan 2019 22:19:28 +0200
Subject: [Buildroot] [PATCH 1/1] python-pyopenssl: bump to version 19.0.0
Message-ID: <20190121201929.4730-1-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-pyopenssl/python-pyopenssl.hash | 4 ++--
 package/python-pyopenssl/python-pyopenssl.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyopenssl/python-pyopenssl.hash b/package/python-pyopenssl/python-pyopenssl.hash
index ebd16cf28b..30071cf9ff 100644
--- a/package/python-pyopenssl/python-pyopenssl.hash
+++ b/package/python-pyopenssl/python-pyopenssl.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyopenssl/json
-md5 c92e9c85b520b7e153fef0f7f3c5dda7  pyOpenSSL-18.0.0.tar.gz
-sha256 6488f1423b00f73b7ad5167885312bb0ce410d3312eb212393795b53c8caa580  pyOpenSSL-18.0.0.tar.gz
+md5 b9876625dc1d5a5a662d748689191537  pyOpenSSL-19.0.0.tar.gz
+sha256 aeca66338f6de19d1aa46ed634c3b9ae519a64b458f8468aec688e7e3c20f200  pyOpenSSL-19.0.0.tar.gz
 # Locally computed sha256
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-pyopenssl/python-pyopenssl.mk b/package/python-pyopenssl/python-pyopenssl.mk
index afdd06500f..d341ef124d 100644
--- a/package/python-pyopenssl/python-pyopenssl.mk
+++ b/package/python-pyopenssl/python-pyopenssl.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYOPENSSL_VERSION = 18.0.0
+PYTHON_PYOPENSSL_VERSION = 19.0.0
 PYTHON_PYOPENSSL_SOURCE = pyOpenSSL-$(PYTHON_PYOPENSSL_VERSION).tar.gz
-PYTHON_PYOPENSSL_SITE = https://files.pythonhosted.org/packages/9b/7c/ee600b2a9304d260d96044ab5c5e57aa489755b92bbeb4c0803f9504f480
+PYTHON_PYOPENSSL_SITE = https://files.pythonhosted.org/packages/40/d0/8efd61531f338a89b4efa48fcf1972d870d2b67a7aea9dcf70783c8464dc
 PYTHON_PYOPENSSL_LICENSE = Apache-2.0
 PYTHON_PYOPENSSL_LICENSE_FILES = LICENSE
 PYTHON_PYOPENSSL_SETUP_TYPE = setuptools
-- 
2.19.1
