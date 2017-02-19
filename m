From: Adam Duskett <aduskett@gmail.com>
Date: Sun, 19 Feb 2017 14:12:40 -0500
Subject: [Buildroot] [PATCH 43/58] python-pysocks: bump to version 1.6.6
In-Reply-To: <20170219191255.1503-1-Adamduskett@outlook.com>
References: <20170219191255.1503-1-Adamduskett@outlook.com>
Message-ID: <20170219191255.1503-44-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
 package/python-pysocks/python-pysocks.hash | 6 +++---
 package/python-pysocks/python-pysocks.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-pysocks/python-pysocks.hash b/package/python-pysocks/python-pysocks.hash
index 556996a..ac0b63a 100644
--- a/package/python-pysocks/python-pysocks.hash
+++ b/package/python-pysocks/python-pysocks.hash
@@ -1,3 +1,3 @@
-# md5 from https://pypi.python.org/pypi/PySocks/json, sha256 locally computed
-md5     68f4ad7a8d4fa725656ae3e9dd142d29  PySocks-1.5.7.tar.gz
-sha256  e51c7694b10288e6fd9a28e15c0bcce9aca0327e7b32ebcd9af05fcd56f38b88  PySocks-1.5.7.tar.gz
+# md5 from https://pypi.python.org/pypi/pysocks/json, sha256 locally computed
+md5 571f4c23982fa86bf0e7a441f1b6c881 PySocks-1.6.6.tar.gz
+sha256 02419a225ff5dcfc3c9695ef8fc9b4d8cc99658e650c6d4718d4c8f451e63f41 PySocks-1.6.6.tar.gz
diff --git a/package/python-pysocks/python-pysocks.mk b/package/python-pysocks/python-pysocks.mk
index a99a399..0fa8c1d 100644
--- a/package/python-pysocks/python-pysocks.mk
+++ b/package/python-pysocks/python-pysocks.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYSOCKS_VERSION = 1.5.7
+PYTHON_PYSOCKS_VERSION = 1.6.6
 PYTHON_PYSOCKS_SOURCE = PySocks-$(PYTHON_PYSOCKS_VERSION).tar.gz
-PYTHON_PYSOCKS_SITE = https://pypi.python.org/packages/16/56/9b3513078f837fa8cb88ee01ec1cd805ed8104a37bc02ca8c2588ae8fe5a
+PYTHON_PYSOCKS_SITE = https://pypi.python.org/packages/fd/70/ba9982cedc9b3ed3c06934f1f46a609e0f23c7bfdf567c52a09f1296b8cb
 PYTHON_PYSOCKS_LICENSE = BSD-3c
 PYTHON_PYSOCKS_LICENSE_FILES = socks.py
 PYTHON_PYSOCKS_SETUP_TYPE = distutils
-- 
2.9.3
