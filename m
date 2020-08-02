From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 2 Aug 2020 22:27:12 +0200
Subject: [Buildroot] [git commit] package/python-txaio: bump to verison
 20.4.1
Message-ID: <20200802202326.3B25583962@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=34335cd72fc990a1ec9ad12bd26b9b28918d2f70
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-txaio/python-txaio.hash | 4 ++--
 package/python-txaio/python-txaio.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-txaio/python-txaio.hash b/package/python-txaio/python-txaio.hash
index 2c4e37f7b9..15b1f5f2c9 100644
--- a/package/python-txaio/python-txaio.hash
+++ b/package/python-txaio/python-txaio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/txaio/json
-md5  0f584b6c20860363152c1a866cc2d449  txaio-20.3.1.tar.gz
-sha256  e7a4a4db3d818975ed16ae1b90f53c6621e0075618709e88291ad5a41924e38f  txaio-20.3.1.tar.gz
+md5  c998be8d5837218c809266c0fce94687  txaio-20.4.1.tar.gz
+sha256  17938f2bca4a9cabce61346758e482ca4e600160cbc28e861493eac74a19539d  txaio-20.4.1.tar.gz
 # Locally computed sha256 checksums
 sha256  0387eefce570453daaa60633f28676003731eeca28b2d0a0071c628e3a0004ef  LICENSE
diff --git a/package/python-txaio/python-txaio.mk b/package/python-txaio/python-txaio.mk
index 068c8ca566..2dd028f4f7 100644
--- a/package/python-txaio/python-txaio.mk
+++ b/package/python-txaio/python-txaio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TXAIO_VERSION = 20.3.1
+PYTHON_TXAIO_VERSION = 20.4.1
 PYTHON_TXAIO_SOURCE = txaio-$(PYTHON_TXAIO_VERSION).tar.gz
-PYTHON_TXAIO_SITE = https://files.pythonhosted.org/packages/ca/a0/f19a421547b60fbd7ccb48b56c51deac56bffec9b256f9bd7c622572d0a8
+PYTHON_TXAIO_SITE = https://files.pythonhosted.org/packages/e7/dd/c0c90b080c3fad0ac8e2382eddbe86591d4fa1a5c1aea652de0adf245fc0
 PYTHON_TXAIO_LICENSE = MIT
 PYTHON_TXAIO_LICENSE_FILES = LICENSE
 PYTHON_TXAIO_SETUP_TYPE = setuptools
