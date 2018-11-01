From: Asaf Kahlon <asafka7@gmail.com>
Date: Thu,  1 Nov 2018 20:47:35 +0200
Subject: [Buildroot] [PATCH v2 1/1] python-django: bump to version 2.1.3
Message-ID: <20181101184735.22613-1-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-django/python-django.hash | 4 ++--
 package/python-django/python-django.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index 9a9889ab1c..1b8ee83682 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5	383ca4e98ad5d0aa9d71378fe743bdef  Django-2.1.2.tar.gz
-sha256	efbcad7ebb47daafbcead109b38a5bd519a3c3cd92c6ed0f691ff97fcdd16b45  Django-2.1.2.tar.gz
+md5	1a447e95c81e1c9b2a7ad61f4681f022  Django-2.1.3.tar.gz
+sha256	1ffab268ada3d5684c05ba7ce776eaeedef360712358d6a6b340ae9f16486916  Django-2.1.3.tar.gz
 # Locally computed sha256 checksums
 sha256	b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index e3f20fd1cb..29eb0b616b 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 2.1.2
+PYTHON_DJANGO_VERSION = 2.1.3
 PYTHON_DJANGO_SOURCE = Django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/8b/03/4c74d3712919613f2c611e6689522df507a2753a92049009661a81b4b72f
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/93/b1/0d6febb88712c39aced7df232d432fa22f5613c4bff246a1f4841248a60d
 PYTHON_DJANGO_LICENSE = BSD-3-Clause
 PYTHON_DJANGO_LICENSE_FILES = LICENSE
 PYTHON_DJANGO_SETUP_TYPE = setuptools
-- 
2.19.1
