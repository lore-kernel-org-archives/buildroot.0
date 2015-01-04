From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Jan 2015 22:08:44 +0100
Subject: [Buildroot] [git commit] python-django: be more specific about the
	license
Message-ID: <20150104210914.4EBEF80104@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=514d713edc02598402aa0ebe7c724aa25b3abcfe
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The license is really a 3 clauses BSD license, so let's specify this
in python-django.mk.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-django/python-django.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index 5837088..fcfa406 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -8,7 +8,7 @@ PYTHON_DJANGO_VERSION = 1.7.2
 PYTHON_DJANGO_SOURCE = Django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
 PYTHON_DJANGO_SITE = https://pypi.python.org/packages/source/D/Django/
-PYTHON_DJANGO_LICENSE = BSD
+PYTHON_DJANGO_LICENSE = BSD-3c
 PYTHON_DJANGO_LICENSE_FILES = LICENSE
 PYTHON_DJANGO_SETUP_TYPE = setuptools
 
