From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 1 Feb 2019 23:05:18 +0100
Subject: [Buildroot] [git commit] python-cython: bump to version 0.29.4
Message-ID: <20190201220420.5BE9682236@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=008859d485e9959588cb2bf5593f48ef1cf7e32c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-cython/python-cython.hash | 4 ++--
 package/python-cython/python-cython.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-cython/python-cython.hash b/package/python-cython/python-cython.hash
index 0eeeecd4cb..db0549c2d2 100644
--- a/package/python-cython/python-cython.hash
+++ b/package/python-cython/python-cython.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/cython/json
-md5	14ef74e227f0b55e67a20f5459a7942e  Cython-0.29.3.tar.gz
-sha256	d687fb1cd9df28c1515666174c62e54bd894a6a6d0862f89705063cd47739f83  Cython-0.29.3.tar.gz
+md5	867c8b48f15a5249f476dc5a2cb58758  Cython-0.29.4.tar.gz
+sha256	d1ee3d39c73a094ae5b6e2f9263ae0dc61af1b549a0869ade8c3c30325ed9f26  Cython-0.29.4.tar.gz
 # Locally computed sha256 checksums
 sha256 a6cba85bc92e0cff7a450b1d873c0eaa2e9fc96bf472df0247a26bec77bf3ff9  LICENSE.txt
 sha256 e1eb1c49a8508e8173dac30157e4a6439a44ad8846194746c424fbc3fc2b95d7  COPYING.txt
diff --git a/package/python-cython/python-cython.mk b/package/python-cython/python-cython.mk
index 024364a48d..fbe11e8087 100644
--- a/package/python-cython/python-cython.mk
+++ b/package/python-cython/python-cython.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CYTHON_VERSION = 0.29.3
+PYTHON_CYTHON_VERSION = 0.29.4
 PYTHON_CYTHON_SOURCE = Cython-$(PYTHON_CYTHON_VERSION).tar.gz
-PYTHON_CYTHON_SITE = https://files.pythonhosted.org/packages/02/24/f73045afb049295b34ac55aaf6ea1592604cda3749632a22e563e66604a3
+PYTHON_CYTHON_SITE = https://files.pythonhosted.org/packages/cf/e2/03af631ca4a2cf7bc392dd8785c7cc427bff3af4bf5864cdde734f80d052
 PYTHON_CYTHON_SETUP_TYPE = setuptools
 PYTHON_CYTHON_LICENSE = Apache-2.0
 PYTHON_CYTHON_LICENSE_FILES = COPYING.txt LICENSE.txt
