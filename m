From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Dec 2019 20:56:34 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/python-django:
 security bump to version 2.2.8
Message-ID: <20191225194924.2B20A8E390@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=531fdf65d77991bb6cf0ad404642dffdf9c8120c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Fixes the following security vulnerabilities:

- CVE-2019-19118: Privilege escalation in the Django admin

Additionally, 2.2.8 (and 2.2.7) fixes a number of bugs and adds python 3.8
support.

For more details, see the release notes:
https://docs.djangoproject.com/en/dev/releases/2.2.8/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 6340272e88db87a3917b69228997fcba1a9e37dd)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-django/python-django.hash | 4 ++--
 package/python-django/python-django.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index 0e6b7b2c63..965055f47d 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5	796c175a2f94e938c60d84b4565216af  Django-2.2.6.tar.gz
-sha256	a8ca1033acac9f33995eb2209a6bf18a4681c3e5269a878e9a7e0b7384ed1ca3  Django-2.2.6.tar.gz
+md5	57d965818410a4e00e2267eef66aa9c9  Django-2.2.8.tar.gz
+sha256	a4ad4f6f9c6a4b7af7e2deec8d0cbff28501852e5010d6c2dc695d3d1fae7ca0  Django-2.2.8.tar.gz
 # Locally computed sha256 checksums
 sha256	b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index 1c810b8af7..d541a2c07b 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 2.2.6
+PYTHON_DJANGO_VERSION = 2.2.8
 PYTHON_DJANGO_SOURCE = Django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/c7/2c/bbd0fddf6a08456c3100b8e8b230f3288d4511985aa4e2368b0d115b5aae
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/1c/aa/f618f346b895123be44739b276099a2b418b45b2b7afb5e1071403e8d2e9
 PYTHON_DJANGO_LICENSE = BSD-3-Clause
 PYTHON_DJANGO_LICENSE_FILES = LICENSE
 PYTHON_DJANGO_SETUP_TYPE = setuptools
