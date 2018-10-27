From: Asaf Kahlon <asafka7@gmail.com>
Date: Sat, 27 Oct 2018 08:07:23 +0300
Subject: [Buildroot] [PATCH 1/1] python-fastentrypoints: bump to version 0.12
Message-ID: <20181027050723.11522-1-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 .../python-fastentrypoints/python-fastentrypoints.hash    | 8 ++++----
 package/python-fastentrypoints/python-fastentrypoints.mk  | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-fastentrypoints/python-fastentrypoints.hash b/package/python-fastentrypoints/python-fastentrypoints.hash
index 84e9b78287..71165d61fa 100644
--- a/package/python-fastentrypoints/python-fastentrypoints.hash
+++ b/package/python-fastentrypoints/python-fastentrypoints.hash
@@ -1,4 +1,4 @@
-# md5 from https://pypi.python.org/pypi/fastentrypoints/json, sha256 locally computed
-md5	9bd2a34697eb8279d87e7b927f4f7e85  fastentrypoints-0.10.tar.gz
-sha256	ed418146ed87230694ec2d8890b9b3e2967e95d857e5ce933cafecb1067cca82  fastentrypoints-0.10.tar.gz
-sha256	2da210da31c033faa270503884a3ac9058874543e6fdd0b094000720bf2ffb66  fastentrypoints.py
+# md5 from https://pypi.org/pypi/fastentrypoints/json, sha256 locally computed
+md5	390ad9a9229164a06156a5b1f0ef1b22  fastentrypoints-0.12.tar.gz
+sha256	ff284f1469bd65400599807d2c6284d5b251398e6e28811f5f77fd262292410b  fastentrypoints-0.12.tar.gz
+sha256	d1ce3f6a7bb1a7194c7d826a0ca318176b12e58616d9e3d8f366ad43802787c4  fastentrypoints.py
diff --git a/package/python-fastentrypoints/python-fastentrypoints.mk b/package/python-fastentrypoints/python-fastentrypoints.mk
index c4eb3e862f..7fa728929d 100644
--- a/package/python-fastentrypoints/python-fastentrypoints.mk
+++ b/package/python-fastentrypoints/python-fastentrypoints.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FASTENTRYPOINTS_VERSION = 0.10
+PYTHON_FASTENTRYPOINTS_VERSION = 0.12
 PYTHON_FASTENTRYPOINTS_SOURCE = fastentrypoints-$(PYTHON_FASTENTRYPOINTS_VERSION).tar.gz
-PYTHON_FASTENTRYPOINTS_SITE = https://pypi.python.org/packages/e8/c8/c2902c9c9da43d8be8c75a730f15f0c51933c42c39b91d1d7b605a88e907
+PYTHON_FASTENTRYPOINTS_SITE = https://files.pythonhosted.org/packages/56/59/69d9ae590ca39435d409651314ec13b2abe8127c1db0231c01d034ebb6b0
 PYTHON_FASTENTRYPOINTS_SETUP_TYPE = setuptools
 PYTHON_FASTENTRYPOINTS_LICENSE = BSD-2-Clause
 PYTHON_FASTENTRYPOINTS_LICENSE_FILES = fastentrypoints.py
-- 
2.19.1
