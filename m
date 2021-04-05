From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon,  5 Apr 2021 11:31:11 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-validators: add CPE variables
Message-ID: <20210405093111.3530780-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:validators_project:validators is a valid CPE identifier for
this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Avalidators_project%3Avalidators

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-validators/python-validators.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-validators/python-validators.mk b/package/python-validators/python-validators.mk
index 7268b1013b..5bed051911 100644
--- a/package/python-validators/python-validators.mk
+++ b/package/python-validators/python-validators.mk
@@ -10,5 +10,7 @@ PYTHON_VALIDATORS_SITE = https://files.pythonhosted.org/packages/c4/4a/4f9c892f9
 PYTHON_VALIDATORS_SETUP_TYPE = setuptools
 PYTHON_VALIDATORS_LICENSE = MIT
 PYTHON_VALIDATORS_LICENSE_FILES = LICENSE
+PYTHON_VALIDATORS_CPE_ID_VENDOR = validators_project
+PYTHON_VALIDATORS_CPE_ID_PRODUCT = validators
 
 $(eval $(python-package))
-- 
2.30.2
