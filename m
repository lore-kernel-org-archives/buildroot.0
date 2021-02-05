From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri,  5 Feb 2021 19:18:30 +0100
Subject: [Buildroot] [PATCH 1/1] package/python-flask-cors: add CPE variables
Message-ID: <20210205181830.1658122-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:flask-cors_project:flask-cors is a valid CPE identifier for
this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aflask-cors_project%3Aflask-cors

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-flask-cors/python-flask-cors.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-flask-cors/python-flask-cors.mk b/package/python-flask-cors/python-flask-cors.mk
index d712109002..a057cd458e 100644
--- a/package/python-flask-cors/python-flask-cors.mk
+++ b/package/python-flask-cors/python-flask-cors.mk
@@ -10,5 +10,7 @@ PYTHON_FLASK_CORS_SITE = https://files.pythonhosted.org/packages/99/fc/cd117ea12
 PYTHON_FLASK_CORS_SETUP_TYPE = setuptools
 PYTHON_FLASK_CORS_LICENSE = MIT
 PYTHON_FLASK_CORS_LICENSE_FILES = LICENSE
+PYTHON_FLASK_CORS_CPE_ID_VENDOR = flask-cors_project
+PYTHON_FLASK_CORS_CPE_ID_PRODUCT = flask-cors
 
 $(eval $(python-package))
-- 
2.29.2
