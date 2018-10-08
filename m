From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 8 Oct 2018 10:21:11 +0200
Subject: [Buildroot] [git commit] python-ubjson: bump to version 0.12.0
Message-ID: <20181008082008.645C48E0E8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8201e790a48885b88f1d3fa8bb34a403d95f75d8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add license hash.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-ubjson/python-ubjson.hash | 8 +++++---
 package/python-ubjson/python-ubjson.mk   | 4 ++--
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/python-ubjson/python-ubjson.hash b/package/python-ubjson/python-ubjson.hash
index 30f65fe6bb..f93ae1acde 100644
--- a/package/python-ubjson/python-ubjson.hash
+++ b/package/python-ubjson/python-ubjson.hash
@@ -1,3 +1,5 @@
-# md5 from https://pypi.python.org/pypi/py-ubjson/json, sha256 locally computed
-md5 c78bbe899eeba9604302ad746094e8d1  py-ubjson-0.9.0.tar.gz
-sha256 b405daaa82acdf5989207e1e5ff6865ef7d23bf450513a6d90a1ab64c75bdcf8  py-ubjson-0.9.0.tar.gz
+# md5, sha256 from https://pypi.org/pypi/py-ubjson/json
+md5	5dbbecd3dbecd744e45f27f14e2da5e1  py-ubjson-0.12.0.tar.gz
+sha256	b796cb5077a06c932f0d148f4eef4ce0f045a05cb14393177a6d034be9f8e364  py-ubjson-0.12.0.tar.gz
+# Locally computed sha256 checksums
+sha256	ca182abcb84ad9984c9af2e30cb70c4fe0e1772674355207e8fcdb85e8c5e75f  LICENSE
diff --git a/package/python-ubjson/python-ubjson.mk b/package/python-ubjson/python-ubjson.mk
index a192cfb656..477cc400c8 100644
--- a/package/python-ubjson/python-ubjson.mk
+++ b/package/python-ubjson/python-ubjson.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_UBJSON_VERSION = 0.9.0
+PYTHON_UBJSON_VERSION = 0.12.0
 PYTHON_UBJSON_SOURCE = py-ubjson-$(PYTHON_UBJSON_VERSION).tar.gz
-PYTHON_UBJSON_SITE = https://pypi.python.org/packages/d4/40/a80006884ec03a54a5c6c53ae76df9978536862f0683b6e6280e3808d289
+PYTHON_UBJSON_SITE = https://files.pythonhosted.org/packages/68/9c/a6c34e565351f0b04bcf6835e38bc4bd0647269dc48670e12eb99a3f5ef5
 PYTHON_UBJSON_LICENSE = Apache-2.0
 PYTHON_UBJSON_LICENSE_FILES = LICENSE
 PYTHON_UBJSON_SETUP_TYPE = setuptools
