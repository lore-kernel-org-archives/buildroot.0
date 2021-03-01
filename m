From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon,  1 Mar 2021 18:37:01 +0100
Subject: [Buildroot] [PATCH 1/1] package/python-urllib3: add CPE variables
Message-ID: <20210301173701.206427-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:python:urllib3 is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Apython%3Aurllib3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-urllib3/python-urllib3.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-urllib3/python-urllib3.mk b/package/python-urllib3/python-urllib3.mk
index 1f212ec69e..82db02fcc2 100644
--- a/package/python-urllib3/python-urllib3.mk
+++ b/package/python-urllib3/python-urllib3.mk
@@ -9,6 +9,8 @@ PYTHON_URLLIB3_SOURCE = urllib3-$(PYTHON_URLLIB3_VERSION).tar.gz
 PYTHON_URLLIB3_SITE = https://files.pythonhosted.org/packages/29/e6/d1a1d78c439cad688757b70f26c50a53332167c364edb0134cadd280e234
 PYTHON_URLLIB3_LICENSE = MIT
 PYTHON_URLLIB3_LICENSE_FILES = LICENSE.txt
+PYTHON_URLLIB3_CPE_ID_VENDOR = python
+PYTHON_URLLIB3_CPE_ID_PRODUCT = urllib3
 PYTHON_URLLIB3_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
-- 
2.30.0
