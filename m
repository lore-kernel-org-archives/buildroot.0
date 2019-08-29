From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 29 Aug 2019 22:25:20 +0200
Subject: [Buildroot] [git commit] package/python-xlwt: bump to version 1.3.0
Message-ID: <20190903133623.EB4B48A52E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=de9ccc2398d294d67e4d6c48d75a77c84929a497
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-xlwt/python-xlwt.hash | 6 +++---
 package/python-xlwt/python-xlwt.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-xlwt/python-xlwt.hash b/package/python-xlwt/python-xlwt.hash
index 4523887052..7e4c992b13 100644
--- a/package/python-xlwt/python-xlwt.hash
+++ b/package/python-xlwt/python-xlwt.hash
@@ -1,3 +1,3 @@
-# md5 from https://pypi.python.org/pypi/xlwt/json, sha256 locally computed
-md5 1f2673a93c221f0195f342c578f04968 xlwt-1.2.0.tar.gz
-sha256 505669c1eb6a60823fd3e2e723b60eea95f2c56254113bf163091ed2bedb4ac9 xlwt-1.2.0.tar.gz
+# md5, sha256 from https://pypi.org/pypi/xlwt/json
+md5	4b1ca8a3cef3261f4b4dc3f138e383a8  xlwt-1.3.0.tar.gz
+sha256	c59912717a9b28f1a3c2a98fd60741014b06b043936dcecbc113eaaada156c88  xlwt-1.3.0.tar.gz
diff --git a/package/python-xlwt/python-xlwt.mk b/package/python-xlwt/python-xlwt.mk
index f8a298a484..aaeeffc501 100644
--- a/package/python-xlwt/python-xlwt.mk
+++ b/package/python-xlwt/python-xlwt.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_XLWT_VERSION = 1.2.0
+PYTHON_XLWT_VERSION = 1.3.0
 PYTHON_XLWT_SOURCE = xlwt-$(PYTHON_XLWT_VERSION).tar.gz
-PYTHON_XLWT_SITE = https://pypi.python.org/packages/5b/8d/22b9ec552a1d7865de39f54bd15f9db09c72a6bf8ab77b11dcce4ae336bb
+PYTHON_XLWT_SITE = https://files.pythonhosted.org/packages/06/97/56a6f56ce44578a69343449aa5a0d98eefe04085d69da539f3034e2cd5c1
 PYTHON_XLWT_SETUP_TYPE = setuptools
 PYTHON_XLWT_LICENSE = BSD-3-Clause, BSD-4-Clause
 PYTHON_XLWT_LICENSE_FILES = docs/licenses.rst
