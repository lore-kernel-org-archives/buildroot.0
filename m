From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 12 Nov 2020 22:03:00 +0100
Subject: [Buildroot] [PATCH/next 1/1] package/python-thrift: bump to version
 0.13.0
Message-ID: <20201112210300.665872-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Updated through scanpypi

https://github.com/apache/thrift/blob/v0.13.0/CHANGES.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-thrift/Config.in          | 5 ++---
 package/python-thrift/python-thrift.hash | 6 +++---
 package/python-thrift/python-thrift.mk   | 8 ++++----
 3 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/package/python-thrift/Config.in b/package/python-thrift/Config.in
index 1ecfda357b..71fef5be81 100644
--- a/package/python-thrift/Config.in
+++ b/package/python-thrift/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_PYTHON_THRIFT
 	bool "python-thrift"
 	select BR2_PACKAGE_PYTHON_SIX # runtime
 	help
-	  python-thrift is a Python bindings for the Apache Thrift RPC
-	  system.
+	  Python bindings for the Apache Thrift RPC system.
 
-	  http://thrift.apache.org/
+	  https://thrift.apache.org
diff --git a/package/python-thrift/python-thrift.hash b/package/python-thrift/python-thrift.hash
index 56d99f2a54..1d1d628908 100644
--- a/package/python-thrift/python-thrift.hash
+++ b/package/python-thrift/python-thrift.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/thrift/json
-md5	36165d5c80e6b101dbe9fcf7ef524d51  thrift-0.11.0.tar.gz
-sha256	7d59ac4fdcb2c58037ebd4a9da5f9a49e3e034bf75b3f26d9fe48ba3d8806e6b  thrift-0.11.0.tar.gz
+md5  c3bc8d9a910d2c9ce26f2ad1f7c96762  thrift-0.13.0.tar.gz
+sha256  9af1c86bf73433afc6010ed376a6c6aca2b54099cc0d61895f640870a9ae7d89  thrift-0.13.0.tar.gz
 # Locally computed sha256 checksums
-sha256	6a62a493bd7c741378619ff61c56282d64f3ad033dc8154b67c808311960bb02  setup.py
+sha256  c13578ae9d0529d0252e1c7375b917bacf58723dce1fcd40c7ed59183401b468  LICENSE
diff --git a/package/python-thrift/python-thrift.mk b/package/python-thrift/python-thrift.mk
index 21f2355f63..3a908ca91c 100644
--- a/package/python-thrift/python-thrift.mk
+++ b/package/python-thrift/python-thrift.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PYTHON_THRIFT_VERSION = 0.11.0
+PYTHON_THRIFT_VERSION = 0.13.0
 PYTHON_THRIFT_SOURCE = thrift-$(PYTHON_THRIFT_VERSION).tar.gz
-PYTHON_THRIFT_SITE = https://files.pythonhosted.org/packages/c6/b4/510617906f8e0c5660e7d96fbc5585113f83ad547a3989b80297ac72a74c
-PYTHON_THRIFT_LICENSE = Apache-2.0
-PYTHON_THRIFT_LICENSE_FILES = setup.py
+PYTHON_THRIFT_SITE = https://files.pythonhosted.org/packages/97/1e/3284d19d7be99305eda145b8aa46b0c33244e4a496ec66440dac19f8274d
 PYTHON_THRIFT_SETUP_TYPE = setuptools
+PYTHON_THRIFT_LICENSE = Apache-2.0
+PYTHON_THRIFT_LICENSE_FILES = LICENSE
 
 $(eval $(python-package))
-- 
2.28.0
