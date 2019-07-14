From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 14 Jul 2019 11:57:22 +0200
Subject: [Buildroot] [git commit] package/python-django: bump to version
 2.2.3
Message-ID: <20190714102157.256B481421@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0ef236c72606d3dcdb0018740c365589e64461bc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See https://docs.djangoproject.com/en/2.2/releases/2.2.3/

Also, 2.2.x is the new LTS series.

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-django/python-django.hash | 4 ++--
 package/python-django/python-django.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index 8cb60adf0c..0d63853aaa 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5	2162aed4111da837433f41a9eed5c8bd  Django-2.1.10.tar.gz
-sha256	65e2a548a52fca560cdd4e35f4fa1a79140f405af48950e59702a37e4227e958  Django-2.1.10.tar.gz
+md5	f152164e77d38460ee06c42c210d2f57  Django-2.2.3.tar.gz
+sha256	4d23f61b26892bac785f07401bc38cbf8fa4cec993f400e9cd9ddf28fd51c0ea  Django-2.2.3.tar.gz
 # Locally computed sha256 checksums
 sha256	b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index 09c178288c..2697f05466 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 2.1.10
+PYTHON_DJANGO_VERSION = 2.2.3
 PYTHON_DJANGO_SOURCE = Django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/be/1b/009ec818adf51c7641f3bd9dae778e8b28291b3ceedb352317b0eeafd7ff
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/d3/20/b447eb3d820e0d05fe83cbfb016842bd8da35f4b0f83498dca43d02aebc3
 PYTHON_DJANGO_LICENSE = BSD-3-Clause
 PYTHON_DJANGO_LICENSE_FILES = LICENSE
 PYTHON_DJANGO_SETUP_TYPE = setuptools
