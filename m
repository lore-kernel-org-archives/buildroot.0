From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon,  5 Apr 2021 12:49:03 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-decorator: add CPE variables
Message-ID: <20210405104903.3567280-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:python:decorator is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Apython%3Adecorator

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-decorator/python-decorator.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-decorator/python-decorator.mk b/package/python-decorator/python-decorator.mk
index ea56b786c4..7c4b353aaa 100644
--- a/package/python-decorator/python-decorator.mk
+++ b/package/python-decorator/python-decorator.mk
@@ -10,6 +10,8 @@ PYTHON_DECORATOR_SITE = https://files.pythonhosted.org/packages/dc/c3/9d378af09f
 PYTHON_DECORATOR_SOURCE = decorator-$(PYTHON_DECORATOR_VERSION).tar.gz
 PYTHON_DECORATOR_LICENSE = BSD-2-Clause
 PYTHON_DECORATOR_LICENSE_FILES = LICENSE.txt
+PYTHON_DECORATOR_CPE_ID_VENDOR = python
+PYTHON_DECORATOR_CPE_ID_PRODUCT = decorator
 PYTHON_DECORATOR_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
-- 
2.30.2
