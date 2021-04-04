From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  4 Apr 2021 22:27:33 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-pygments: add CPE variables
Message-ID: <20210404202733.3440668-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:pygments:pygments is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Apygments%3Apygments

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-pygments/python-pygments.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-pygments/python-pygments.mk b/package/python-pygments/python-pygments.mk
index 5d190c4990..bde06c9a8b 100644
--- a/package/python-pygments/python-pygments.mk
+++ b/package/python-pygments/python-pygments.mk
@@ -9,6 +9,8 @@ PYTHON_PYGMENTS_SOURCE = Pygments-$(PYTHON_PYGMENTS_VERSION).tar.gz
 PYTHON_PYGMENTS_SITE = https://files.pythonhosted.org/packages/7e/ae/26808275fc76bf2832deb10d3a3ed3107bc4de01b85dcccbe525f2cd6d1e
 PYTHON_PYGMENTS_LICENSE = BSD-2-Clause
 PYTHON_PYGMENTS_LICENSE_FILES = LICENSE
+PYTHON_PYGMENTS_CPE_ID_VENDOR = pygments
+PYTHON_PYGMENTS_CPE_ID_PRODUCT = pygments
 PYTHON_PYGMENTS_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
-- 
2.30.2
