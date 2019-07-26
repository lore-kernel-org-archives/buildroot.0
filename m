From: Asaf Kahlon <asafka7@gmail.com>
Date: Fri, 26 Jul 2019 22:10:14 +0300
Subject: [Buildroot] [PATCH 1/1] package/python-cython: bump to version
 0.29.13
Message-ID: <20190726191014.1076-1-asafka7@gmail.com>
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
index 49f978bedf..1c9d140693 100644
--- a/package/python-cython/python-cython.hash
+++ b/package/python-cython/python-cython.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/cython/json
-md5	785fa46921b4cbb4028b27b825a268d4  Cython-0.29.11.tar.gz
-sha256	763a522cc5d1673ba7a4092c0914790f11704b1d4c41e2671e50d0f702a8c6a0  Cython-0.29.11.tar.gz
+md5	f8109a2a86cded40b3896ee7a63bc5a5  Cython-0.29.13.tar.gz
+sha256	c29d069a4a30f472482343c866f7486731ad638ef9af92bfe5fca9c7323d638e  Cython-0.29.13.tar.gz
 # Locally computed sha256 checksums
 sha256 a6cba85bc92e0cff7a450b1d873c0eaa2e9fc96bf472df0247a26bec77bf3ff9  LICENSE.txt
 sha256 e1eb1c49a8508e8173dac30157e4a6439a44ad8846194746c424fbc3fc2b95d7  COPYING.txt
diff --git a/package/python-cython/python-cython.mk b/package/python-cython/python-cython.mk
index 47dedd40d6..c7f777c7d8 100644
--- a/package/python-cython/python-cython.mk
+++ b/package/python-cython/python-cython.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CYTHON_VERSION = 0.29.11
+PYTHON_CYTHON_VERSION = 0.29.13
 PYTHON_CYTHON_SOURCE = Cython-$(PYTHON_CYTHON_VERSION).tar.gz
-PYTHON_CYTHON_SITE = https://files.pythonhosted.org/packages/87/26/6f8a63fda4743d9e405c17c2872ac3242b63b5eba79c475ddf1777f17b9e
+PYTHON_CYTHON_SITE = https://files.pythonhosted.org/packages/a5/1f/c7c5450c60a90ce058b47ecf60bb5be2bfe46f952ed1d3b95d1d677588be
 PYTHON_CYTHON_SETUP_TYPE = setuptools
 PYTHON_CYTHON_LICENSE = Apache-2.0
 PYTHON_CYTHON_LICENSE_FILES = COPYING.txt LICENSE.txt
-- 
2.20.1
