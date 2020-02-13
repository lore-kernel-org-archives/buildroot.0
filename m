From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 12 Feb 2020 22:56:08 -0700
Subject: [Buildroot] [PATCH 1/1] package/python-simplejson: bump to version
 3.17.0
Message-ID: <20200213055608.76191-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-simplejson/python-simplejson.hash | 4 ++--
 package/python-simplejson/python-simplejson.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-simplejson/python-simplejson.hash b/package/python-simplejson/python-simplejson.hash
index f9d2aaefd3..d89d824d14 100644
--- a/package/python-simplejson/python-simplejson.hash
+++ b/package/python-simplejson/python-simplejson.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/simplejson/json
-md5	744fa99aed207478f8fbf9dd9f04fad3  simplejson-3.16.0.tar.gz
-sha256	b1f329139ba647a9548aa05fb95d046b4a677643070dc2afc05fa2e975d09ca5  simplejson-3.16.0.tar.gz
+md5	8a5ed75c367b90fedc3d685742e2a1c7  simplejson-3.17.0.tar.gz
+sha256	2b4b2b738b3b99819a17feaf118265d0753d5536049ea570b3c43b51c4701e81  simplejson-3.17.0.tar.gz
 # Locally computed sha256 checksums
 sha256	fcaa1e313a99304322e2e0836ea4ee7d839ce9a480438f3922a853edfdde129f  LICENSE.txt
diff --git a/package/python-simplejson/python-simplejson.mk b/package/python-simplejson/python-simplejson.mk
index 20b5b2481b..3e875015a8 100644
--- a/package/python-simplejson/python-simplejson.mk
+++ b/package/python-simplejson/python-simplejson.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SIMPLEJSON_VERSION = 3.16.0
+PYTHON_SIMPLEJSON_VERSION = 3.17.0
 PYTHON_SIMPLEJSON_SOURCE = simplejson-$(PYTHON_SIMPLEJSON_VERSION).tar.gz
-PYTHON_SIMPLEJSON_SITE = https://files.pythonhosted.org/packages/e3/24/c35fb1c1c315fc0fffe61ea00d3f88e85469004713dab488dee4f35b0aff
+PYTHON_SIMPLEJSON_SITE = https://files.pythonhosted.org/packages/98/87/a7b98aa9256c8843f92878966dc3d8d914c14aad97e2c5ce4798d5743e07
 PYTHON_SIMPLEJSON_LICENSE = Academic Free License (AFL), MIT
 PYTHON_SIMPLEJSON_LICENSE_FILES = LICENSE.txt
 PYTHON_SIMPLEJSON_SETUP_TYPE = setuptools
-- 
2.20.1
