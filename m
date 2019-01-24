From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 Jan 2019 12:20:24 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] package/python-django:
 security bump to version 1.11.18
Message-ID: <20190124112114.8157A8CA45@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c0ea5c0ea24f01d1588ce319f6ce1433a034d630
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Fixes CVE-2019-3498: Content spoofing possibility in the default 404 page

For more details, see the announcement:
https://www.djangoproject.com/weblog/2019/jan/04/security-releases/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-django/python-django.hash | 4 ++--
 package/python-django/python-django.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index 6e6e7708db..39a95f258c 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,3 +1,3 @@
-# From https://www.djangoproject.com/m/pgp/Django-1.11.16.checksum.txt
-sha256	29268cc47816a44f27308e60f71da635f549c47d8a1d003b28de55141df75791  Django-1.11.16.tar.gz
+# From https://www.djangoproject.com/m/pgp/Django-1.11.18.checksum.txt
+sha256  73cca1dac154e749b39cc91a54dc876109eb0512a5c6804986495305047066a5  Django-1.11.18.tar.gz
 sha256	b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index 9f43ffab85..31d9e2c92e 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 1.11.16
+PYTHON_DJANGO_VERSION = 1.11.18
 PYTHON_DJANGO_SOURCE = Django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/35/1d/59836bce4c9cfded261e21c0abd6a4629de6d289522d0fd928117d8eb985
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/90/84/7981bdfcfa80fe81df5325899f9fc1cbebce1fbe4fac092a32dca00d0ab2
 PYTHON_DJANGO_LICENSE = BSD-3-Clause
 PYTHON_DJANGO_LICENSE_FILES = LICENSE
 PYTHON_DJANGO_SETUP_TYPE = setuptools
