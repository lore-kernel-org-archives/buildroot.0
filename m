From: Asaf Kahlon <asafka7@gmail.com>
Date: Fri,  4 Oct 2019 21:31:31 +0300
Subject: [Buildroot] [PATCH 1/1] package/python-ws4py: bump to version 0.5.1
In-Reply-To: <20191004183132.15564-1-asafka7@gmail.com>
References: <20191004183132.15564-1-asafka7@gmail.com>
Message-ID: <20191004183132.15564-25-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

* Update the license file since now it's inside the tarball.
* Add license hash.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-ws4py/python-ws4py.hash | 8 +++++---
 package/python-ws4py/python-ws4py.mk   | 6 +++---
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/package/python-ws4py/python-ws4py.hash b/package/python-ws4py/python-ws4py.hash
index 13469cb036..109768d28e 100644
--- a/package/python-ws4py/python-ws4py.hash
+++ b/package/python-ws4py/python-ws4py.hash
@@ -1,3 +1,5 @@
-# md5 from https://pypi.python.org/pypi/ws4py/json, sha256 locally computed
-md5	f0603ae376707a58d205bd87a67758a2  ws4py-0.4.2.tar.gz
-sha256	7ac69ce3e6ec6917a5d678b65f0a18e244a4dc670db6414bc0271b3f4911237f  ws4py-0.4.2.tar.gz
+# md5, sha256 from https://pypi.org/pypi/ws4py/json
+md5	68e0cfae9659dd059ff7e7a8218af548  ws4py-0.5.1.tar.gz
+sha256	29d073d7f2e006373e6a848b1d00951a1107eb81f3742952be905429dc5a5483  ws4py-0.5.1.tar.gz
+# Locally computed sha256 checksums
+sha256	3c98d9e820de01b1ae3be846419700ab9cefa22b09aa0ef441b3bfd5613c3ba1  LICENSE
diff --git a/package/python-ws4py/python-ws4py.mk b/package/python-ws4py/python-ws4py.mk
index ec5b4aff35..edfd5d0df1 100644
--- a/package/python-ws4py/python-ws4py.mk
+++ b/package/python-ws4py/python-ws4py.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PYTHON_WS4PY_VERSION = 0.4.2
+PYTHON_WS4PY_VERSION = 0.5.1
 PYTHON_WS4PY_SOURCE = ws4py-$(PYTHON_WS4PY_VERSION).tar.gz
-PYTHON_WS4PY_SITE = https://pypi.python.org/packages/b8/98/a90f1d96ffcb15dfc220af524ce23e0a5881258dafa197673357ce1683dd
+PYTHON_WS4PY_SITE = https://files.pythonhosted.org/packages/53/20/4019a739b2eefe9282d3822ef6a225250af964b117356971bd55e274193c
 PYTHON_WS4PY_SETUP_TYPE = setuptools
 PYTHON_WS4PY_LICENSE = BSD-3-Clause
-PYTHON_WS4PY_LICENSE_FILES = ws4py/__init__.py
+PYTHON_WS4PY_LICENSE_FILES = LICENSE
 
 $(eval $(python-package))
-- 
2.20.1
