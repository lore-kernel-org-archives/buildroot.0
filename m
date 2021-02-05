From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 5 Feb 2021 20:38:16 +0100
Subject: [Buildroot] [git commit] package/python-flask-cors: add CPE
 variables
Message-ID: <20210205191802.1B429815B7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dbc9a8a02a01115037e9eb4de8fdd18070fb48aa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:flask-cors_project:flask-cors is a valid CPE identifier for
this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aflask-cors_project%3Aflask-cors

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
