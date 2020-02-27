From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 27 Feb 2020 09:19:23 +0100
Subject: [Buildroot] [git commit branch/next] package/python-txaio: bump to
 version 20.1.1
Message-ID: <20200227100041.0B0E58ED13@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=46bb7a3f2606fcf6ea93c6e3d73677a6e01722b4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-txaio/python-txaio.hash | 4 ++--
 package/python-txaio/python-txaio.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-txaio/python-txaio.hash b/package/python-txaio/python-txaio.hash
index 8b43a3dc8f..778efed8a3 100644
--- a/package/python-txaio/python-txaio.hash
+++ b/package/python-txaio/python-txaio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/txaio/json
-md5	ecdd4d0f401c7f01f22830b4d2788593  txaio-18.8.1.tar.gz
-sha256	67e360ac73b12c52058219bb5f8b3ed4105d2636707a36a7cdafb56fe06db7fe  txaio-18.8.1.tar.gz
+md5	53ec110dd7c7d84606abc151f607f0ae  txaio-20.1.1.tar.gz
+sha256	f24e10396f026c75364ae23ffac8d72c156dc5f3733d332febb356c9d8d6b58d  txaio-20.1.1.tar.gz
 # Locally computed sha256 checksums
 sha256	0387eefce570453daaa60633f28676003731eeca28b2d0a0071c628e3a0004ef  LICENSE
diff --git a/package/python-txaio/python-txaio.mk b/package/python-txaio/python-txaio.mk
index 8f73f36748..409213b3de 100644
--- a/package/python-txaio/python-txaio.mk
+++ b/package/python-txaio/python-txaio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TXAIO_VERSION = 18.8.1
+PYTHON_TXAIO_VERSION = 20.1.1
 PYTHON_TXAIO_SOURCE = txaio-$(PYTHON_TXAIO_VERSION).tar.gz
-PYTHON_TXAIO_SITE = https://files.pythonhosted.org/packages/c1/99/81de004578e9afe017bb1d4c8968088a33621c05449fe330bdd7016d5377
+PYTHON_TXAIO_SITE = https://files.pythonhosted.org/packages/50/ea/dd4c34ade00ddfcd2f32b4f1e7136a50ae13894009d64024a9d03f8c594f
 PYTHON_TXAIO_LICENSE = MIT
 PYTHON_TXAIO_LICENSE_FILES = LICENSE
 PYTHON_TXAIO_SETUP_TYPE = setuptools
