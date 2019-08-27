From: Asaf Kahlon <asafka7@gmail.com>
Date: Tue, 27 Aug 2019 20:28:10 +0300
Subject: [Buildroot] [PATCH 1/1] package/python-xlrd: bump to version 1.2.0
In-Reply-To: <20190827172812.10594-1-asafka7@gmail.com>
References: <20190827172812.10594-1-asafka7@gmail.com>
Message-ID: <20190827172812.10594-9-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-xlrd/python-xlrd.hash | 7 +++----
 package/python-xlrd/python-xlrd.mk   | 4 ++--
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/python-xlrd/python-xlrd.hash b/package/python-xlrd/python-xlrd.hash
index 8075605a95..fd553c7830 100644
--- a/package/python-xlrd/python-xlrd.hash
+++ b/package/python-xlrd/python-xlrd.hash
@@ -1,4 +1,3 @@
-# md5 from https://pypi.python.org/pypi/xlrd/json
-md5	9a91b688cd4945477ac28187a54f9a3b  xlrd-1.0.0.tar.gz
-# sha256 calculated by scanpypi
-sha256	0ff87dd5d50425084f7219cb6f86bb3eb5aa29063f53d50bf270ed007e941069  xlrd-1.0.0.tar.gz
+# md5, sha256 from https://pypi.org/pypi/xlrd/json
+md5	e5d5b96924d791b22898b622eb3e918e  xlrd-1.2.0.tar.gz
+sha256	546eb36cee8db40c3eaa46c351e67ffee6eeb5fa2650b71bc4c758a29a1b29b2  xlrd-1.2.0.tar.gz
diff --git a/package/python-xlrd/python-xlrd.mk b/package/python-xlrd/python-xlrd.mk
index 5d1363886d..8b1b1de4dd 100644
--- a/package/python-xlrd/python-xlrd.mk
+++ b/package/python-xlrd/python-xlrd.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_XLRD_VERSION = 1.0.0
+PYTHON_XLRD_VERSION = 1.2.0
 PYTHON_XLRD_SOURCE = xlrd-$(PYTHON_XLRD_VERSION).tar.gz
-PYTHON_XLRD_SITE = https://pypi.python.org/packages/42/85/25caf967c2d496067489e0bb32df069a8361e1fd96a7e9f35408e56b3aab
+PYTHON_XLRD_SITE = https://files.pythonhosted.org/packages/aa/05/ec9d4fcbbb74bbf4da9f622b3b61aec541e4eccf31d3c60c5422ec027ce2
 PYTHON_XLRD_SETUP_TYPE = setuptools
 PYTHON_XLRD_LICENSE = BSD-3-Clause
 PYTHON_XLRD_LICENSE_FILES = xlrd/licences.py
-- 
2.20.1
