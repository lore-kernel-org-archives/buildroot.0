From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 10 Jan 2020 22:09:10 +0100
Subject: [Buildroot] [git commit] package/python-django: bump version to
 3.0.2
Message-ID: <20200110210808.6EBC888933@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=63dbce0822532be4fe76c3e467486585f8f2c18f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-django/python-django.hash | 4 ++--
 package/python-django/python-django.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index f55f844e33..8a2f967077 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5	12f434ed7ccd6ee57be6f05a45e20e97  Django-3.0.1.tar.gz
-sha256	315b11ea265dd15348d47f2cbb044ef71da2018f6e582fed875c889758e6f844  Django-3.0.1.tar.gz
+md5	24d5364af6b04c4dd173111a3207459a  Django-3.0.2.tar.gz
+sha256	8c3575f81e11390893860d97e1e0154c47512f180ea55bd84ce8fa69ba8051ca  Django-3.0.2.tar.gz
 # Locally computed sha256 checksums
 sha256	b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index 100eb43abe..68f9094fc0 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 3.0.1
+PYTHON_DJANGO_VERSION = 3.0.2
 PYTHON_DJANGO_SOURCE = Django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/44/e8/4ae9ef3d455f4ce5aa22259cb6e40c69b29ef6b02d49c5cdfa265f7fc821
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/c5/c1/5b901e21114b5dd9233726c2975c0aa7e9f48f63e41ec95d8777721d8aff
 PYTHON_DJANGO_LICENSE = BSD-3-Clause
 PYTHON_DJANGO_LICENSE_FILES = LICENSE
 PYTHON_DJANGO_SETUP_TYPE = setuptools
