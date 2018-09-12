From: Asaf Kahlon <asafka7@gmail.com>
Date: Wed, 12 Sep 2018 22:46:44 +0300
Subject: [Buildroot] [PATCH 1/1] python-bcrypt: bump to version 3.1.4
Message-ID: <20180912194644.32704-1-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add license hash.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-bcrypt/python-bcrypt.hash | 8 +++++---
 package/python-bcrypt/python-bcrypt.mk   | 4 ++--
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/python-bcrypt/python-bcrypt.hash b/package/python-bcrypt/python-bcrypt.hash
index 574cbe1555..4c7c2eddff 100644
--- a/package/python-bcrypt/python-bcrypt.hash
+++ b/package/python-bcrypt/python-bcrypt.hash
@@ -1,3 +1,5 @@
-# md5 from https://pypi.python.org/pypi/bcrypt/json, sha256 locally computed
-md5	20da8b40790caad99c4086dba533154b  bcrypt-3.1.3.tar.gz
-sha256	6645c8d0ad845308de3eb9be98b6fd22a46ec5412bfc664a423e411cdd8f5488  bcrypt-3.1.3.tar.gz
+# md5, sha256 from https://pypi.org/pypi/bcrypt/json
+md5	8408abc974446e64862a9742104e97b6  bcrypt-3.1.4.tar.gz
+sha256	67ed1a374c9155ec0840214ce804616de49c3df9c5bc66740687c1c9b1cd9e8d  bcrypt-3.1.4.tar.gz
+# Locally computed sha256 checksums
+sha256	8173d5c29b4f956d532781d2b86e4e30f83e6b7878dce18c919451d6ba707c90  LICENSE
diff --git a/package/python-bcrypt/python-bcrypt.mk b/package/python-bcrypt/python-bcrypt.mk
index aa6f9815a5..d2dfdf552e 100644
--- a/package/python-bcrypt/python-bcrypt.mk
+++ b/package/python-bcrypt/python-bcrypt.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BCRYPT_VERSION = 3.1.3
+PYTHON_BCRYPT_VERSION = 3.1.4
 PYTHON_BCRYPT_SOURCE = bcrypt-$(PYTHON_BCRYPT_VERSION).tar.gz
-PYTHON_BCRYPT_SITE = https://pypi.python.org/packages/58/e9/6d7f1d883d8c5876470b5d187d72c04f2a9954d61e71e7eb5d2ea2a50442
+PYTHON_BCRYPT_SITE = https://files.pythonhosted.org/packages/f3/ec/bb6b384b5134fd881b91b6aa3a88ccddaad0103857760711a5ab8c799358
 PYTHON_BCRYPT_SETUP_TYPE = setuptools
 PYTHON_BCRYPT_LICENSE = Apache-2.0
 PYTHON_BCRYPT_LICENSE_FILES = LICENSE
-- 
2.17.1
