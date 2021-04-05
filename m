From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon,  5 Apr 2021 18:33:06 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-pillow: add CPE variables
Message-ID: <20210405163306.4153945-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:python:pillow is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Apython%3Apillow

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-pillow/python-pillow.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-pillow/python-pillow.mk b/package/python-pillow/python-pillow.mk
index 60a0bb3e1b..f71fa156e2 100644
--- a/package/python-pillow/python-pillow.mk
+++ b/package/python-pillow/python-pillow.mk
@@ -9,6 +9,8 @@ PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/2b/06/93bf1626ef368
 PYTHON_PILLOW_SOURCE = Pillow-$(PYTHON_PILLOW_VERSION).tar.gz
 PYTHON_PILLOW_LICENSE = PIL Software License
 PYTHON_PILLOW_LICENSE_FILES = LICENSE
+PYTHON_PILLOW_CPE_ID_VENDOR = python
+PYTHON_PILLOW_CPE_ID_PRODUCT = pillow
 PYTHON_PILLOW_SETUP_TYPE = setuptools
 PYTHON_PILLOW_BUILD_OPTS = --disable-platform-guessing
 
-- 
2.30.2
