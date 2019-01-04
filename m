From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 4 Jan 2019 21:57:01 +0100
Subject: [Buildroot] [git commit] package/python-django: security bump to
 version 2.1.5
Message-ID: <20190104205330.EEC3F88675@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=86d0ecf07615ff47a11ca6aa4d6aba908d6f359a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes CVE-2019-3498: Content spoofing possibility in the default 404 page

For more details, see the announcement:
https://www.djangoproject.com/weblog/2019/jan/04/security-releases/

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
[Peter: mention that bump fixes security issues]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-django/python-django.hash | 4 ++--
 package/python-django/python-django.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index b6c85922a5..4b932ac907 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5	3afc8bcec941e37221287f1a5323b1f1  Django-2.1.4.tar.gz
-sha256	068d51054083d06ceb32ce02b7203f1854256047a0d58682677dd4f81bceabd7  Django-2.1.4.tar.gz
+md5	9309c48c8b92503b8969a7603a97e2a1  Django-2.1.5.tar.gz
+sha256	d6393918da830530a9516bbbcbf7f1214c3d733738779f06b0f649f49cc698c3  Django-2.1.5.tar.gz
 # Locally computed sha256 checksums
 sha256	b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index 9ce74fbdc5..53e8f20e87 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 2.1.4
+PYTHON_DJANGO_VERSION = 2.1.5
 PYTHON_DJANGO_SOURCE = Django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/83/f7/4939b60c4127d5f49ccb570e34f4c59ecc222949220234a88e4f363f1456
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/5c/7f/4c750e09b246621e5e90fa08f93dec1b991f5c203b0ff615d62a891c8f41
 PYTHON_DJANGO_LICENSE = BSD-3-Clause
 PYTHON_DJANGO_LICENSE_FILES = LICENSE
 PYTHON_DJANGO_SETUP_TYPE = setuptools
