From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 5 Mar 2021 22:29:19 +0100
Subject: [Buildroot] [git commit] package/python-twisted: add CPE variables
Message-ID: <20210305212717.0C86E8147E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=813a2b3b7765d68933255708b0e40e7b430943fd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:twistedmatrix:twisted is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Atwistedmatrix%3Atwisted

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-twisted/python-twisted.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-twisted/python-twisted.mk b/package/python-twisted/python-twisted.mk
index 2478972f82..49d97af097 100644
--- a/package/python-twisted/python-twisted.mk
+++ b/package/python-twisted/python-twisted.mk
@@ -10,6 +10,8 @@ PYTHON_TWISTED_SITE = https://files.pythonhosted.org/packages/4a/b4/4973c7ccb5be
 PYTHON_TWISTED_SETUP_TYPE = setuptools
 PYTHON_TWISTED_LICENSE = MIT
 PYTHON_TWISTED_LICENSE_FILES = LICENSE
+PYTHON_TWISTED_CPE_ID_VENDOR = twistedmatrix
+PYTHON_TWISTED_CPE_ID_PRODUCT = twisted
 PYTHON_TWISTED_DEPENDENCIES = python-incremental host-python-incremental
 
 $(eval $(python-package))
