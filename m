From: Pierre-Jean Texier <pjtexier@koncepto.io>
Date: Sun, 30 Jun 2019 19:54:04 +0200
Subject: [Buildroot] [PATCH] package/python-django: bump to version 2.2.2
Message-ID: <1561917244-1188-1-git-send-email-pjtexier@koncepto.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 package/python-django/python-django.hash | 4 ++--
 package/python-django/python-django.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index c325116..4172f25 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5	909c2e7761893a922dcf721521d9239e  Django-2.1.9.tar.gz
-sha256	5052def4ff0a84bdf669827fdbd7b7cc1ac058f10232be6b21f37c6824f578da  Django-2.1.9.tar.gz
+md5	c52b05c2bc4898bd68dc0359347fff69  Django-2.2.2.tar.gz
+sha256	753d30d3eb078064d2ddadfea65083c9848074a7f93d7b4dc7fa6b1380d278f5  Django-2.2.2.tar.gz
 # Locally computed sha256 checksums
 sha256	b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index 041822e..e1daae3 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 2.1.9
+PYTHON_DJANGO_VERSION = 2.2.2
 PYTHON_DJANGO_SOURCE = Django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/c1/b3/3cdc60dc2e3c11236539f9470e42c5075a2e9c9f4885f5b4b912e9f19992
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/56/2e/c0495314c0bdcf19d9b888a98ff16a4c58a90dd77ed741f4dbab2cbf7efe
 PYTHON_DJANGO_LICENSE = BSD-3-Clause
 PYTHON_DJANGO_LICENSE_FILES = LICENSE
 PYTHON_DJANGO_SETUP_TYPE = setuptools
-- 
2.7.4
