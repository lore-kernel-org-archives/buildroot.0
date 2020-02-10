From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun,  9 Feb 2020 20:45:11 -0700
Subject: [Buildroot] [PATCH 1/1] package/python-pycryptodomex: bump to
 version 3.9.6
Message-ID: <20200210034511.66915-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pycryptodomex/python-pycryptodomex.hash | 4 ++--
 package/python-pycryptodomex/python-pycryptodomex.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pycryptodomex/python-pycryptodomex.hash b/package/python-pycryptodomex/python-pycryptodomex.hash
index 2caf97a293..2f2ca3ca7f 100644
--- a/package/python-pycryptodomex/python-pycryptodomex.hash
+++ b/package/python-pycryptodomex/python-pycryptodomex.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/pycryptodomex/json
-md5	ae7083008139cf9372322dcd99e92db0  pycryptodomex-3.7.1.tar.gz
-sha256	4ba053bea752ddc89b94d1f9f87008ef296a644b8dec0201c021d9636c069322  pycryptodomex-3.7.1.tar.gz
+md5	c55b52fc81cbf795fb7c302b0cc19b9f  pycryptodomex-3.9.6.tar.gz
+sha256	c021b66f5b3c4ea0c45422ec3241bfea4a16651e1ee5459a136639d0716ccb3c  pycryptodomex-3.9.6.tar.gz
 # Locally computed sha256 checksums
 sha256	d1af3fab2ef8cc53b6c7f48bdeb178ac874b04faf4ba0159a96b6109f1d393e2  LICENSE.rst
 sha256	8e563c767164faa0831a333b57d23d4311cf566eb1b15d93250f4606be4eb549  Doc/LEGAL/COPYRIGHT.pycrypto
diff --git a/package/python-pycryptodomex/python-pycryptodomex.mk b/package/python-pycryptodomex/python-pycryptodomex.mk
index 3d3b97ca48..7bc871678a 100644
--- a/package/python-pycryptodomex/python-pycryptodomex.mk
+++ b/package/python-pycryptodomex/python-pycryptodomex.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYCRYPTODOMEX_VERSION = 3.7.1
+PYTHON_PYCRYPTODOMEX_VERSION = 3.9.6
 PYTHON_PYCRYPTODOMEX_SOURCE = pycryptodomex-$(PYTHON_PYCRYPTODOMEX_VERSION).tar.gz
-PYTHON_PYCRYPTODOMEX_SITE = https://files.pythonhosted.org/packages/f6/be/9f65b7db183628bdb36401105a3fc9f1688909f5184c115902a7bdd333bd
+PYTHON_PYCRYPTODOMEX_SITE = https://files.pythonhosted.org/packages/d7/4f/20258a48e6760cff6523a176ecec671c85cad3f199754a8b89728d130aa8
 PYTHON_PYCRYPTODOMEX_SETUP_TYPE = setuptools
 PYTHON_PYCRYPTODOMEX_LICENSE = \
 	BSD-2-Clause, \
-- 
2.20.1
