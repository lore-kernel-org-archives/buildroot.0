From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 30 Sep 2018 10:36:14 +0200
Subject: [Buildroot] [git commit] python-cython: bump to version 0.28.5
Message-ID: <20180930084530.E858580FF1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=496e9aa80c6299089d7a9f48bb16902b777aa5a3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-cython/python-cython.hash | 8 ++++----
 package/python-cython/python-cython.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-cython/python-cython.hash b/package/python-cython/python-cython.hash
index 3b918dc704..666ef4b292 100644
--- a/package/python-cython/python-cython.hash
+++ b/package/python-cython/python-cython.hash
@@ -1,6 +1,6 @@
-# md5 from https://pypi.python.org/pypi/Cython/json, sha256 locally computed
-md5    6149238287d662bd5d5e572482252493  Cython-0.27.3.tar.gz
-sha256 6a00512de1f2e3ce66ba35c5420babaef1fe2d9c43a8faab4080b0dbcc26bc64  Cython-0.27.3.tar.gz
-# License files, locally calculated
+# md5, sha256 from https://pypi.org/pypi/cython/json
+md5	0cb620e1259818e4ecc1a056e8c3a8be  Cython-0.28.5.tar.gz
+sha256	b64575241f64f6ec005a4d4137339fb0ba5e156e826db2fdb5f458060d9979e0  Cython-0.28.5.tar.gz
+# Locally computed sha256 checksums
 sha256 a6cba85bc92e0cff7a450b1d873c0eaa2e9fc96bf472df0247a26bec77bf3ff9  LICENSE.txt
 sha256 e1eb1c49a8508e8173dac30157e4a6439a44ad8846194746c424fbc3fc2b95d7  COPYING.txt
diff --git a/package/python-cython/python-cython.mk b/package/python-cython/python-cython.mk
index 88eab83416..4bd300470f 100644
--- a/package/python-cython/python-cython.mk
+++ b/package/python-cython/python-cython.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CYTHON_VERSION = 0.27.3
+PYTHON_CYTHON_VERSION = 0.28.5
 PYTHON_CYTHON_SOURCE = Cython-$(PYTHON_CYTHON_VERSION).tar.gz
-PYTHON_CYTHON_SITE = https://pypi.python.org/packages/ee/2a/c4d2cdd19c84c32d978d18e9355d1ba9982a383de87d0fcb5928553d37f4
+PYTHON_CYTHON_SITE = https://files.pythonhosted.org/packages/21/89/ca320e5b45d381ae0df74c4b5694f1471c1b2453c5eb4bac3449f5970481
 PYTHON_CYTHON_SETUP_TYPE = setuptools
 PYTHON_CYTHON_LICENSE = Apache-2.0
 PYTHON_CYTHON_LICENSE_FILES = COPYING.txt LICENSE.txt
