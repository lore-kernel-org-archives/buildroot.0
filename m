From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 26 Mar 2020 21:59:18 +0100
Subject: [Buildroot] [git commit] package/python-txaio: bump to version
 20.3.1
Message-ID: <20200326210721.07D2B88324@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3d3c120c798932d501cb2339a60a087ec716f965
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-txaio/python-txaio.hash | 6 +++---
 package/python-txaio/python-txaio.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-txaio/python-txaio.hash b/package/python-txaio/python-txaio.hash
index 778efed8a3..2c4e37f7b9 100644
--- a/package/python-txaio/python-txaio.hash
+++ b/package/python-txaio/python-txaio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/txaio/json
-md5	53ec110dd7c7d84606abc151f607f0ae  txaio-20.1.1.tar.gz
-sha256	f24e10396f026c75364ae23ffac8d72c156dc5f3733d332febb356c9d8d6b58d  txaio-20.1.1.tar.gz
+md5  0f584b6c20860363152c1a866cc2d449  txaio-20.3.1.tar.gz
+sha256  e7a4a4db3d818975ed16ae1b90f53c6621e0075618709e88291ad5a41924e38f  txaio-20.3.1.tar.gz
 # Locally computed sha256 checksums
-sha256	0387eefce570453daaa60633f28676003731eeca28b2d0a0071c628e3a0004ef  LICENSE
+sha256  0387eefce570453daaa60633f28676003731eeca28b2d0a0071c628e3a0004ef  LICENSE
diff --git a/package/python-txaio/python-txaio.mk b/package/python-txaio/python-txaio.mk
index 409213b3de..068c8ca566 100644
--- a/package/python-txaio/python-txaio.mk
+++ b/package/python-txaio/python-txaio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TXAIO_VERSION = 20.1.1
+PYTHON_TXAIO_VERSION = 20.3.1
 PYTHON_TXAIO_SOURCE = txaio-$(PYTHON_TXAIO_VERSION).tar.gz
-PYTHON_TXAIO_SITE = https://files.pythonhosted.org/packages/50/ea/dd4c34ade00ddfcd2f32b4f1e7136a50ae13894009d64024a9d03f8c594f
+PYTHON_TXAIO_SITE = https://files.pythonhosted.org/packages/ca/a0/f19a421547b60fbd7ccb48b56c51deac56bffec9b256f9bd7c622572d0a8
 PYTHON_TXAIO_LICENSE = MIT
 PYTHON_TXAIO_LICENSE_FILES = LICENSE
 PYTHON_TXAIO_SETUP_TYPE = setuptools
