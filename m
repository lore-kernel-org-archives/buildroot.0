From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 20 Jul 2021 23:41:59 +0200
Subject: [Buildroot] [git commit] package/python-ubjson: bump to version
 0.16.1
Message-ID: <20210720210839.9F5FA886A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

commit: https://git.buildroot.net/buildroot/commit/?id=18bad642132fda6f423c202e20df31932787885d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update indentation in hash file (two spaces)

https://github.com/Iotic-Labs/py-ubjson/blob/v0.16.1/CHANGELOG

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-ubjson/python-ubjson.hash | 6 +++---
 package/python-ubjson/python-ubjson.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-ubjson/python-ubjson.hash b/package/python-ubjson/python-ubjson.hash
index a7e954ce5d..baf3ce7bdc 100644
--- a/package/python-ubjson/python-ubjson.hash
+++ b/package/python-ubjson/python-ubjson.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/py-ubjson/json
-md5	26c07be8e4c9f2b0ee7c42a9aca118ed  py-ubjson-0.14.0.tar.gz
-sha256	f742c87bccc8653329d3f79b8b3f40d44d11d17cce7f6d7025a73c52ebf91c66  py-ubjson-0.14.0.tar.gz
+md5  0f9f2b4d68ae8e70c6f624b1cdaca161  py-ubjson-0.16.1.tar.gz
+sha256  b9bfb8695a1c7e3632e800fb83c943bf67ed45ddd87cd0344851610c69a5a482  py-ubjson-0.16.1.tar.gz
 # Locally computed sha256 checksums
-sha256	ca182abcb84ad9984c9af2e30cb70c4fe0e1772674355207e8fcdb85e8c5e75f  LICENSE
+sha256  ca182abcb84ad9984c9af2e30cb70c4fe0e1772674355207e8fcdb85e8c5e75f  LICENSE
diff --git a/package/python-ubjson/python-ubjson.mk b/package/python-ubjson/python-ubjson.mk
index 58bba2ac74..93ab9dc139 100644
--- a/package/python-ubjson/python-ubjson.mk
+++ b/package/python-ubjson/python-ubjson.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_UBJSON_VERSION = 0.14.0
+PYTHON_UBJSON_VERSION = 0.16.1
 PYTHON_UBJSON_SOURCE = py-ubjson-$(PYTHON_UBJSON_VERSION).tar.gz
-PYTHON_UBJSON_SITE = https://files.pythonhosted.org/packages/10/31/0d8297c33d681aafa3fe900ca072a96d5acb97e79082fbb593e835376c93
+PYTHON_UBJSON_SITE = https://files.pythonhosted.org/packages/1d/c7/28220d37e041fe1df03e857fe48f768dcd30cd151480bf6f00da8713214a
 PYTHON_UBJSON_LICENSE = Apache-2.0
 PYTHON_UBJSON_LICENSE_FILES = LICENSE
 PYTHON_UBJSON_SETUP_TYPE = setuptools
