From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 1 Oct 2018 08:45:32 +0200
Subject: [Buildroot] [git commit] python-pycparser: bump to version 2.19
Message-ID: <20181001064632.D209C8A567@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0271b0856df7b5e63ae2dc0a3b6cb5fa693652fe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add license hash.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pycparser/python-pycparser.hash | 8 +++++---
 package/python-pycparser/python-pycparser.mk   | 4 ++--
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/python-pycparser/python-pycparser.hash b/package/python-pycparser/python-pycparser.hash
index 25747c3a91..6230f7cc83 100644
--- a/package/python-pycparser/python-pycparser.hash
+++ b/package/python-pycparser/python-pycparser.hash
@@ -1,3 +1,5 @@
-# md5 from https://pypi.python.org/pypi/pycparser/json, sha256 locally computed
-md5 ca98dcb50bc1276f230118f6af5a40c7 pycparser-2.17.tar.gz
-sha256 0aac31e917c24cb3357f5a4d5566f2cc91a19ca41862f6c3c22dc60a629673b6 pycparser-2.17.tar.gz
+# md5, sha256 from https://pypi.org/pypi/pycparser/json
+md5	76396762adc3fa769c83d8e202d36b6f  pycparser-2.19.tar.gz
+sha256	a988718abfad80b6b157acce7bf130a30876d27603738ac39f140993246b25b3  pycparser-2.19.tar.gz
+# Locally computed sha256 checksums
+sha256	3c76629880aec2f8578ed914701a4ff9e5da8b60acb8b7ec675abf83c90c5168  LICENSE
diff --git a/package/python-pycparser/python-pycparser.mk b/package/python-pycparser/python-pycparser.mk
index 08a22b45c6..c07edaaa25 100644
--- a/package/python-pycparser/python-pycparser.mk
+++ b/package/python-pycparser/python-pycparser.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYCPARSER_VERSION = 2.17
+PYTHON_PYCPARSER_VERSION = 2.19
 PYTHON_PYCPARSER_SOURCE = pycparser-$(PYTHON_PYCPARSER_VERSION).tar.gz
-PYTHON_PYCPARSER_SITE = https://pypi.python.org/packages/be/64/1bb257ffb17d01f4a38d7ce686809a736837ad4371bcc5c42ba7a715c3ac
+PYTHON_PYCPARSER_SITE = https://files.pythonhosted.org/packages/68/9e/49196946aee219aead1290e00d1e7fdeab8567783e83e1b9ab5585e6206a
 PYTHON_PYCPARSER_SETUP_TYPE = setuptools
 PYTHON_PYCPARSER_LICENSE = BSD-3-Clause
 PYTHON_PYCPARSER_LICENSE_FILES = LICENSE
