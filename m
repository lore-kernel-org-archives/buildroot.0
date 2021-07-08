From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu,  8 Jul 2021 17:38:20 -0600
Subject: [Buildroot] [PATCH 1/1] package/python{3}-cython: bump to version
 0.29.23
Message-ID: <20210708233820.387287-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-cython/python-cython.hash | 4 ++--
 package/python-cython/python-cython.mk   | 4 ++--
 package/python3-cython/python3-cython.mk | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-cython/python-cython.hash b/package/python-cython/python-cython.hash
index 168d168838..04961ff03f 100644
--- a/package/python-cython/python-cython.hash
+++ b/package/python-cython/python-cython.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/cython/json
-md5  12c5e45af71dcc6dff28cdcbcbef6f39  Cython-0.29.21.tar.gz
-sha256  e57acb89bd55943c8d8bf813763d20b9099cc7165c0f16b707631a7654be9cad  Cython-0.29.21.tar.gz
+md5  82837814b8d72d353e16bb9344e914b1  Cython-0.29.23.tar.gz
+sha256  6a0d31452f0245daacb14c979c77e093eb1a546c760816b5eed0047686baad8e  Cython-0.29.23.tar.gz
 # Locally computed sha256 checksums
 sha256  a6cba85bc92e0cff7a450b1d873c0eaa2e9fc96bf472df0247a26bec77bf3ff9  LICENSE.txt
 sha256  e1eb1c49a8508e8173dac30157e4a6439a44ad8846194746c424fbc3fc2b95d7  COPYING.txt
diff --git a/package/python-cython/python-cython.mk b/package/python-cython/python-cython.mk
index c8dcf382ff..cf32fc19d1 100644
--- a/package/python-cython/python-cython.mk
+++ b/package/python-cython/python-cython.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 # Please keep in sync with package/python3-cython/python3-cython.mk
-PYTHON_CYTHON_VERSION = 0.29.21
+PYTHON_CYTHON_VERSION = 0.29.23
 PYTHON_CYTHON_SOURCE = Cython-$(PYTHON_CYTHON_VERSION).tar.gz
-PYTHON_CYTHON_SITE = https://files.pythonhosted.org/packages/6c/9f/f501ba9d178aeb1f5bf7da1ad5619b207c90ac235d9859961c11829d0160
+PYTHON_CYTHON_SITE = https://files.pythonhosted.org/packages/d9/cd/0d2d90b27219c07f68f1c25bcc7b02dd27639d2180add9d4b73e70945869
 PYTHON_CYTHON_SETUP_TYPE = setuptools
 PYTHON_CYTHON_LICENSE = Apache-2.0
 PYTHON_CYTHON_LICENSE_FILES = COPYING.txt LICENSE.txt
diff --git a/package/python3-cython/python3-cython.mk b/package/python3-cython/python3-cython.mk
index 6e3bd1422a..2c65f1f1a4 100644
--- a/package/python3-cython/python3-cython.mk
+++ b/package/python3-cython/python3-cython.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 # Please keep in sync with package/python-cython/python-cython.mk
-PYTHON3_CYTHON_VERSION = 0.29.21
+PYTHON3_CYTHON_VERSION = 0.29.23
 PYTHON3_CYTHON_SOURCE = Cython-$(PYTHON3_CYTHON_VERSION).tar.gz
-PYTHON3_CYTHON_SITE = https://files.pythonhosted.org/packages/6c/9f/f501ba9d178aeb1f5bf7da1ad5619b207c90ac235d9859961c11829d0160
+PYTHON3_CYTHON_SITE = https://files.pythonhosted.org/packages/d9/cd/0d2d90b27219c07f68f1c25bcc7b02dd27639d2180add9d4b73e70945869
 PYTHON3_CYTHON_SETUP_TYPE = setuptools
 PYTHON3_CYTHON_LICENSE = Apache-2.0
 PYTHON3_CYTHON_LICENSE_FILES = COPYING.txt LICENSE.txt
-- 
2.25.1
