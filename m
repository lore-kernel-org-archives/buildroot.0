From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 15 May 2021 12:33:55 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-requests: add CPE variables
Message-ID: <20210515103355.2366302-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:python:requests is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Apython%3Arequests

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-requests/python-requests.mk   | 2 ++
 package/python3-requests/python3-requests.mk | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/package/python-requests/python-requests.mk b/package/python-requests/python-requests.mk
index 2b543c0f9a..5d0f545ffb 100644
--- a/package/python-requests/python-requests.mk
+++ b/package/python-requests/python-requests.mk
@@ -11,5 +11,7 @@ PYTHON_REQUESTS_SITE = https://files.pythonhosted.org/packages/6b/47/c14abc08432
 PYTHON_REQUESTS_SETUP_TYPE = setuptools
 PYTHON_REQUESTS_LICENSE = Apache-2.0
 PYTHON_REQUESTS_LICENSE_FILES = LICENSE
+PYTHON_REQUESTS_CPE_ID_VENDOR = python
+PYTHON_REQUESTS_CPE_ID_PRODUCT = requests
 
 $(eval $(python-package))
diff --git a/package/python3-requests/python3-requests.mk b/package/python3-requests/python3-requests.mk
index b67d71a18b..dbb3f21490 100644
--- a/package/python3-requests/python3-requests.mk
+++ b/package/python3-requests/python3-requests.mk
@@ -11,6 +11,8 @@ PYTHON3_REQUESTS_SITE = https://files.pythonhosted.org/packages/6b/47/c14abc0843
 PYTHON3_REQUESTS_SETUP_TYPE = setuptools
 PYTHON3_REQUESTS_LICENSE = Apache-2.0
 PYTHON3_REQUESTS_LICENSE_FILES = LICENSE
+PYTHON3_REQUESTS_CPE_ID_VENDOR = python
+PYTHON3_REQUESTS_CPE_ID_PRODUCT = requests
 HOST_PYTHON3_REQUESTS_DL_SUBDIR = python-requests
 HOST_PYTHON3_REQUESTS_NEEDS_HOST_PYTHON = python3
 
-- 
2.30.2
