From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Oct 2016 23:00:34 +0200
Subject: [Buildroot] [git commit] package/python-django: bump version to
	1.10.2
Message-ID: <20161005210758.1AC127FF86@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2f8c6b3154318c3d664b62ab9fe13bfe24411174
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-django/python-django.hash | 5 +++--
 package/python-django/python-django.mk   | 4 ++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index f51c9b4..38b303b 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,2 +1,3 @@
-# sha256 from https://www.djangoproject.com/m/pgp/Django-1.7.3.checksum.txt
-sha256 f226fb8aa438456968d403f6739de1cf2dad128db86f66ee2b41dfebe3645c5b	Django-1.7.3.tar.gz
+# md5 from https://pypi.python.org/pypi/django/json, sha256 locally computed
+md5	5342e77374b2acd2eafa86d2bb68f8c9  Django-1.10.2.tar.gz
+sha256	e127f12a0bfb34843b6e8c82f91e26fff6445a7ca91d222c0794174cf97cbce1  Django-1.10.2.tar.gz
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index b67bce4..2a50231 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 1.7.3
+PYTHON_DJANGO_VERSION = 1.10.2
 PYTHON_DJANGO_SOURCE = Django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
-PYTHON_DJANGO_SITE = https://pypi.python.org/packages/source/D/Django
+PYTHON_DJANGO_SITE = https://pypi.python.org/packages/57/9e/59444485f092b6ed4f1931e7d2e13b67fdab967c041d02f58a0d1dab8c23
 PYTHON_DJANGO_LICENSE = BSD-3c
 PYTHON_DJANGO_LICENSE_FILES = LICENSE
 PYTHON_DJANGO_SETUP_TYPE = setuptools
