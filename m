From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Mon, 18 Feb 2019 13:29:53 -0800
Subject: [Buildroot] [PATCH 1/1] python-cython: bump to version 0.29.5
Message-ID: <20190218212953.21179-1-joseph.kogut@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Updated license file checksums after a minor change to URLs.

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
---

 package/python-cython/python-cython.hash | 8 ++++----
 package/python-cython/python-cython.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-cython/python-cython.hash b/package/python-cython/python-cython.hash
index db0549c2d2..54e4d1d257 100644
--- a/package/python-cython/python-cython.hash
+++ b/package/python-cython/python-cython.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/cython/json
-md5	867c8b48f15a5249f476dc5a2cb58758  Cython-0.29.4.tar.gz
-sha256	d1ee3d39c73a094ae5b6e2f9263ae0dc61af1b549a0869ade8c3c30325ed9f26  Cython-0.29.4.tar.gz
+md5	074f70ec8bd0a6bf5cf658508c63a999  Cython-0.29.5.tar.gz
+sha256	9d5290d749099a8e446422adfb0aa2142c711284800fb1eb70f595101e32cbf1  Cython-0.29.5.tar.gz
 # Locally computed sha256 checksums
-sha256 a6cba85bc92e0cff7a450b1d873c0eaa2e9fc96bf472df0247a26bec77bf3ff9  LICENSE.txt
-sha256 e1eb1c49a8508e8173dac30157e4a6439a44ad8846194746c424fbc3fc2b95d7  COPYING.txt
+sha256	e1eb1c49a8508e8173dac30157e4a6439a44ad8846194746c424fbc3fc2b95d7  COPYING.txt
+sha256	a6cba85bc92e0cff7a450b1d873c0eaa2e9fc96bf472df0247a26bec77bf3ff9  LICENSE.txt
diff --git a/package/python-cython/python-cython.mk b/package/python-cython/python-cython.mk
index fbe11e8087..9ab4ebb2a9 100644
--- a/package/python-cython/python-cython.mk
+++ b/package/python-cython/python-cython.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################

-PYTHON_CYTHON_VERSION = 0.29.4
+PYTHON_CYTHON_VERSION = 0.29.5
 PYTHON_CYTHON_SOURCE = Cython-$(PYTHON_CYTHON_VERSION).tar.gz
-PYTHON_CYTHON_SITE = https://files.pythonhosted.org/packages/cf/e2/03af631ca4a2cf7bc392dd8785c7cc427bff3af4bf5864cdde734f80d052
+PYTHON_CYTHON_SITE = https://files.pythonhosted.org/packages/e0/31/4a166556f92c469d8291d4b03a187f325c773c330fffc1e798bf83d947f2
 PYTHON_CYTHON_SETUP_TYPE = setuptools
 PYTHON_CYTHON_LICENSE = Apache-2.0
 PYTHON_CYTHON_LICENSE_FILES = COPYING.txt LICENSE.txt
--
2.20.1
