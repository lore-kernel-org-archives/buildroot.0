From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon,  5 Apr 2021 18:45:36 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-psutil: add CPE variables
Message-ID: <20210405164536.4154610-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:psutil_project:psutil is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Apsutil_project%3Apsutil

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-psutil/python-psutil.mk   | 2 ++
 package/python3-psutil/python3-psutil.mk | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/package/python-psutil/python-psutil.mk b/package/python-psutil/python-psutil.mk
index 19d97a6f97..9dbc472213 100644
--- a/package/python-psutil/python-psutil.mk
+++ b/package/python-psutil/python-psutil.mk
@@ -11,5 +11,7 @@ PYTHON_PSUTIL_SITE = https://files.pythonhosted.org/packages/aa/3e/d18f2c04cf2b5
 PYTHON_PSUTIL_SETUP_TYPE = setuptools
 PYTHON_PSUTIL_LICENSE = BSD-3-Clause
 PYTHON_PSUTIL_LICENSE_FILES = LICENSE
+PYTHON_PSUTIL_CPE_ID_VENDOR = psutil_project
+PYTHON_PSUTIL_CPE_ID_PRODUCT = psutil
 
 $(eval $(python-package))
diff --git a/package/python3-psutil/python3-psutil.mk b/package/python3-psutil/python3-psutil.mk
index febf0d3edb..029e1b1c12 100644
--- a/package/python3-psutil/python3-psutil.mk
+++ b/package/python3-psutil/python3-psutil.mk
@@ -11,6 +11,8 @@ PYTHON3_PSUTIL_SITE = https://files.pythonhosted.org/packages/aa/3e/d18f2c04cf2b
 PYTHON3_PSUTIL_SETUP_TYPE = setuptools
 PYTHON3_PSUTIL_LICENSE = BSD-3-Clause
 PYTHON3_PSUTIL_LICENSE_FILES = LICENSE
+PYTHON3_PSUTIL_CPE_ID_VENDOR = psutil_project
+PYTHON3_PSUTIL_CPE_ID_PRODUCT = psutil
 HOST_PYTHON3_PSUTIL_DL_SUBDIR = python-psutil
 HOST_PYTHON3_PSUTIL_NEEDS_HOST_PYTHON = python3
 
-- 
2.30.2
