From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon,  5 Apr 2021 19:30:26 +0200
Subject: [Buildroot] [PATCH 1/2] package/python-py: add CPE variables
Message-ID: <20210405173027.4159626-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:pytest:py is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Apytest%3Apy

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-py/python-py.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-py/python-py.mk b/package/python-py/python-py.mk
index c753183933..2e9d18ab1a 100644
--- a/package/python-py/python-py.mk
+++ b/package/python-py/python-py.mk
@@ -11,5 +11,7 @@ PYTHON_PY_DEPENDENCIES = host-python-setuptools-scm
 PYTHON_PY_SETUP_TYPE = setuptools
 PYTHON_PY_LICENSE = MIT
 PYTHON_PY_LICENSE_FILES = LICENSE
+PYTHON_PY_CPE_ID_VENDOR = pytest
+PYTHON_PY_CPE_ID_PRODUCT = py
 
 $(eval $(python-package))
-- 
2.30.2
