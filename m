From: Asaf Kahlon <asafka7@gmail.com>
Date: Tue,  5 Feb 2019 22:31:38 +0200
Subject: [Buildroot] [PATCH 1/1] python-dateutil: bump to version 2.8.0
Message-ID: <20190205203138.30668-1-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-dateutil/python-dateutil.hash | 4 ++--
 package/python-dateutil/python-dateutil.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-dateutil/python-dateutil.hash b/package/python-dateutil/python-dateutil.hash
index 353b6e5761..eecba7d35a 100644
--- a/package/python-dateutil/python-dateutil.hash
+++ b/package/python-dateutil/python-dateutil.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-dateutil/json
-md5	6357f8f42cbe0e0e0b1e543f3aad07b7  python-dateutil-2.7.5.tar.gz
-sha256	88f9287c0174266bb0d8cedd395cfba9c58e87e5ad86b2ce58859bc11be3cf02  python-dateutil-2.7.5.tar.gz
+md5	354db28843d949f1bc3e49e8458e22df  python-dateutil-2.8.0.tar.gz
+sha256	c89805f6f4d64db21ed966fda138f8a5ed7a4fdbc1a8ee329ce1b74e3c74da9e  python-dateutil-2.8.0.tar.gz
 # Locally computed sha256 checksums
 sha256	ba00f51a0d92823b5a1cde27d8b5b9d2321e67ed8da9bc163eff96d5e17e577e  LICENSE
diff --git a/package/python-dateutil/python-dateutil.mk b/package/python-dateutil/python-dateutil.mk
index 5e90398331..4c915c8e83 100644
--- a/package/python-dateutil/python-dateutil.mk
+++ b/package/python-dateutil/python-dateutil.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_DATEUTIL_VERSION = 2.7.5
-PYTHON_DATEUTIL_SITE = https://files.pythonhosted.org/packages/0e/01/68747933e8d12263d41ce08119620d9a7e5eb72c876a3442257f74490da0
+PYTHON_DATEUTIL_VERSION = 2.8.0
+PYTHON_DATEUTIL_SITE = https://files.pythonhosted.org/packages/ad/99/5b2e99737edeb28c71bcbec5b5dda19d0d9ef3ca3e92e3e925e7c0bb364c
 PYTHON_DATEUTIL_SETUP_TYPE = setuptools
 PYTHON_DATEUTIL_LICENSE = BSD-3-Clause
 PYTHON_DATEUTIL_LICENSE_FILES = LICENSE
-- 
2.19.1
