From: Asaf Kahlon <asafka7@gmail.com>
Date: Tue, 11 Sep 2018 17:58:21 +0300
Subject: [Buildroot] [PATCH 1/1] python-pathlib2: bump to version 2.3.2
Message-ID: <20180911145823.15032-1-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add license hash.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-pathlib2/python-pathlib2.hash | 8 +++++---
 package/python-pathlib2/python-pathlib2.mk   | 4 ++--
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/python-pathlib2/python-pathlib2.hash b/package/python-pathlib2/python-pathlib2.hash
index a9c294940a..4d2b02f8d4 100644
--- a/package/python-pathlib2/python-pathlib2.hash
+++ b/package/python-pathlib2/python-pathlib2.hash
@@ -1,3 +1,5 @@
-# md5 from https://pypi.python.org/pypi/pathlib2/json, sha256 locally computed
-md5 6c75bfde898b6c88627621a48ee8de14 pathlib2-2.2.1.tar.gz
-sha256 ce9007df617ef6b7bd8a31cd2089ed0c1fed1f7c23cf2bf1ba140b3dd563175d pathlib2-2.2.1.tar.gz
+# md5, sha256 from https://pypi.org/pypi/pathlib2/json
+md5	fd76fb5d0baa798bfe12fb7965da97f8  pathlib2-2.3.2.tar.gz
+sha256	8eb170f8d0d61825e09a95b38be068299ddeda82f35e96c3301a8a5e7604cb83  pathlib2-2.3.2.tar.gz
+# Locally computed sha256 checksums
+sha256	f8e02f1a07e4c6fc59a4bee831ddde26b97064105c423b9e24340f35aaa80262  LICENSE.rst
diff --git a/package/python-pathlib2/python-pathlib2.mk b/package/python-pathlib2/python-pathlib2.mk
index 0116420ef6..dadc97513b 100644
--- a/package/python-pathlib2/python-pathlib2.mk
+++ b/package/python-pathlib2/python-pathlib2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PATHLIB2_VERSION = 2.2.1
+PYTHON_PATHLIB2_VERSION = 2.3.2
 PYTHON_PATHLIB2_SOURCE = pathlib2-$(PYTHON_PATHLIB2_VERSION).tar.gz
-PYTHON_PATHLIB2_SITE = https://pypi.python.org/packages/ab/d8/ac7489d50146f29d0a14f65545698f4545d8a6b739b24b05859942048b56
+PYTHON_PATHLIB2_SITE = https://files.pythonhosted.org/packages/db/a8/7d6439c1aec525ed70810abee5b7d7f3aa35347f59bc28343e8f62019aa2
 PYTHON_PATHLIB2_LICENSE = MIT
 PYTHON_PATHLIB2_LICENSE_FILES = LICENSE.rst
 PYTHON_PATHLIB2_SETUP_TYPE = setuptools
-- 
2.17.1
