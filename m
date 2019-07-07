From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 7 Jul 2019 08:45:30 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/python-django:
 security bump to version 2.1.10
Message-ID: <20190707064354.4E1ED81684@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=920e467980e3d697fe98fdb2a8984706dbc75bc3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Fixes the following security vulnerabilities:

CVE-2019-12781: Incorrect HTTP detection with reverse-proxy connecting via
HTTPS

For more details, see the announcement:
https://www.djangoproject.com/weblog/2019/jul/01/security-releases/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 9f87b3785fe15d0b57f9b1820456b29f3c6a7284)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-django/python-django.hash | 4 ++--
 package/python-django/python-django.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index c325116779..8cb60adf0c 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5	909c2e7761893a922dcf721521d9239e  Django-2.1.9.tar.gz
-sha256	5052def4ff0a84bdf669827fdbd7b7cc1ac058f10232be6b21f37c6824f578da  Django-2.1.9.tar.gz
+md5	2162aed4111da837433f41a9eed5c8bd  Django-2.1.10.tar.gz
+sha256	65e2a548a52fca560cdd4e35f4fa1a79140f405af48950e59702a37e4227e958  Django-2.1.10.tar.gz
 # Locally computed sha256 checksums
 sha256	b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index 041822ea13..09c178288c 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 2.1.9
+PYTHON_DJANGO_VERSION = 2.1.10
 PYTHON_DJANGO_SOURCE = Django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/c1/b3/3cdc60dc2e3c11236539f9470e42c5075a2e9c9f4885f5b4b912e9f19992
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/be/1b/009ec818adf51c7641f3bd9dae778e8b28291b3ceedb352317b0eeafd7ff
 PYTHON_DJANGO_LICENSE = BSD-3-Clause
 PYTHON_DJANGO_LICENSE_FILES = LICENSE
 PYTHON_DJANGO_SETUP_TYPE = setuptools
