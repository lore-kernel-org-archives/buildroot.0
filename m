From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Dec 2019 20:55:53 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/python-django:
 bump to version 2.2.3
Message-ID: <20191225194923.F09CF8E3DE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=da01bac9cccb9786eec4ae67a8f4cbd783835329
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

See https://docs.djangoproject.com/en/2.2/releases/2.2.3/

Also, 2.2.x is the new LTS series.

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 0ef236c72606d3dcdb0018740c365589e64461bc)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-django/python-django.hash | 4 ++--
 package/python-django/python-django.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index 213c525f76..0d63853aaa 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5	a9d02735cb5722608c08fb2d79350523  Django-2.1.15.tar.gz
-sha256	 a794f7a2f4b7c928eecfbc4ebad03712ff27fb545abe269bf01aa8500781eb1c Django-2.1.15.tar.gz
+md5	f152164e77d38460ee06c42c210d2f57  Django-2.2.3.tar.gz
+sha256	4d23f61b26892bac785f07401bc38cbf8fa4cec993f400e9cd9ddf28fd51c0ea  Django-2.2.3.tar.gz
 # Locally computed sha256 checksums
 sha256	b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index c3e60f8759..2697f05466 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 2.1.15
+PYTHON_DJANGO_VERSION = 2.2.3
 PYTHON_DJANGO_SOURCE = Django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/a5/ea/a3424e68851acb44a1f8f823dc32ee3eb10b7fda474b03d527f7e666b443
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/d3/20/b447eb3d820e0d05fe83cbfb016842bd8da35f4b0f83498dca43d02aebc3
 PYTHON_DJANGO_LICENSE = BSD-3-Clause
 PYTHON_DJANGO_LICENSE_FILES = LICENSE
 PYTHON_DJANGO_SETUP_TYPE = setuptools
