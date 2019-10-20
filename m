From: Asaf Kahlon <asafka7@gmail.com>
Date: Sun, 20 Oct 2019 16:42:02 +0300
Subject: [Buildroot] [PATCH 1/1] package/python-cffi: bump to version 1.13.0
Message-ID: <20191020134203.11282-1-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-cffi/python-cffi.hash | 7 ++++---
 package/python-cffi/python-cffi.mk   | 4 ++--
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-cffi/python-cffi.hash b/package/python-cffi/python-cffi.hash
index 15f67e9cc1..9ee472ce09 100644
--- a/package/python-cffi/python-cffi.hash
+++ b/package/python-cffi/python-cffi.hash
@@ -1,4 +1,5 @@
-# md5 from https://pypi.python.org/pypi/cffi/json, sha256 locally computed
-md5	35ad1f9e1003cac9404c1493eb10d7f5  cffi-1.12.3.tar.gz
-sha256	041c81822e9f84b1d9c401182e174996f0bae9991f33725d059b771744290774  cffi-1.12.3.tar.gz
+# md5, sha256 from https://pypi.org/pypi/cffi/json
+md5	2c90be6d3bfbf80ab732b28fd677051d  cffi-1.13.0.tar.gz
+sha256	8fe230f612c18af1df6f348d02d682fe2c28ca0a6c3856c99599cdacae7cf226  cffi-1.13.0.tar.gz
+# Locally computed sha256 checksums
 sha256  04b80f5b077bbed68808cfebadeb5e3523f2a8c9a96495c587bd96df1eac2a33  LICENSE
diff --git a/package/python-cffi/python-cffi.mk b/package/python-cffi/python-cffi.mk
index 810c032bff..623c439f84 100644
--- a/package/python-cffi/python-cffi.mk
+++ b/package/python-cffi/python-cffi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CFFI_VERSION = 1.12.3
+PYTHON_CFFI_VERSION = 1.13.0
 PYTHON_CFFI_SOURCE = cffi-$(PYTHON_CFFI_VERSION).tar.gz
-PYTHON_CFFI_SITE = https://files.pythonhosted.org/packages/93/1a/ab8c62b5838722f29f3daffcc8d4bd61844aa9b5f437341cc890ceee483b
+PYTHON_CFFI_SITE = https://files.pythonhosted.org/packages/d6/cf/ba7e2df852a2fc807d48b3f7bea46f741830be4f047a0712e6de3e95fb6a
 PYTHON_CFFI_SETUP_TYPE = setuptools
 PYTHON_CFFI_DEPENDENCIES = host-pkgconf libffi
 PYTHON_CFFI_LICENSE = MIT
-- 
2.20.1
