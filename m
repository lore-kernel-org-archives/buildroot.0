From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon,  5 Apr 2021 13:28:45 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-tornado: add CPE variables
Message-ID: <20210405112845.3569308-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:tornadoweb:tornado is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Atornadoweb%3Atornado

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-tornado/python-tornado.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-tornado/python-tornado.mk b/package/python-tornado/python-tornado.mk
index 15f3b83689..c05a7d65d3 100644
--- a/package/python-tornado/python-tornado.mk
+++ b/package/python-tornado/python-tornado.mk
@@ -9,6 +9,8 @@ PYTHON_TORNADO_SOURCE = tornado-$(PYTHON_TORNADO_VERSION).tar.gz
 PYTHON_TORNADO_SITE = https://files.pythonhosted.org/packages/95/84/119a46d494f008969bf0c775cb2c6b3579d3c4cc1bb1b41a022aa93ee242
 PYTHON_TORNADO_LICENSE = Apache-2.0
 PYTHON_TORNADO_LICENSE_FILES = LICENSE
+PYTHON_TORNADO_CPE_ID_VENDOR = tornadoweb
+PYTHON_TORNADO_CPE_ID_PRODUCT = tornado
 PYTHON_TORNADO_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
-- 
2.30.2
