From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  4 Apr 2021 22:53:04 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-flask: add CPE variables
Message-ID: <20210404205304.3441731-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:palletsprojects:flask is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Apalletsprojects%3Aflask

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-flask/python-flask.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-flask/python-flask.mk b/package/python-flask/python-flask.mk
index cc39bf7e49..077aa600b8 100644
--- a/package/python-flask/python-flask.mk
+++ b/package/python-flask/python-flask.mk
@@ -10,5 +10,7 @@ PYTHON_FLASK_SITE = https://files.pythonhosted.org/packages/4e/0b/cb02268c90e675
 PYTHON_FLASK_SETUP_TYPE = setuptools
 PYTHON_FLASK_LICENSE = BSD-3-Clause
 PYTHON_FLASK_LICENSE_FILES = LICENSE.rst docs/license.rst
+PYTHON_FLASK_CPE_ID_VENDOR = palletsprojects
+PYTHON_FLASK_CPE_ID_PRODUCT = flask
 
 $(eval $(python-package))
-- 
2.30.2
