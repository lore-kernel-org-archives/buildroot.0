From: Asaf Kahlon <asafka7@gmail.com>
Date: Sat, 12 Oct 2019 11:47:38 +0300
Subject: [Buildroot] [PATCH 1/1] package/{python-mako,
 python3-mako}: bump to version 1.1.0
In-Reply-To: <20191012084739.19673-1-asafka7@gmail.com>
References: <20191012084739.19673-1-asafka7@gmail.com>
Message-ID: <20191012084739.19673-2-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also update the license hash (because of a year bump on upstream).

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-mako/python-mako.hash | 10 +++++-----
 package/python-mako/python-mako.mk   |  4 ++--
 package/python3-mako/python3-mako.mk |  4 ++--
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/package/python-mako/python-mako.hash b/package/python-mako/python-mako.hash
index a0750cf8a2..0f0dadcd0c 100644
--- a/package/python-mako/python-mako.hash
+++ b/package/python-mako/python-mako.hash
@@ -1,5 +1,5 @@
-# md5 from https://pypi.python.org/pypi/mako/json, sha256 locally computed
-md5 a28e22a339080316b2acc352b9ee631c Mako-1.0.6.tar.gz
-sha256 48559ebd872a8e77f92005884b3d88ffae552812cdf17db6768e5c3be5ebbe0d Mako-1.0.6.tar.gz
-# License files, locally computed
-sha256 84f6f8798990239d697b6d62631dc402962d4fb3895955ea926dce7956baf71b LICENSE
+# md5, sha256 from https://pypi.org/pypi/mako/json
+md5	6c3f2da0b74af529a4c4a537d0848bf2  Mako-1.1.0.tar.gz
+sha256	a36919599a9b7dc5d86a7a8988f23a9a3a3d083070023bab23d64f7f1d1e0a4b  Mako-1.1.0.tar.gz
+# Locally computed sha256 checksums
+sha256	c3b124673c93872156757a934c75b498d68eec09510e25e549d9dc2013776499  LICENSE
diff --git a/package/python-mako/python-mako.mk b/package/python-mako/python-mako.mk
index f8478cf031..622359493a 100644
--- a/package/python-mako/python-mako.mk
+++ b/package/python-mako/python-mako.mk
@@ -6,9 +6,9 @@
 
 # Please keep in sync with
 # package/python3-mako/python3-mako.mk
-PYTHON_MAKO_VERSION = 1.0.6
+PYTHON_MAKO_VERSION = 1.1.0
 PYTHON_MAKO_SOURCE = Mako-$(PYTHON_MAKO_VERSION).tar.gz
-PYTHON_MAKO_SITE = https://pypi.python.org/packages/56/4b/cb75836863a6382199aefb3d3809937e21fa4cb0db15a4f4ba0ecc2e7e8e
+PYTHON_MAKO_SITE = https://files.pythonhosted.org/packages/b0/3c/8dcd6883d009f7cae0f3157fb53e9afb05a0d3d33b3db1268ec2e6f4a56b
 PYTHON_MAKO_SETUP_TYPE = setuptools
 PYTHON_MAKO_LICENSE = MIT
 PYTHON_MAKO_LICENSE_FILES = LICENSE
diff --git a/package/python3-mako/python3-mako.mk b/package/python3-mako/python3-mako.mk
index 624152e484..31df4194eb 100644
--- a/package/python3-mako/python3-mako.mk
+++ b/package/python3-mako/python3-mako.mk
@@ -6,9 +6,9 @@
 
 # Please keep in sync with
 # package/python-mako/python-mako.mk
-PYTHON3_MAKO_VERSION = 1.0.6
+PYTHON3_MAKO_VERSION = 1.1.0
 PYTHON3_MAKO_SOURCE = Mako-$(PYTHON_MAKO_VERSION).tar.gz
-PYTHON3_MAKO_SITE = https://pypi.python.org/packages/56/4b/cb75836863a6382199aefb3d3809937e21fa4cb0db15a4f4ba0ecc2e7e8e
+PYTHON3_MAKO_SITE = https://files.pythonhosted.org/packages/b0/3c/8dcd6883d009f7cae0f3157fb53e9afb05a0d3d33b3db1268ec2e6f4a56b
 PYTHON3_MAKO_SETUP_TYPE = setuptools
 PYTHON3_MAKO_LICENSE = MIT
 PYTHON3_MAKO_LICENSE_FILES = LICENSE
-- 
2.20.1
