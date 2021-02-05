From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri,  5 Feb 2021 09:03:31 +0100
Subject: [Buildroot] [PATCH 1/1] package/python-django: add CPE variables
Message-ID: <20210205080331.1453704-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:djangoproject:django is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Adjangoproject%3Adjango

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-django/python-django.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index 512f2cd89c..a88aa6274a 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -10,6 +10,8 @@ PYTHON_DJANGO_SOURCE = Django-$(PYTHON_DJANGO_VERSION).tar.gz
 PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/32/e3/e7e9a9378321fdfc3eb55de151911dce968fa245d1f16d8c480c63ea4ed1
 PYTHON_DJANGO_LICENSE = BSD-3-Clause
 PYTHON_DJANGO_LICENSE_FILES = LICENSE
+PYTHON_DJANGO_CPE_ID_VENDOR = djangoproject
+PYTHON_DJANGO_CPE_ID_PRODUCT = django
 PYTHON_DJANGO_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
-- 
2.29.2
