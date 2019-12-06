From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 6 Dec 2019 09:36:06 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/python-django:
 security bump to version 2.1.15
Message-ID: <20191206082858.46FC08830A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f9b7ad01c2680f95dce5ae75acbaadd0fbb53fab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Fixes the following security vulnerabilities:

- CVE-2019-19118: Privilege escalation in the Django admin

Additionally, 2.1.12..2.1.14 fixes a number of bugs.

For more details, see the release notes:
https://docs.djangoproject.com/en/dev/releases/2.1.15/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-django/python-django.hash | 4 ++--
 package/python-django/python-django.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index 22a0d9c4d8..213c525f76 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5	42f0d3ccdcd89c566a30765ee0e25d42  Django-2.1.11.tar.gz
-sha256	1a41831eace203fd1939edf899e07d7abd12ce9bafc3d9a5a63a24a8d1d12bd5  Django-2.1.11.tar.gz
+md5	a9d02735cb5722608c08fb2d79350523  Django-2.1.15.tar.gz
+sha256	 a794f7a2f4b7c928eecfbc4ebad03712ff27fb545abe269bf01aa8500781eb1c Django-2.1.15.tar.gz
 # Locally computed sha256 checksums
 sha256	b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index 40a2e96e03..c3e60f8759 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 2.1.11
+PYTHON_DJANGO_VERSION = 2.1.15
 PYTHON_DJANGO_SOURCE = Django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/e0/e9/7e6008abee3eb2a40704c95a5cfc8a9627012df1580289d3df0f34c99766
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/a5/ea/a3424e68851acb44a1f8f823dc32ee3eb10b7fda474b03d527f7e666b443
 PYTHON_DJANGO_LICENSE = BSD-3-Clause
 PYTHON_DJANGO_LICENSE_FILES = LICENSE
 PYTHON_DJANGO_SETUP_TYPE = setuptools
