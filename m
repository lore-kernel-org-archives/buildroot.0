From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat,  1 Aug 2020 14:10:27 -0600
Subject: [Buildroot] [PATCH 1/1] package/python-pycryptodomex: bump to
 version 3.9.8
Message-ID: <20200801201027.116726-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pycryptodomex/python-pycryptodomex.hash | 8 ++++----
 package/python-pycryptodomex/python-pycryptodomex.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-pycryptodomex/python-pycryptodomex.hash b/package/python-pycryptodomex/python-pycryptodomex.hash
index 2f2ca3ca7f..df8d2a2f8d 100644
--- a/package/python-pycryptodomex/python-pycryptodomex.hash
+++ b/package/python-pycryptodomex/python-pycryptodomex.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/pycryptodomex/json
-md5	c55b52fc81cbf795fb7c302b0cc19b9f  pycryptodomex-3.9.6.tar.gz
-sha256	c021b66f5b3c4ea0c45422ec3241bfea4a16651e1ee5459a136639d0716ccb3c  pycryptodomex-3.9.6.tar.gz
+md5  4cede80c602d8814bbfb24a1cdc50dc8  pycryptodomex-3.9.8.tar.gz
+sha256  48cc2cfc251f04a6142badeb666d1ff49ca6fdfc303fd72579f62b768aaa52b9  pycryptodomex-3.9.8.tar.gz
 # Locally computed sha256 checksums
-sha256	d1af3fab2ef8cc53b6c7f48bdeb178ac874b04faf4ba0159a96b6109f1d393e2  LICENSE.rst
-sha256	8e563c767164faa0831a333b57d23d4311cf566eb1b15d93250f4606be4eb549  Doc/LEGAL/COPYRIGHT.pycrypto
+sha256  d1af3fab2ef8cc53b6c7f48bdeb178ac874b04faf4ba0159a96b6109f1d393e2  LICENSE.rst
+sha256  8e563c767164faa0831a333b57d23d4311cf566eb1b15d93250f4606be4eb549  Doc/LEGAL/COPYRIGHT.pycrypto
diff --git a/package/python-pycryptodomex/python-pycryptodomex.mk b/package/python-pycryptodomex/python-pycryptodomex.mk
index 1459bb8fc3..7f93d93131 100644
--- a/package/python-pycryptodomex/python-pycryptodomex.mk
+++ b/package/python-pycryptodomex/python-pycryptodomex.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYCRYPTODOMEX_VERSION = 3.9.6
+PYTHON_PYCRYPTODOMEX_VERSION = 3.9.8
 PYTHON_PYCRYPTODOMEX_SOURCE = pycryptodomex-$(PYTHON_PYCRYPTODOMEX_VERSION).tar.gz
-PYTHON_PYCRYPTODOMEX_SITE = https://files.pythonhosted.org/packages/d7/4f/20258a48e6760cff6523a176ecec671c85cad3f199754a8b89728d130aa8
+PYTHON_PYCRYPTODOMEX_SITE = https://files.pythonhosted.org/packages/f5/79/9d9206688385d1e7a5ff925e7aab1d685636256e34a409037aa7adbbe611
 PYTHON_PYCRYPTODOMEX_SETUP_TYPE = setuptools
 PYTHON_PYCRYPTODOMEX_LICENSE = \
 	BSD-2-Clause, \
-- 
2.25.1
