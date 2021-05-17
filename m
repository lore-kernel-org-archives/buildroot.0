From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 17 May 2021 23:27:46 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/python-requests:
 add CPE variables
Message-ID: <20210517210058.B66E287C0E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1c2113c95a3857401ba8e62eae2f8cbf9b408d81
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

cpe:2.3:a:python:requests is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Apython%3Arequests

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 6c5cf3788054c078e1650d5c06f0ab36c3438c9b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
 
