From: Asaf Kahlon <asafka7@gmail.com>
Date: Fri, 18 Oct 2019 21:26:24 +0300
Subject: [Buildroot] [PATCH 1/1] package/python-u-msgpack: bump to version
 2.5.2
In-Reply-To: <20191018182628.15545-1-asafka7@gmail.com>
References: <20191018182628.15545-1-asafka7@gmail.com>
Message-ID: <20191018182628.15545-27-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-u-msgpack/python-u-msgpack.hash | 4 ++--
 package/python-u-msgpack/python-u-msgpack.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-u-msgpack/python-u-msgpack.hash b/package/python-u-msgpack/python-u-msgpack.hash
index e24c9f3f90..70c67c7283 100644
--- a/package/python-u-msgpack/python-u-msgpack.hash
+++ b/package/python-u-msgpack/python-u-msgpack.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/u-msgpack-python/json
-md5	ba0ec9036933edbbf33a344a5c72dd14  u-msgpack-python-2.5.0.tar.gz
-sha256	7ff18ae3721fa75571f9329c08f7c0120416a6ae36194bd8674f65b3b78d0702  u-msgpack-python-2.5.0.tar.gz
+md5	bbeedd924f3d8c8ee90611914b3594e6  u-msgpack-python-2.5.2.tar.gz
+sha256	09c85a8af77376034396681e76bf30c249a4fd8e5ebb239f8a468d3655f210d0  u-msgpack-python-2.5.2.tar.gz
 # Locally computed sha256
 sha256	0603a3e697a80b13640e3023bb534727f683ada5c4b0b0149d001ec5272d64f4  LICENSE
diff --git a/package/python-u-msgpack/python-u-msgpack.mk b/package/python-u-msgpack/python-u-msgpack.mk
index bcb12b2037..6d98e55221 100644
--- a/package/python-u-msgpack/python-u-msgpack.mk
+++ b/package/python-u-msgpack/python-u-msgpack.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_U_MSGPACK_VERSION = 2.5.0
+PYTHON_U_MSGPACK_VERSION = 2.5.2
 PYTHON_U_MSGPACK_SOURCE = u-msgpack-python-$(PYTHON_U_MSGPACK_VERSION).tar.gz
-PYTHON_U_MSGPACK_SITE = https://files.pythonhosted.org/packages/f5/97/36d5ac7d71451e282051e48219cc825637f617a8f620a2edf90ab61b7f97
+PYTHON_U_MSGPACK_SITE = https://files.pythonhosted.org/packages/75/c4/d9404382d0f7d9be27b5d13498d033a4faa83f325b3893e1c29a0faa83b9
 PYTHON_U_MSGPACK_SETUP_TYPE = setuptools
 PYTHON_U_MSGPACK_LICENSE = MIT
 PYTHON_U_MSGPACK_LICENSE_FILES = LICENSE
-- 
2.20.1
