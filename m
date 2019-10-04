From: Asaf Kahlon <asafka7@gmail.com>
Date: Fri,  4 Oct 2019 21:31:16 +0300
Subject: [Buildroot] [PATCH 1/1] package/python-pickleshare: bump to version
 0.7.5
In-Reply-To: <20191004183132.15564-1-asafka7@gmail.com>
References: <20191004183132.15564-1-asafka7@gmail.com>
Message-ID: <20191004183132.15564-10-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add hash for license file.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-pickleshare/python-pickleshare.hash | 8 +++++---
 package/python-pickleshare/python-pickleshare.mk   | 4 ++--
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/python-pickleshare/python-pickleshare.hash b/package/python-pickleshare/python-pickleshare.hash
index 6e3d408eaa..1b6afcc68c 100644
--- a/package/python-pickleshare/python-pickleshare.hash
+++ b/package/python-pickleshare/python-pickleshare.hash
@@ -1,3 +1,5 @@
-# md5 from https://pypi.python.org/pypi/pickleshare/json, sha256 locally computed
-md5 6a9e5dd8dfc023031f6b7b3f824cab12 pickleshare-0.7.4.tar.gz
-sha256 84a9257227dfdd6fe1b4be1319096c20eb85ff1e82c7932f36efccfe1b09737b pickleshare-0.7.4.tar.gz
+# md5, sha256 from https://pypi.org/pypi/pickleshare/json
+md5	44ab782615894a812ab96669a122a634  pickleshare-0.7.5.tar.gz
+sha256	87683d47965c1da65cdacaf31c8441d12b8044cdec9aca500cd78fc2c683afca  pickleshare-0.7.5.tar.gz
+# Locally computed sha256 checksums
+sha256	db1fefc1789444409514c0cae0bfab7f8e374ff9b78e092cecb1e0aeb6a36d90  LICENSE
diff --git a/package/python-pickleshare/python-pickleshare.mk b/package/python-pickleshare/python-pickleshare.mk
index 53fd84e450..1ed1257d03 100644
--- a/package/python-pickleshare/python-pickleshare.mk
+++ b/package/python-pickleshare/python-pickleshare.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PICKLESHARE_VERSION = 0.7.4
+PYTHON_PICKLESHARE_VERSION = 0.7.5
 PYTHON_PICKLESHARE_SOURCE = pickleshare-$(PYTHON_PICKLESHARE_VERSION).tar.gz
-PYTHON_PICKLESHARE_SITE = https://pypi.python.org/packages/69/fe/dd137d84daa0fd13a709e448138e310d9ea93070620c9db5454e234af525
+PYTHON_PICKLESHARE_SITE = https://files.pythonhosted.org/packages/d8/b6/df3c1c9b616e9c0edbc4fbab6ddd09df9535849c64ba51fcb6531c32d4d8
 PYTHON_PICKLESHARE_LICENSE = MIT
 PYTHON_PICKLESHARE_LICENSE_FILES = LICENSE
 PYTHON_PICKLESHARE_SETUP_TYPE = setuptools
-- 
2.20.1
