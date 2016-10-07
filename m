From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 7 Oct 2016 15:15:19 +0200
Subject: [Buildroot] [git commit] package/python-simplejson: bump version to
	3.8.2
Message-ID: <20161007131551.E549F82262@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f3001aeef5f3888239fe1047d0b5a3917dfdf0d5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-simplejson/python-simplejson.hash | 5 +++--
 package/python-simplejson/python-simplejson.mk   | 8 ++++----
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/python-simplejson/python-simplejson.hash b/package/python-simplejson/python-simplejson.hash
index c0f33b2..19421b8 100644
--- a/package/python-simplejson/python-simplejson.hash
+++ b/package/python-simplejson/python-simplejson.hash
@@ -1,2 +1,3 @@
-# locally computed
-sha256  a80dc90320e1c1b8eaceaaa755ae2aed382d64a59321ae9f6ddbe0321c02878a  simplejson-3.5.3.tar.gz
+# md5 from https://pypi.python.org/pypi/simplejson/json, sha256 locally computed
+md5	53b1371bbf883b129a12d594a97e9a18  simplejson-3.8.2.tar.gz
+sha256	d58439c548433adcda98e695be53e526ba940a4b9c44fb9a05d92cd495cdd47f  simplejson-3.8.2.tar.gz
diff --git a/package/python-simplejson/python-simplejson.mk b/package/python-simplejson/python-simplejson.mk
index 61283b7..703bca2 100644
--- a/package/python-simplejson/python-simplejson.mk
+++ b/package/python-simplejson/python-simplejson.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PYTHON_SIMPLEJSON_VERSION = 3.5.3
+PYTHON_SIMPLEJSON_VERSION = 3.8.2
 PYTHON_SIMPLEJSON_SOURCE = simplejson-$(PYTHON_SIMPLEJSON_VERSION).tar.gz
-PYTHON_SIMPLEJSON_SITE = http://pypi.python.org/packages/source/s/simplejson
-PYTHON_SIMPLEJSON_LICENSE = MIT
+PYTHON_SIMPLEJSON_SITE = https://pypi.python.org/packages/f0/07/26b519e6ebb03c2a74989f7571e6ae6b82e9d7d81b8de6fcdbfc643c7b58
+PYTHON_SIMPLEJSON_LICENSE = Academic Free License (AFL), MIT
 PYTHON_SIMPLEJSON_LICENSE_FILES = LICENSE.txt
-PYTHON_SIMPLEJSON_SETUP_TYPE = distutils
+PYTHON_SIMPLEJSON_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
