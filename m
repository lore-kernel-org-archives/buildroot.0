From: Asaf Kahlon <asafka7@gmail.com>
Date: Sat,  1 Dec 2018 17:47:59 +0200
Subject: [Buildroot] [PATCH 1/1] python-jsonmodels: bump to version 2.4
Message-ID: <20181201154759.12675-1-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-jsonmodels/python-jsonmodels.hash | 7 ++++---
 package/python-jsonmodels/python-jsonmodels.mk   | 4 ++--
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-jsonmodels/python-jsonmodels.hash b/package/python-jsonmodels/python-jsonmodels.hash
index f5b1ac5ef1..16e200b03f 100644
--- a/package/python-jsonmodels/python-jsonmodels.hash
+++ b/package/python-jsonmodels/python-jsonmodels.hash
@@ -1,4 +1,5 @@
-# md5 from https://pypi.python.org/pypi/jsonmodels/json, sha256 locally computed
-md5	e42b6c0078e731035ec3f1bf8a6cdc92  jsonmodels-2.3.tar.gz
-sha256	09e9639c85531e0f37991bb23a363494e37a2e89fb480dbc03d9556258f4ea47  jsonmodels-2.3.tar.gz
+# md5, sha256 from https://pypi.org/pypi/jsonmodels/json
+md5	96132e252887f840d23792c03fad2039  jsonmodels-2.4.tar.gz
+sha256	abc8dc334a1794513e511a75639f77c271ef6a2992b6793f3753c7335dd18775  jsonmodels-2.4.tar.gz
+# Locally computed sha256 checksums
 sha256	3b1219763eec6924ddd4c4d61dee6a53c5fc9ab62707a9ad763ee363d3050cc5  LICENSE
diff --git a/package/python-jsonmodels/python-jsonmodels.mk b/package/python-jsonmodels/python-jsonmodels.mk
index 4d4da87969..4e4eecf233 100644
--- a/package/python-jsonmodels/python-jsonmodels.mk
+++ b/package/python-jsonmodels/python-jsonmodels.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_JSONMODELS_VERSION = 2.3
+PYTHON_JSONMODELS_VERSION = 2.4
 PYTHON_JSONMODELS_SOURCE = jsonmodels-$(PYTHON_JSONMODELS_VERSION).tar.gz
-PYTHON_JSONMODELS_SITE = https://pypi.python.org/packages/ab/0f/e214845b49881d3b2bebd1f387eedc5b26ac5580353a0a38074e94439957
+PYTHON_JSONMODELS_SITE = https://files.pythonhosted.org/packages/68/00/524668dc751f9ef91e73c795b2073bf2ddb79728a474d1bcab9c6dc426d8
 PYTHON_JSONMODELS_SETUP_TYPE = setuptools
 PYTHON_JSONMODELS_LICENSE = BSD-3-Clause
 PYTHON_JSONMODELS_LICENSE_FILES = LICENSE
-- 
2.19.1
