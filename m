From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 27 Apr 2020 21:43:34 +0200
Subject: [Buildroot] [git commit] package/python-cython: bump to version
 0.29.17
Message-ID: <20200427193934.CDCBE8E4DD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3c148ec54b9c3b66a0a91bd655684d804f030a47
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-cython/python-cython.hash | 4 ++--
 package/python-cython/python-cython.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-cython/python-cython.hash b/package/python-cython/python-cython.hash
index 703676efc3..73c6904f60 100644
--- a/package/python-cython/python-cython.hash
+++ b/package/python-cython/python-cython.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/cython/json
-md5  a899abaa48b68bb679aef45ceb4b89d3  Cython-0.29.16.tar.gz
-sha256  232755284f942cbb3b43a06cd85974ef3c970a021aef19b5243c03ee2b08fa05  Cython-0.29.16.tar.gz
+md5  0936311ccd09f1164ab2f46ca5cd8c3b  Cython-0.29.17.tar.gz
+sha256  6361588cb1d82875bcfbad83d7dd66c442099759f895cf547995f00601f9caf2  Cython-0.29.17.tar.gz
 # Locally computed sha256 checksums
 sha256  a6cba85bc92e0cff7a450b1d873c0eaa2e9fc96bf472df0247a26bec77bf3ff9  LICENSE.txt
 sha256  e1eb1c49a8508e8173dac30157e4a6439a44ad8846194746c424fbc3fc2b95d7  COPYING.txt
diff --git a/package/python-cython/python-cython.mk b/package/python-cython/python-cython.mk
index d011e61017..cf19e35b8b 100644
--- a/package/python-cython/python-cython.mk
+++ b/package/python-cython/python-cython.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CYTHON_VERSION = 0.29.16
+PYTHON_CYTHON_VERSION = 0.29.17
 PYTHON_CYTHON_SOURCE = Cython-$(PYTHON_CYTHON_VERSION).tar.gz
-PYTHON_CYTHON_SITE = https://files.pythonhosted.org/packages/49/8a/6a4135469372da2e3d9f88f71c6d00d8a07ef65f121eeca0c7ae21697219
+PYTHON_CYTHON_SITE = https://files.pythonhosted.org/packages/99/36/a3dc962cc6d08749aa4b9d85af08b6e354d09c5468a3e0edc610f44c856b
 PYTHON_CYTHON_SETUP_TYPE = setuptools
 PYTHON_CYTHON_LICENSE = Apache-2.0
 PYTHON_CYTHON_LICENSE_FILES = COPYING.txt LICENSE.txt
