From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 5 Mar 2021 14:00:55 +0100
Subject: [Buildroot] [git commit] package/python-simplejson: add CPE
 variables
Message-ID: <20210305123920.5B38D812C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=42488c58fc3a608980b2651eb92c4fa312c18807
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:simplejson_project:simplejson is a valid CPE identifier for
this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Asimplejson_project%3Asimplejson

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-simplejson/python-simplejson.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-simplejson/python-simplejson.mk b/package/python-simplejson/python-simplejson.mk
index 3e875015a8..cf5bd3a482 100644
--- a/package/python-simplejson/python-simplejson.mk
+++ b/package/python-simplejson/python-simplejson.mk
@@ -9,6 +9,8 @@ PYTHON_SIMPLEJSON_SOURCE = simplejson-$(PYTHON_SIMPLEJSON_VERSION).tar.gz
 PYTHON_SIMPLEJSON_SITE = https://files.pythonhosted.org/packages/98/87/a7b98aa9256c8843f92878966dc3d8d914c14aad97e2c5ce4798d5743e07
 PYTHON_SIMPLEJSON_LICENSE = Academic Free License (AFL), MIT
 PYTHON_SIMPLEJSON_LICENSE_FILES = LICENSE.txt
+PYTHON_SIMPLEJSON_CPE_ID_VENDOR = simplejson_project
+PYTHON_SIMPLEJSON_CPE_ID_PRODUCT = simplejson
 PYTHON_SIMPLEJSON_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
