From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 15 May 2021 12:24:06 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-engineio: add
 PYTHON_ENGINEIO_CPE_ID_VENDOR
Message-ID: <20210515102406.2365894-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:python-engineio_project:python-engineio is a valid CPE
identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Apython-engineio_project%3Apython-engineio

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-engineio/python-engineio.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-engineio/python-engineio.mk b/package/python-engineio/python-engineio.mk
index d0e073fa95..4f835da0a4 100644
--- a/package/python-engineio/python-engineio.mk
+++ b/package/python-engineio/python-engineio.mk
@@ -9,6 +9,7 @@ PYTHON_ENGINEIO_SITE = https://files.pythonhosted.org/packages/71/5d/620b75396ce
 PYTHON_ENGINEIO_SETUP_TYPE = setuptools
 PYTHON_ENGINEIO_LICENSE = MIT
 PYTHON_ENGINEIO_LICENSE_FILES = LICENSE
+PYTHON_ENGINEIO_CPE_ID_VENDOR = python-engineio_project
 
 ifeq ($(BR2_PACKAGE_PYTHON),y)
 # only needed/valid for python 3.x
-- 
2.30.2
