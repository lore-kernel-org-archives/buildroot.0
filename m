From: Asaf Kahlon <asafka7@gmail.com>
Date: Fri,  4 Oct 2019 21:31:26 +0300
Subject: [Buildroot] [PATCH 1/1] package/python-simplejson: bump to version
 3.16.0
In-Reply-To: <20191004183132.15564-1-asafka7@gmail.com>
References: <20191004183132.15564-1-asafka7@gmail.com>
Message-ID: <20191004183132.15564-20-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also update license hash.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-simplejson/python-simplejson.hash | 8 +++++---
 package/python-simplejson/python-simplejson.mk   | 4 ++--
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/python-simplejson/python-simplejson.hash b/package/python-simplejson/python-simplejson.hash
index f2a5fce38e..f9d2aaefd3 100644
--- a/package/python-simplejson/python-simplejson.hash
+++ b/package/python-simplejson/python-simplejson.hash
@@ -1,3 +1,5 @@
-# md5 from https://pypi.python.org/pypi/simplejson/json, sha256 locally computed
-md5 6e2f1bd5fb0a926facf5d89d217a7183 simplejson-3.11.1.tar.gz
-sha256 01a22d49ddd9a168b136f26cac87d9a335660ce07aa5c630b8e3607d6f4325e7 simplejson-3.11.1.tar.gz
+# md5, sha256 from https://pypi.org/pypi/simplejson/json
+md5	744fa99aed207478f8fbf9dd9f04fad3  simplejson-3.16.0.tar.gz
+sha256	b1f329139ba647a9548aa05fb95d046b4a677643070dc2afc05fa2e975d09ca5  simplejson-3.16.0.tar.gz
+# Locally computed sha256 checksums
+sha256	fcaa1e313a99304322e2e0836ea4ee7d839ce9a480438f3922a853edfdde129f  LICENSE.txt
diff --git a/package/python-simplejson/python-simplejson.mk b/package/python-simplejson/python-simplejson.mk
index afc77fec67..20b5b2481b 100644
--- a/package/python-simplejson/python-simplejson.mk
+++ b/package/python-simplejson/python-simplejson.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SIMPLEJSON_VERSION = 3.11.1
+PYTHON_SIMPLEJSON_VERSION = 3.16.0
 PYTHON_SIMPLEJSON_SOURCE = simplejson-$(PYTHON_SIMPLEJSON_VERSION).tar.gz
-PYTHON_SIMPLEJSON_SITE = https://pypi.python.org/packages/08/48/c97b668d6da7d7bebe7ea1817a6f76394b0ec959cb04214ca833c34359df
+PYTHON_SIMPLEJSON_SITE = https://files.pythonhosted.org/packages/e3/24/c35fb1c1c315fc0fffe61ea00d3f88e85469004713dab488dee4f35b0aff
 PYTHON_SIMPLEJSON_LICENSE = Academic Free License (AFL), MIT
 PYTHON_SIMPLEJSON_LICENSE_FILES = LICENSE.txt
 PYTHON_SIMPLEJSON_SETUP_TYPE = setuptools
-- 
2.20.1
