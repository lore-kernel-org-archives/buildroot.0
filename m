From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 17 Jun 2020 22:56:01 +0200
Subject: [Buildroot] [git commit] package/python-bitstring: bump to version
 3.1.7
Message-ID: <20200617205529.B51938447F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b691cc6a4cf51e97fa5cdba006cbdedef8771178
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

* License was changed from UNIX to Windows line endings.
* SETUP_TYPE is actually distutils, and not setuptools.
* Use two spaces for hash file indentation.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-bitstring/python-bitstring.hash | 6 +++---
 package/python-bitstring/python-bitstring.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-bitstring/python-bitstring.hash b/package/python-bitstring/python-bitstring.hash
index 07586d5300..04e4914696 100644
--- a/package/python-bitstring/python-bitstring.hash
+++ b/package/python-bitstring/python-bitstring.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/bitstring/json
-md5	38372014dd629be75c3a0ff7d799aa3f  bitstring-3.1.6.tar.gz
-sha256	c97a8e2a136e99b523b27da420736ae5cb68f83519d633794a6a11192f69f8bf  bitstring-3.1.6.tar.gz
+md5  18661a3e5c47c59bd926dd0fefae0baa  bitstring-3.1.7.tar.gz
+sha256  fdf3eb72b229d2864fb507f8f42b1b2c57af7ce5fec035972f9566de440a864a  bitstring-3.1.7.tar.gz
 # Locally computed sha256 checksums
-sha256	2e97cff64585d7cb66190ad298e9d77fd791e8b91bcc97967fa743edf8c2ba1b  LICENSE
+sha256  ea3c0e2288994d3dfeaac0fd2163f2cf5f9671c3ae70a9e9d563795e28cfb0b9  LICENSE
diff --git a/package/python-bitstring/python-bitstring.mk b/package/python-bitstring/python-bitstring.mk
index 636ae0e0c0..c36993416d 100644
--- a/package/python-bitstring/python-bitstring.mk
+++ b/package/python-bitstring/python-bitstring.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_BITSTRING_VERSION = 3.1.6
+PYTHON_BITSTRING_VERSION = 3.1.7
 PYTHON_BITSTRING_SOURCE = bitstring-$(PYTHON_BITSTRING_VERSION).tar.gz
-PYTHON_BITSTRING_SITE = https://files.pythonhosted.org/packages/f4/87/fe6f7093088f4396e84c1b5d5dfb08c4840487ad46ff4805b7008c8f5ffc
-PYTHON_BITSTRING_SETUP_TYPE = setuptools
+PYTHON_BITSTRING_SITE = https://files.pythonhosted.org/packages/c3/fc/ffac2c199d2efe1ec5111f55efeb78f5f2972456df6939fea849f103f9f5
+PYTHON_BITSTRING_SETUP_TYPE = distutils
 PYTHON_BITSTRING_LICENSE = MIT
 PYTHON_BITSTRING_LICENSE_FILES = LICENSE
 
