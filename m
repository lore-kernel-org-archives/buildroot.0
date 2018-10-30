From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 30 Oct 2018 20:55:40 +0100
Subject: [Buildroot] [git commit] python-pycryptodomex: bump to version 3.7.0
Message-ID: <20181030201012.CA3C383239@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5654eb3c9a7891bc5d7c2a275d1ac04dc4ffda7d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-pycryptodomex/python-pycryptodomex.hash | 4 ++--
 package/python-pycryptodomex/python-pycryptodomex.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pycryptodomex/python-pycryptodomex.hash b/package/python-pycryptodomex/python-pycryptodomex.hash
index 79fe74a871..3d98d19f6d 100644
--- a/package/python-pycryptodomex/python-pycryptodomex.hash
+++ b/package/python-pycryptodomex/python-pycryptodomex.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/pycryptodomex/json
-md5	7e1884f55077ed2e48d36565525b1657  pycryptodomex-3.6.6.tar.gz
-sha256	d0d448484e161786922b41e112b5d7cf76ef5f0c725ea5107ef866bb14a38b12  pycryptodomex-3.6.6.tar.gz
+md5	80019e535efb0575b38217dd3c6c41bb  pycryptodomex-3.7.0.tar.gz
+sha256	9f11823636128acbe4e17c35ff668f4d0a9f3133450753a0675525b6413aa1b0  pycryptodomex-3.7.0.tar.gz
 # Locally computed sha256 checksums
 sha256	fc884f6492490d0f227613ee900ff2a27e6879b79ee637c53a4697238bf12970  LICENSE.rst
 sha256	8e563c767164faa0831a333b57d23d4311cf566eb1b15d93250f4606be4eb549  Doc/LEGAL/COPYRIGHT.pycrypto
diff --git a/package/python-pycryptodomex/python-pycryptodomex.mk b/package/python-pycryptodomex/python-pycryptodomex.mk
index 89b6a10fc9..1dcdb8418d 100644
--- a/package/python-pycryptodomex/python-pycryptodomex.mk
+++ b/package/python-pycryptodomex/python-pycryptodomex.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYCRYPTODOMEX_VERSION = 3.6.6
+PYTHON_PYCRYPTODOMEX_VERSION = 3.7.0
 PYTHON_PYCRYPTODOMEX_SOURCE = pycryptodomex-$(PYTHON_PYCRYPTODOMEX_VERSION).tar.gz
-PYTHON_PYCRYPTODOMEX_SITE = https://files.pythonhosted.org/packages/95/10/f3bd758050da1c08ea30c8b4daf9ff895f306b780f07430fcc9b38722e1b
+PYTHON_PYCRYPTODOMEX_SITE = https://files.pythonhosted.org/packages/69/e7/5c50af65e3d46a161181089aed939bce185ad61f6cc86779994e9d8280d0
 PYTHON_PYCRYPTODOMEX_SETUP_TYPE = setuptools
 PYTHON_PYCRYPTODOMEX_LICENSE = \
 	BSD-2-Clause, \
