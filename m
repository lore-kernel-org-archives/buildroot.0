From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 28 Nov 2018 22:06:53 +0100
Subject: [Buildroot] [git commit] package/python-pycryptodomex: bump to
 version 3.7.1
Message-ID: <20181202071600.30D99803E1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ad96645ed56e14a3626cbdbd794ed064a132c94d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License file update: correct spelling, and state the exact
patent numbers.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pycryptodomex/python-pycryptodomex.hash | 6 +++---
 package/python-pycryptodomex/python-pycryptodomex.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-pycryptodomex/python-pycryptodomex.hash b/package/python-pycryptodomex/python-pycryptodomex.hash
index 3d98d19f6d..2caf97a293 100644
--- a/package/python-pycryptodomex/python-pycryptodomex.hash
+++ b/package/python-pycryptodomex/python-pycryptodomex.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/pycryptodomex/json
-md5	80019e535efb0575b38217dd3c6c41bb  pycryptodomex-3.7.0.tar.gz
-sha256	9f11823636128acbe4e17c35ff668f4d0a9f3133450753a0675525b6413aa1b0  pycryptodomex-3.7.0.tar.gz
+md5	ae7083008139cf9372322dcd99e92db0  pycryptodomex-3.7.1.tar.gz
+sha256	4ba053bea752ddc89b94d1f9f87008ef296a644b8dec0201c021d9636c069322  pycryptodomex-3.7.1.tar.gz
 # Locally computed sha256 checksums
-sha256	fc884f6492490d0f227613ee900ff2a27e6879b79ee637c53a4697238bf12970  LICENSE.rst
+sha256	d1af3fab2ef8cc53b6c7f48bdeb178ac874b04faf4ba0159a96b6109f1d393e2  LICENSE.rst
 sha256	8e563c767164faa0831a333b57d23d4311cf566eb1b15d93250f4606be4eb549  Doc/LEGAL/COPYRIGHT.pycrypto
diff --git a/package/python-pycryptodomex/python-pycryptodomex.mk b/package/python-pycryptodomex/python-pycryptodomex.mk
index 1dcdb8418d..3d3b97ca48 100644
--- a/package/python-pycryptodomex/python-pycryptodomex.mk
+++ b/package/python-pycryptodomex/python-pycryptodomex.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYCRYPTODOMEX_VERSION = 3.7.0
+PYTHON_PYCRYPTODOMEX_VERSION = 3.7.1
 PYTHON_PYCRYPTODOMEX_SOURCE = pycryptodomex-$(PYTHON_PYCRYPTODOMEX_VERSION).tar.gz
-PYTHON_PYCRYPTODOMEX_SITE = https://files.pythonhosted.org/packages/69/e7/5c50af65e3d46a161181089aed939bce185ad61f6cc86779994e9d8280d0
+PYTHON_PYCRYPTODOMEX_SITE = https://files.pythonhosted.org/packages/f6/be/9f65b7db183628bdb36401105a3fc9f1688909f5184c115902a7bdd333bd
 PYTHON_PYCRYPTODOMEX_SETUP_TYPE = setuptools
 PYTHON_PYCRYPTODOMEX_LICENSE = \
 	BSD-2-Clause, \
