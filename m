From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 2 Oct 2018 16:40:22 +0200
Subject: [Buildroot] [git commit] python-pyopenssl: bump to version 18.0.0
Message-ID: <20181002143946.978A9885B3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9ace49d9c06f489d53afd4ea668711562af596a9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add license hash

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pyopenssl/python-pyopenssl.hash | 8 +++++---
 package/python-pyopenssl/python-pyopenssl.mk   | 4 ++--
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/python-pyopenssl/python-pyopenssl.hash b/package/python-pyopenssl/python-pyopenssl.hash
index 74fa4e56bf..ebd16cf28b 100644
--- a/package/python-pyopenssl/python-pyopenssl.hash
+++ b/package/python-pyopenssl/python-pyopenssl.hash
@@ -1,3 +1,5 @@
-# md5 from https://pypi.python.org/pypi/pyopenssl/json, sha256 locally computed
-md5 0704ca95106960375cfe78259453094a  pyOpenSSL-17.0.0.tar.gz
-sha256 48abfe9d2bb8eb8d8947c8452b0223b7b1be2383b332f3b4f248fe59ef0bafdd  pyOpenSSL-17.0.0.tar.gz
+# md5, sha256 from https://pypi.org/pypi/pyopenssl/json
+md5 c92e9c85b520b7e153fef0f7f3c5dda7  pyOpenSSL-18.0.0.tar.gz
+sha256 6488f1423b00f73b7ad5167885312bb0ce410d3312eb212393795b53c8caa580  pyOpenSSL-18.0.0.tar.gz
+# Locally computed sha256
+sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-pyopenssl/python-pyopenssl.mk b/package/python-pyopenssl/python-pyopenssl.mk
index 3fbaf8d16e..afdd06500f 100644
--- a/package/python-pyopenssl/python-pyopenssl.mk
+++ b/package/python-pyopenssl/python-pyopenssl.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYOPENSSL_VERSION = 17.0.0
+PYTHON_PYOPENSSL_VERSION = 18.0.0
 PYTHON_PYOPENSSL_SOURCE = pyOpenSSL-$(PYTHON_PYOPENSSL_VERSION).tar.gz
-PYTHON_PYOPENSSL_SITE = https://pypi.python.org/packages/9f/32/80fe4fddeb731b7766cd09fe0b2032a91b43dae655e216792af2a6ae3190
+PYTHON_PYOPENSSL_SITE = https://files.pythonhosted.org/packages/9b/7c/ee600b2a9304d260d96044ab5c5e57aa489755b92bbeb4c0803f9504f480
 PYTHON_PYOPENSSL_LICENSE = Apache-2.0
 PYTHON_PYOPENSSL_LICENSE_FILES = LICENSE
 PYTHON_PYOPENSSL_SETUP_TYPE = setuptools
