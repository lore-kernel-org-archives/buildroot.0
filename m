From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon,  5 Apr 2021 12:23:04 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-markdown2: add CPE variables
Message-ID: <20210405102304.3566172-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:python-markdown2_project:python-markdown2 is a valid CPE
identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Apython-markdown2_project%3Apython-markdown2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-markdown2/python-markdown2.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-markdown2/python-markdown2.mk b/package/python-markdown2/python-markdown2.mk
index c7858a3966..e7f446d3aa 100644
--- a/package/python-markdown2/python-markdown2.mk
+++ b/package/python-markdown2/python-markdown2.mk
@@ -10,5 +10,7 @@ PYTHON_MARKDOWN2_SITE = https://files.pythonhosted.org/packages/14/69/c542025f80
 PYTHON_MARKDOWN2_SETUP_TYPE = setuptools
 PYTHON_MARKDOWN2_LICENSE = MIT
 PYTHON_MARKDOWN2_LICENSE_FILES = LICENSE.txt
+PYTHON_MARKDOWN2_CPE_ID_VENDOR = python-markdown2_project
+PYTHON_MARKDOWN2_CPE_ID_PRODUCT = python-markdown2
 
 $(eval $(python-package))
-- 
2.30.2
