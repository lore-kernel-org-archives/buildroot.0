From: Asaf Kahlon <asafka7@gmail.com>
Date: Wed, 26 Sep 2018 18:34:58 +0300
Subject: [Buildroot] [PATCH 16/23] python-u-msgpack: bump to version 2.5.0
In-Reply-To: <20180926153505.3411-1-asafka7@gmail.com>
References: <20180926153505.3411-1-asafka7@gmail.com>
Message-ID: <20180926153505.3411-17-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add license hash.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-u-msgpack/python-u-msgpack.hash | 8 +++++---
 package/python-u-msgpack/python-u-msgpack.mk   | 4 ++--
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/python-u-msgpack/python-u-msgpack.hash b/package/python-u-msgpack/python-u-msgpack.hash
index 12f2be37af..e24c9f3f90 100644
--- a/package/python-u-msgpack/python-u-msgpack.hash
+++ b/package/python-u-msgpack/python-u-msgpack.hash
@@ -1,3 +1,5 @@
-# md5 from https://pypi.python.org/pypi/u-msgpack-python/json, sha256 locally computed
-md5	f5adfb3e19910d8a41e331d3b03aa7c6  u-msgpack-python-2.2.tar.gz
-sha256	cdd5a88f2313856a6a9f481f652dab9edd5731059badbb0111280f27249930d7  u-msgpack-python-2.2.tar.gz
+# md5, sha256 from https://pypi.org/pypi/u-msgpack-python/json
+md5	ba0ec9036933edbbf33a344a5c72dd14  u-msgpack-python-2.5.0.tar.gz
+sha256	7ff18ae3721fa75571f9329c08f7c0120416a6ae36194bd8674f65b3b78d0702  u-msgpack-python-2.5.0.tar.gz
+# Locally computed sha256
+sha256	0603a3e697a80b13640e3023bb534727f683ada5c4b0b0149d001ec5272d64f4  LICENSE
diff --git a/package/python-u-msgpack/python-u-msgpack.mk b/package/python-u-msgpack/python-u-msgpack.mk
index 89240c3fb2..bcb12b2037 100644
--- a/package/python-u-msgpack/python-u-msgpack.mk
+++ b/package/python-u-msgpack/python-u-msgpack.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_U_MSGPACK_VERSION = 2.2
+PYTHON_U_MSGPACK_VERSION = 2.5.0
 PYTHON_U_MSGPACK_SOURCE = u-msgpack-python-$(PYTHON_U_MSGPACK_VERSION).tar.gz
-PYTHON_U_MSGPACK_SITE = https://pypi.python.org/packages/66/5b/36fe0fcf290bd39f6ef6c1f5924cf0a9a76b0dc94575975ad7d318619cf9
+PYTHON_U_MSGPACK_SITE = https://files.pythonhosted.org/packages/f5/97/36d5ac7d71451e282051e48219cc825637f617a8f620a2edf90ab61b7f97
 PYTHON_U_MSGPACK_SETUP_TYPE = setuptools
 PYTHON_U_MSGPACK_LICENSE = MIT
 PYTHON_U_MSGPACK_LICENSE_FILES = LICENSE
-- 
2.17.1
