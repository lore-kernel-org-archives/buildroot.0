From: Asaf Kahlon <asafka7@gmail.com>
Date: Fri,  5 Jul 2019 15:10:03 +0300
Subject: [Buildroot] [PATCH 1/1] package/python-cython: bump to version
 0.29.11
Message-ID: <20190705121003.5368-1-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-cython/python-cython.hash | 4 ++--
 package/python-cython/python-cython.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-cython/python-cython.hash b/package/python-cython/python-cython.hash
index 87aa565523..49f978bedf 100644
--- a/package/python-cython/python-cython.hash
+++ b/package/python-cython/python-cython.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/cython/json
-md5	bc0cca4658947bf2fb3fc10e8d090182  Cython-0.29.9.tar.gz
-sha256	b88e033c06d29f3f3c760a3fb9837dce6e124d627bd562d1cdf93e9da16df215  Cython-0.29.9.tar.gz
+md5	785fa46921b4cbb4028b27b825a268d4  Cython-0.29.11.tar.gz
+sha256	763a522cc5d1673ba7a4092c0914790f11704b1d4c41e2671e50d0f702a8c6a0  Cython-0.29.11.tar.gz
 # Locally computed sha256 checksums
 sha256 a6cba85bc92e0cff7a450b1d873c0eaa2e9fc96bf472df0247a26bec77bf3ff9  LICENSE.txt
 sha256 e1eb1c49a8508e8173dac30157e4a6439a44ad8846194746c424fbc3fc2b95d7  COPYING.txt
diff --git a/package/python-cython/python-cython.mk b/package/python-cython/python-cython.mk
index bd9f322d53..47dedd40d6 100644
--- a/package/python-cython/python-cython.mk
+++ b/package/python-cython/python-cython.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CYTHON_VERSION = 0.29.9
+PYTHON_CYTHON_VERSION = 0.29.11
 PYTHON_CYTHON_SOURCE = Cython-$(PYTHON_CYTHON_VERSION).tar.gz
-PYTHON_CYTHON_SITE = https://files.pythonhosted.org/packages/69/ab/b18f7f2e61c12e5e859c86b6d37f73971679d5f5c5c97d6cc7ff8916468a
+PYTHON_CYTHON_SITE = https://files.pythonhosted.org/packages/87/26/6f8a63fda4743d9e405c17c2872ac3242b63b5eba79c475ddf1777f17b9e
 PYTHON_CYTHON_SETUP_TYPE = setuptools
 PYTHON_CYTHON_LICENSE = Apache-2.0
 PYTHON_CYTHON_LICENSE_FILES = COPYING.txt LICENSE.txt
-- 
2.20.1
