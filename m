From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 11 Apr 2020 10:06:31 +0200
Subject: [Buildroot] [git commit] package/python-cython: bump to version
 0.29.16
Message-ID: <20200411075349.DD1AA8E474@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1d3534994d36ca7d04025f4cdde6084cbf744c1a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add use two spaces for license files indentation.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-cython/python-cython.hash | 8 ++++----
 package/python-cython/python-cython.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-cython/python-cython.hash b/package/python-cython/python-cython.hash
index 06ebbd5a9d..703676efc3 100644
--- a/package/python-cython/python-cython.hash
+++ b/package/python-cython/python-cython.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/cython/json
-md5	63c819697ed7ce89c6455ff578312a26  Cython-0.29.15.tar.gz
-sha256	60d859e1efa5cc80436d58aecd3718ff2e74b987db0518376046adedba97ac30  Cython-0.29.15.tar.gz
+md5  a899abaa48b68bb679aef45ceb4b89d3  Cython-0.29.16.tar.gz
+sha256  232755284f942cbb3b43a06cd85974ef3c970a021aef19b5243c03ee2b08fa05  Cython-0.29.16.tar.gz
 # Locally computed sha256 checksums
-sha256 a6cba85bc92e0cff7a450b1d873c0eaa2e9fc96bf472df0247a26bec77bf3ff9  LICENSE.txt
-sha256 e1eb1c49a8508e8173dac30157e4a6439a44ad8846194746c424fbc3fc2b95d7  COPYING.txt
+sha256  a6cba85bc92e0cff7a450b1d873c0eaa2e9fc96bf472df0247a26bec77bf3ff9  LICENSE.txt
+sha256  e1eb1c49a8508e8173dac30157e4a6439a44ad8846194746c424fbc3fc2b95d7  COPYING.txt
diff --git a/package/python-cython/python-cython.mk b/package/python-cython/python-cython.mk
index 997a38db1c..d011e61017 100644
--- a/package/python-cython/python-cython.mk
+++ b/package/python-cython/python-cython.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CYTHON_VERSION = 0.29.15
+PYTHON_CYTHON_VERSION = 0.29.16
 PYTHON_CYTHON_SOURCE = Cython-$(PYTHON_CYTHON_VERSION).tar.gz
-PYTHON_CYTHON_SITE = https://files.pythonhosted.org/packages/d9/82/d01e767abb9c4a5c07a6a1e6f4d5a8dfce7369318d31f48a52374094372e
+PYTHON_CYTHON_SITE = https://files.pythonhosted.org/packages/49/8a/6a4135469372da2e3d9f88f71c6d00d8a07ef65f121eeca0c7ae21697219
 PYTHON_CYTHON_SETUP_TYPE = setuptools
 PYTHON_CYTHON_LICENSE = Apache-2.0
 PYTHON_CYTHON_LICENSE_FILES = COPYING.txt LICENSE.txt
