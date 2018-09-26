From: Asaf Kahlon <asafka7@gmail.com>
Date: Wed, 26 Sep 2018 18:34:52 +0300
Subject: [Buildroot] [PATCH 10/23] python-pynacl: bump to version 1.2.1
In-Reply-To: <20180926153505.3411-1-asafka7@gmail.com>
References: <20180926153505.3411-1-asafka7@gmail.com>
Message-ID: <20180926153505.3411-11-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add license hash.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-pynacl/python-pynacl.hash | 8 +++++---
 package/python-pynacl/python-pynacl.mk   | 4 ++--
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/python-pynacl/python-pynacl.hash b/package/python-pynacl/python-pynacl.hash
index 7035ac7637..84d8674bf4 100644
--- a/package/python-pynacl/python-pynacl.hash
+++ b/package/python-pynacl/python-pynacl.hash
@@ -1,3 +1,5 @@
-# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=12fd03d8ce64e0318cb1c69272f17704, sha256 locally computed.
-md5	12fd03d8ce64e0318cb1c69272f17704  PyNaCl-1.0.1.tar.gz
-sha256	d21d7a7358a85fb9b9ddadfbd1176c40fe199334fe2202881255e77f6d3773f4  PyNaCl-1.0.1.tar.gz
+# md5, sha256 from https://pypi.org/pypi/pynacl/json
+md5	1db3e111775fbe6b66772ff30af7a956  PyNaCl-1.2.1.tar.gz
+sha256	e0d38fa0a75f65f556fb912f2c6790d1fa29b7dd27a1d9cc5591b281321eaaa9  PyNaCl-1.2.1.tar.gz
+# Locally computed sha256 checksums
+sha256	d3174ad63e721d4c9dccb8ad4320848992d314369bc46319720b5802c9153fe9  LICENSE
diff --git a/package/python-pynacl/python-pynacl.mk b/package/python-pynacl/python-pynacl.mk
index 469ddda474..1203a6e112 100644
--- a/package/python-pynacl/python-pynacl.mk
+++ b/package/python-pynacl/python-pynacl.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYNACL_VERSION = 1.0.1
+PYTHON_PYNACL_VERSION = 1.2.1
 PYTHON_PYNACL_SOURCE = PyNaCl-$(PYTHON_PYNACL_VERSION).tar.gz
-PYTHON_PYNACL_SITE = https://pypi.python.org/packages/source/P/PyNaCl
+PYTHON_PYNACL_SITE = https://files.pythonhosted.org/packages/08/19/cf56e60efd122fa6d2228118a9b345455b13ffe16a14be81d025b03b261f
 PYTHON_PYNACL_LICENSE = Apache-2.0
 PYTHON_PYNACL_LICENSE_FILES = LICENSE
 PYTHON_PYNACL_SETUP_TYPE = setuptools
-- 
2.17.1
