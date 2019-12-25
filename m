From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Dec 2019 20:56:27 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/python-django:
 bump to version 2.2.6
Message-ID: <20191225194924.1F0A88E3DE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8354cf6993d845f33dc652199edcacdc6e3fa350
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 27973707f794bcc1e3c2be6728e1fc6a55b40b37)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-django/python-django.hash | 4 ++--
 package/python-django/python-django.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index b89ee907d3..0e6b7b2c63 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5	b32e396c354880742d85a7628a0bdd5a  Django-2.2.4.tar.gz
-sha256	16a5d54411599780ac9dfe3b9b38f90f785c51259a584e0b24b6f14a7f69aae8  Django-2.2.4.tar.gz
+md5	796c175a2f94e938c60d84b4565216af  Django-2.2.6.tar.gz
+sha256	a8ca1033acac9f33995eb2209a6bf18a4681c3e5269a878e9a7e0b7384ed1ca3  Django-2.2.6.tar.gz
 # Locally computed sha256 checksums
 sha256	b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index 7dbf7a38fd..1c810b8af7 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 2.2.4
+PYTHON_DJANGO_VERSION = 2.2.6
 PYTHON_DJANGO_SOURCE = Django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/19/11/3449a2071df9427e7a5c4dddee2462e88840dd968a9b0c161097154fcb0c
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/c7/2c/bbd0fddf6a08456c3100b8e8b230f3288d4511985aa4e2368b0d115b5aae
 PYTHON_DJANGO_LICENSE = BSD-3-Clause
 PYTHON_DJANGO_LICENSE_FILES = LICENSE
 PYTHON_DJANGO_SETUP_TYPE = setuptools
