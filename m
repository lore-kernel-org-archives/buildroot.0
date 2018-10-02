From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 2 Oct 2018 16:48:36 +0200
Subject: [Buildroot] [git commit] python-txaio: bump to version 18.8.1
Message-ID: <20181002145435.373CF8B663@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8089fb3a42073b2c95dd3d4d151e06f2608b9bdf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add license hash.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-txaio/python-txaio.hash | 9 +++++----
 package/python-txaio/python-txaio.mk   | 4 ++--
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/python-txaio/python-txaio.hash b/package/python-txaio/python-txaio.hash
index 6fb8e78ce2..8b43a3dc8f 100644
--- a/package/python-txaio/python-txaio.hash
+++ b/package/python-txaio/python-txaio.hash
@@ -1,4 +1,5 @@
-# md5 from https://pypi.python.org/pypi/txaio/json, sha256 locally computed
-md5	a20e3431c95896a49fa3ffa84f77cde1  txaio-2.8.2.tar.gz
-sha256	484cd6c4cdd3f6081b87188f3b2b9a36e02fba6816e8256917c4f6571b567571  txaio-2.8.2.tar.gz
-sha256  0387eefce570453daaa60633f28676003731eeca28b2d0a0071c628e3a0004ef  LICENSE
+# md5, sha256 from https://pypi.org/pypi/txaio/json
+md5	ecdd4d0f401c7f01f22830b4d2788593  txaio-18.8.1.tar.gz
+sha256	67e360ac73b12c52058219bb5f8b3ed4105d2636707a36a7cdafb56fe06db7fe  txaio-18.8.1.tar.gz
+# Locally computed sha256 checksums
+sha256	0387eefce570453daaa60633f28676003731eeca28b2d0a0071c628e3a0004ef  LICENSE
diff --git a/package/python-txaio/python-txaio.mk b/package/python-txaio/python-txaio.mk
index 5e4d710135..8f73f36748 100644
--- a/package/python-txaio/python-txaio.mk
+++ b/package/python-txaio/python-txaio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TXAIO_VERSION = 2.8.2
+PYTHON_TXAIO_VERSION = 18.8.1
 PYTHON_TXAIO_SOURCE = txaio-$(PYTHON_TXAIO_VERSION).tar.gz
-PYTHON_TXAIO_SITE = https://pypi.python.org/packages/d6/95/d0c67304515f352342bc8fd14e5a3e7ca924134608acb730916073b18464
+PYTHON_TXAIO_SITE = https://files.pythonhosted.org/packages/c1/99/81de004578e9afe017bb1d4c8968088a33621c05449fe330bdd7016d5377
 PYTHON_TXAIO_LICENSE = MIT
 PYTHON_TXAIO_LICENSE_FILES = LICENSE
 PYTHON_TXAIO_SETUP_TYPE = setuptools
