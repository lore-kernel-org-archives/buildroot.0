From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 16 Feb 2020 15:25:43 +0100
Subject: [Buildroot] [git commit] package/python-cython: bump to version
 0.29.15
Message-ID: <20200216141641.604D38E187@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a00757f78e8aafc019eabfb6ba794d5fc6a07df2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-cython/python-cython.hash | 4 ++--
 package/python-cython/python-cython.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-cython/python-cython.hash b/package/python-cython/python-cython.hash
index 31e1b0d992..06ebbd5a9d 100644
--- a/package/python-cython/python-cython.hash
+++ b/package/python-cython/python-cython.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/cython/json
-md5	6e2f139e30bb08d68366f9370d87964c  Cython-0.29.14.tar.gz
-sha256	e4d6bb8703d0319eb04b7319b12ea41580df44fd84d83ccda13ea463c6801414  Cython-0.29.14.tar.gz
+md5	63c819697ed7ce89c6455ff578312a26  Cython-0.29.15.tar.gz
+sha256	60d859e1efa5cc80436d58aecd3718ff2e74b987db0518376046adedba97ac30  Cython-0.29.15.tar.gz
 # Locally computed sha256 checksums
 sha256 a6cba85bc92e0cff7a450b1d873c0eaa2e9fc96bf472df0247a26bec77bf3ff9  LICENSE.txt
 sha256 e1eb1c49a8508e8173dac30157e4a6439a44ad8846194746c424fbc3fc2b95d7  COPYING.txt
diff --git a/package/python-cython/python-cython.mk b/package/python-cython/python-cython.mk
index 6c23e14218..997a38db1c 100644
--- a/package/python-cython/python-cython.mk
+++ b/package/python-cython/python-cython.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CYTHON_VERSION = 0.29.14
+PYTHON_CYTHON_VERSION = 0.29.15
 PYTHON_CYTHON_SOURCE = Cython-$(PYTHON_CYTHON_VERSION).tar.gz
-PYTHON_CYTHON_SITE = https://files.pythonhosted.org/packages/9c/9b/706dac7338c2860cd063a28cdbf5e9670995eaea408abbf2e88ba070d90d
+PYTHON_CYTHON_SITE = https://files.pythonhosted.org/packages/d9/82/d01e767abb9c4a5c07a6a1e6f4d5a8dfce7369318d31f48a52374094372e
 PYTHON_CYTHON_SETUP_TYPE = setuptools
 PYTHON_CYTHON_LICENSE = Apache-2.0
 PYTHON_CYTHON_LICENSE_FILES = COPYING.txt LICENSE.txt
