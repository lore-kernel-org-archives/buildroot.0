From: Asaf Kahlon <asafka7@gmail.com>
Date: Tue,  1 Oct 2019 19:57:09 +0300
Subject: [Buildroot] [PATCH 1/1] package/python-pynacl: bump to version 1.3.0
Message-ID: <20191001165709.22247-1-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-pynacl/python-pynacl.hash | 4 ++--
 package/python-pynacl/python-pynacl.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pynacl/python-pynacl.hash b/package/python-pynacl/python-pynacl.hash
index 84d8674bf4..9aa8a0eefe 100644
--- a/package/python-pynacl/python-pynacl.hash
+++ b/package/python-pynacl/python-pynacl.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pynacl/json
-md5	1db3e111775fbe6b66772ff30af7a956  PyNaCl-1.2.1.tar.gz
-sha256	e0d38fa0a75f65f556fb912f2c6790d1fa29b7dd27a1d9cc5591b281321eaaa9  PyNaCl-1.2.1.tar.gz
+md5	3f3b1272287bc2de8efd8a5fa18bf728  PyNaCl-1.3.0.tar.gz
+sha256	0c6100edd16fefd1557da078c7a31e7b7d7a52ce39fdca2bec29d4f7b6e7600c  PyNaCl-1.3.0.tar.gz
 # Locally computed sha256 checksums
 sha256	d3174ad63e721d4c9dccb8ad4320848992d314369bc46319720b5802c9153fe9  LICENSE
diff --git a/package/python-pynacl/python-pynacl.mk b/package/python-pynacl/python-pynacl.mk
index 1203a6e112..679b3a7795 100644
--- a/package/python-pynacl/python-pynacl.mk
+++ b/package/python-pynacl/python-pynacl.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYNACL_VERSION = 1.2.1
+PYTHON_PYNACL_VERSION = 1.3.0
 PYTHON_PYNACL_SOURCE = PyNaCl-$(PYTHON_PYNACL_VERSION).tar.gz
-PYTHON_PYNACL_SITE = https://files.pythonhosted.org/packages/08/19/cf56e60efd122fa6d2228118a9b345455b13ffe16a14be81d025b03b261f
+PYTHON_PYNACL_SITE = https://files.pythonhosted.org/packages/61/ab/2ac6dea8489fa713e2b4c6c5b549cc962dd4a842b5998d9e80cf8440b7cd
 PYTHON_PYNACL_LICENSE = Apache-2.0
 PYTHON_PYNACL_LICENSE_FILES = LICENSE
 PYTHON_PYNACL_SETUP_TYPE = setuptools
-- 
2.20.1
