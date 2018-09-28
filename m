From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 28 Sep 2018 13:12:06 +0200
Subject: [Buildroot] [git commit] python-jinja2: bump to version 2.10
Message-ID: <20180928111200.230A88A290@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7f7cdf7e4d9c07984ea363d14c3506c406dc5b05
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add license hash.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-jinja2/python-jinja2.hash | 8 +++++---
 package/python-jinja2/python-jinja2.mk   | 4 ++--
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/python-jinja2/python-jinja2.hash b/package/python-jinja2/python-jinja2.hash
index f5a09729c0..fe34f73965 100644
--- a/package/python-jinja2/python-jinja2.hash
+++ b/package/python-jinja2/python-jinja2.hash
@@ -1,3 +1,5 @@
-# md5 from https://pypi.python.org/pypi/jinja2/json, sha256 locally computed
-md5 9e55f0db6620dd99a1b366183a94270d Jinja2-2.9.5.tar.gz
-sha256 702a24d992f856fa8d5a7a36db6128198d0c21e1da34448ca236c42e92384825 Jinja2-2.9.5.tar.gz
+# md5, sha256 from https://pypi.org/pypi/jinja2/json
+md5 61ef1117f945486472850819b8d1eb3d Jinja2-2.10.tar.gz
+sha256 f84be1bb0040caca4cea721fcbbbbd61f9be9464ca236387158b0feea01914a4 Jinja2-2.10.tar.gz
+# Locally computed sha256
+sha256 26fcd436fdc8a39d44896ac03e6f1dfd25e38499c48f20d8bc1dd3bf0aaa8a5b LICENSE
diff --git a/package/python-jinja2/python-jinja2.mk b/package/python-jinja2/python-jinja2.mk
index c7dd4902b0..9ff36972d6 100644
--- a/package/python-jinja2/python-jinja2.mk
+++ b/package/python-jinja2/python-jinja2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_JINJA2_VERSION = 2.9.5
+PYTHON_JINJA2_VERSION = 2.10
 PYTHON_JINJA2_SOURCE = Jinja2-$(PYTHON_JINJA2_VERSION).tar.gz
-PYTHON_JINJA2_SITE = https://pypi.python.org/packages/71/59/d7423bd5e7ddaf3a1ce299ab4490e9044e8dfd195420fc83a24de9e60726
+PYTHON_JINJA2_SITE = https://files.pythonhosted.org/packages/56/e6/332789f295cf22308386cf5bbd1f4e00ed11484299c5d7383378cf48ba47
 PYTHON_JINJA2_SETUP_TYPE = setuptools
 PYTHON_JINJA2_LICENSE = BSD-3-Clause
 PYTHON_JINJA2_LICENSE_FILES = LICENSE
