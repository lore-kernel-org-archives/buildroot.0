From: Asaf Kahlon <asafka7@gmail.com>
Date: Wed, 29 May 2019 22:17:40 +0300
Subject: [Buildroot] [PATCH 1/1] package/python-cython: bump to version
 0.29.9
Message-ID: <20190529191740.30683-1-asafka7@gmail.com>
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
index 39ce8963b2..87aa565523 100644
--- a/package/python-cython/python-cython.hash
+++ b/package/python-cython/python-cython.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/cython/json
-md5	074f70ec8bd0a6bf5cf658508c63a999  Cython-0.29.5.tar.gz
-sha256	9d5290d749099a8e446422adfb0aa2142c711284800fb1eb70f595101e32cbf1  Cython-0.29.5.tar.gz
+md5	bc0cca4658947bf2fb3fc10e8d090182  Cython-0.29.9.tar.gz
+sha256	b88e033c06d29f3f3c760a3fb9837dce6e124d627bd562d1cdf93e9da16df215  Cython-0.29.9.tar.gz
 # Locally computed sha256 checksums
 sha256 a6cba85bc92e0cff7a450b1d873c0eaa2e9fc96bf472df0247a26bec77bf3ff9  LICENSE.txt
 sha256 e1eb1c49a8508e8173dac30157e4a6439a44ad8846194746c424fbc3fc2b95d7  COPYING.txt
diff --git a/package/python-cython/python-cython.mk b/package/python-cython/python-cython.mk
index 9ab4ebb2a9..bd9f322d53 100644
--- a/package/python-cython/python-cython.mk
+++ b/package/python-cython/python-cython.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CYTHON_VERSION = 0.29.5
+PYTHON_CYTHON_VERSION = 0.29.9
 PYTHON_CYTHON_SOURCE = Cython-$(PYTHON_CYTHON_VERSION).tar.gz
-PYTHON_CYTHON_SITE = https://files.pythonhosted.org/packages/e0/31/4a166556f92c469d8291d4b03a187f325c773c330fffc1e798bf83d947f2
+PYTHON_CYTHON_SITE = https://files.pythonhosted.org/packages/69/ab/b18f7f2e61c12e5e859c86b6d37f73971679d5f5c5c97d6cc7ff8916468a
 PYTHON_CYTHON_SETUP_TYPE = setuptools
 PYTHON_CYTHON_LICENSE = Apache-2.0
 PYTHON_CYTHON_LICENSE_FILES = COPYING.txt LICENSE.txt
-- 
2.20.1
