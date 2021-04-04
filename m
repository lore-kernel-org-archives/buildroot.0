From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  4 Apr 2021 23:41:26 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-pyjwt: add CPE variables
Message-ID: <20210404214126.3445159-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:pyjwt_project:pyjwt is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Apyjwt_project%3Apyjwt

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-pyjwt/python-pyjwt.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-pyjwt/python-pyjwt.mk b/package/python-pyjwt/python-pyjwt.mk
index 9215911389..942499ea49 100644
--- a/package/python-pyjwt/python-pyjwt.mk
+++ b/package/python-pyjwt/python-pyjwt.mk
@@ -10,5 +10,7 @@ PYTHON_PYJWT_SITE = https://files.pythonhosted.org/packages/14/6d/096dc269d105ba
 PYTHON_PYJWT_SETUP_TYPE = setuptools
 PYTHON_PYJWT_LICENSE = MIT
 PYTHON_PYJWT_LICENSE_FILES = LICENSE
+PYTHON_PYJWT_CPE_ID_VENDOR = pyjwt_project
+PYTHON_PYJWT_CPE_ID_PRODUCT = pyjwt
 
 $(eval $(python-package))
-- 
2.30.2
