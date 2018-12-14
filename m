From: Asaf Kahlon <asafka7@gmail.com>
Date: Fri, 14 Dec 2018 07:26:53 +0200
Subject: [Buildroot] [PATCH 1/1] python-bcrypt: bump to version 3.1.5
Message-ID: <20181214052656.27280-1-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-bcrypt/python-bcrypt.hash | 4 ++--
 package/python-bcrypt/python-bcrypt.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-bcrypt/python-bcrypt.hash b/package/python-bcrypt/python-bcrypt.hash
index 4c7c2eddff..14933a6187 100644
--- a/package/python-bcrypt/python-bcrypt.hash
+++ b/package/python-bcrypt/python-bcrypt.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/bcrypt/json
-md5	8408abc974446e64862a9742104e97b6  bcrypt-3.1.4.tar.gz
-sha256	67ed1a374c9155ec0840214ce804616de49c3df9c5bc66740687c1c9b1cd9e8d  bcrypt-3.1.4.tar.gz
+md5	7b441a7cdabf6d6f8ad44af2c0a91ab6  bcrypt-3.1.5.tar.gz
+sha256	136243dc44e5bab9b61206bd46fff3018bd80980b1a1dfbab64a22ff5745957f  bcrypt-3.1.5.tar.gz
 # Locally computed sha256 checksums
 sha256	8173d5c29b4f956d532781d2b86e4e30f83e6b7878dce18c919451d6ba707c90  LICENSE
diff --git a/package/python-bcrypt/python-bcrypt.mk b/package/python-bcrypt/python-bcrypt.mk
index d2dfdf552e..8d25795656 100644
--- a/package/python-bcrypt/python-bcrypt.mk
+++ b/package/python-bcrypt/python-bcrypt.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BCRYPT_VERSION = 3.1.4
+PYTHON_BCRYPT_VERSION = 3.1.5
 PYTHON_BCRYPT_SOURCE = bcrypt-$(PYTHON_BCRYPT_VERSION).tar.gz
-PYTHON_BCRYPT_SITE = https://files.pythonhosted.org/packages/f3/ec/bb6b384b5134fd881b91b6aa3a88ccddaad0103857760711a5ab8c799358
+PYTHON_BCRYPT_SITE = https://files.pythonhosted.org/packages/91/a5/fd19eac0252e56b4ce65ced937ae40024782c21108da7d830003b7f76cdb
 PYTHON_BCRYPT_SETUP_TYPE = setuptools
 PYTHON_BCRYPT_LICENSE = Apache-2.0
 PYTHON_BCRYPT_LICENSE_FILES = LICENSE
-- 
2.19.1
