From: Asaf Kahlon <asafka7@gmail.com>
Date: Fri, 18 Oct 2019 21:26:21 +0300
Subject: [Buildroot] [PATCH 1/1] package/python-treq: bump to version 18.6.0
In-Reply-To: <20191018182628.15545-1-asafka7@gmail.com>
References: <20191018182628.15545-1-asafka7@gmail.com>
Message-ID: <20191018182628.15545-24-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-treq/Config.in        | 1 +
 package/python-treq/python-treq.hash | 7 ++++---
 package/python-treq/python-treq.mk   | 4 ++--
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/python-treq/Config.in b/package/python-treq/Config.in
index 3a121ea71a..23056e72d2 100644
--- a/package/python-treq/Config.in
+++ b/package/python-treq/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_PYTHON_TREQ
 	depends on BR2_INSTALL_LIBSTDCPP # python-pyopenssl
 	select BR2_PACKAGE_PYTHON_ATTRS # runtime
 	select BR2_PACKAGE_PYTHON_IDNA # runtime
+	select BR2_PACKAGE_PYTHON_INCREMENTAL # runtime
 	select BR2_PACKAGE_PYTHON_PYOPENSSL # runtime
 	select BR2_PACKAGE_PYTHON_REQUESTS # runtime
 	select BR2_PACKAGE_PYTHON_SERVICE_IDENTITY # runtime
diff --git a/package/python-treq/python-treq.hash b/package/python-treq/python-treq.hash
index 14f39460fa..a2c0ea33f1 100644
--- a/package/python-treq/python-treq.hash
+++ b/package/python-treq/python-treq.hash
@@ -1,4 +1,5 @@
-# md5 from https://pypi.python.org/pypi/treq/json, sha256 locally computed
-md5	7e1f5079b85ec104d4759fc0fb89071e  treq-17.8.0.tar.gz
-sha256	ef72d2d5e0b24bdf29267b608fa33df0ac401743af8524438b073e1fb2b66f16  treq-17.8.0.tar.gz
+# md5, sha256 from https://pypi.org/pypi/treq/json
+md5	a8e33a4b3259b45e08e1e0a5960f76f7  treq-18.6.0.tar.gz
+sha256	91e09ff6b524cc90aa5e934b909c8d0d1a9d36ebd618b6c38e37b17013e69f48  treq-18.6.0.tar.gz
+# Locally computed sha256 checksums
 sha256  7cc1b65e1937b1cc07052bb864ec96d8e5fd413400c0842e5b89a8201a600293  LICENSE
diff --git a/package/python-treq/python-treq.mk b/package/python-treq/python-treq.mk
index 73c47152a8..a79e2bac73 100644
--- a/package/python-treq/python-treq.mk
+++ b/package/python-treq/python-treq.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TREQ_VERSION = 17.8.0
+PYTHON_TREQ_VERSION = 18.6.0
 PYTHON_TREQ_SOURCE = treq-$(PYTHON_TREQ_VERSION).tar.gz
-PYTHON_TREQ_SITE = https://pypi.python.org/packages/11/3e/1014f26bfd4d07db015ad48384446b3bdc4de4bbdd2eba3be7fbb149cc44
+PYTHON_TREQ_SITE = https://pypi.python.org/packages/cb/c5/c83628d7e1a5d62a71eab0a5d1cdcdc53b49ead873f52975457ff2a8ae21
 PYTHON_TREQ_LICENSE = MIT
 PYTHON_TREQ_LICENSE_FILES = LICENSE
 PYTHON_TREQ_SETUP_TYPE = setuptools
-- 
2.20.1
