From: Asaf Kahlon <asafka7@gmail.com>
Date: Fri,  4 Oct 2019 21:31:20 +0300
Subject: [Buildroot] [PATCH 1/1] package/python-pylru: bump to version 1.2.0
In-Reply-To: <20191004183132.15564-1-asafka7@gmail.com>
References: <20191004183132.15564-1-asafka7@gmail.com>
Message-ID: <20191004183132.15564-14-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add hash for license file.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-pylru/python-pylru.hash | 8 +++++---
 package/python-pylru/python-pylru.mk   | 6 +++---
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/package/python-pylru/python-pylru.hash b/package/python-pylru/python-pylru.hash
index 806ea36a0f..1962c6015b 100644
--- a/package/python-pylru/python-pylru.hash
+++ b/package/python-pylru/python-pylru.hash
@@ -1,3 +1,5 @@
-# md5 from https://pypi.python.org/pypi/pylru/json, sha256 locally computed
-md5	41369d58a1c4391c5cc36f84262abcdc  pylru-1.0.9.tar.gz
-sha256	71376192671f0ad1690b2a7427d39a29b1df994c8469a9b46b03ed7e28c0172c  pylru-1.0.9.tar.gz
+# md5, sha256 from https://pypi.org/pypi/pylru/json
+md5	8f0050f86d1fa68bb18673de37da543b  pylru-1.2.0.tar.gz
+sha256	492f934bb98dc6c8b2370c02c95c65516ddc08c8f64d27f70087eb038621d297  pylru-1.2.0.tar.gz
+# Locally computed sha256 checksums
+sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.txt
diff --git a/package/python-pylru/python-pylru.mk b/package/python-pylru/python-pylru.mk
index 75b6de7793..98c3945dd0 100644
--- a/package/python-pylru/python-pylru.mk
+++ b/package/python-pylru/python-pylru.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_PYLRU_VERSION = 1.0.9
+PYTHON_PYLRU_VERSION = 1.2.0
 PYTHON_PYLRU_SOURCE = pylru-$(PYTHON_PYLRU_VERSION).tar.gz
-PYTHON_PYLRU_SITE = https://pypi.python.org/packages/c0/7d/0de1055632f3871dfeaabe5a3f0510317cd98b93e7b792b44e4c7de2b17b
-PYTHON_PYLRU_SETUP_TYPE = distutils
+PYTHON_PYLRU_SITE = https://files.pythonhosted.org/packages/9c/88/30972cd0518452563221c80bffc2a5832499d736648ef8fe492affae15c5
+PYTHON_PYLRU_SETUP_TYPE = setuptools
 PYTHON_PYLRU_LICENSE = GPL-2.0
 PYTHON_PYLRU_LICENSE_FILES = LICENSE.txt
 
-- 
2.20.1
